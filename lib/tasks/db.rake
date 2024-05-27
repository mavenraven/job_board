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
        c.logo_url = Faker::Company.logo
        c.website_url = Faker::Internet.url
        c.email = Faker::Internet.email
        c.description = Faker::Lorem.paragraph(sentence_count: 10)
      end
    end

    args[:num_jobs].times do |i|
      job = Job.find_or_create_by!(id: i+1) do |j|
        j.contact = Faker::Internet.email
        j.description = Faker::Lorem.paragraph(sentence_count: 30)
        j.employment_type = "Full"
        j.salary_range = "TODO"
        j.title = Faker::Job.title
        j.company = companies.sample
      end
    end
  end
end
