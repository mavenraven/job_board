require 'pry'
namespace :db do
  desc "Loads a bunch of sample data into the database"
  task :load_sample_data, [:num_companies, :num_jobs] => :environment do |t, args|
    if not Rails.env.development?
      raise 'Task should only be run in development'
    end

    args.with_defaults(num_companies: 10, num_jobs: 100)

    companies = []
    args[:num_companies].times do |i|
      companies << Company.find_or_create_by!(id: i+1) do |c|
        c.name = Faker::Company.name
        c.hq = Faker::Address.full_address
        c.city = Faker::Address.city
        c.state = Faker::Address.state
        c.logo_url = Faker::Company.logo if [true, true, false].sample
        c.website_url = Faker::Internet.url
        c.email = Faker::Internet.email
        c.description = Faker::Lorem.paragraph(sentence_count: 10)
      end
    end

    args[:num_jobs].times do |i|
      Job.find_or_create_by!(id: i+1) do |j|
        j.contact = Faker::Internet.email
        j.description = Faker::Lorem.paragraph(sentence_count: 30)
        j.title = Faker::Job.title
        j.company = companies.sample
        j.created_at = Faker::Date.backward(days: 10)

        if [true, true, false].sample
          j.salary_type = "yearly"
          j.salary_min = (50_000..80_000).step(10000).to_a.sample
          j.salary_max = (80_000..120_000).step(10000).to_a.sample
        else
          j.salary_type = "hourly"
          j.salary_min = (50..80).step(10).to_a.sample
          j.salary_max = (80..120).step(10).to_a.sample
        end
      end
    end
  end
end

