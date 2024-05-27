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
      companies << Company.upsert(
        {
          id: i + 1,
          name: Faker::Company.name,
          hq: Faker::Address.full_address,
          logo_url: Faker::Company.logo,
          website_url: Faker::Internet.url,
          email: Faker::Internet.email,
          description: Faker::Lorem.paragraph(sentence_count: 10)
        }, unique_by: :id
      )
    end

    args[:num_jobs].times do |i|
    c = companies.sample
    Job.upsert(
      {
        id: i + 1,

      }
    )
    end
  end
end
