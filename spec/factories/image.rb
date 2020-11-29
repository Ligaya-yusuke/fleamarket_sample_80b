FactoryBot.define do
  factory :image do
    src {Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/CB400.jpg')) }
  end
end