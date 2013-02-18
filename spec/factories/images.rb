FactoryGirl.define do
  factory :image do
    photo
    original true
    mime_type 'image/jpeg'
    size 22_469
    width 275
    height 312
  end
end
