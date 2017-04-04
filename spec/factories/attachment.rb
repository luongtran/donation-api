FactoryGirl.define do
  factory :attachment do
    file do
      fixture_file_upload "#{Rails.root}/spec/fixtures/avatar.png", 'image/png'
    end
    attachmentable factory: :service
  end
end
