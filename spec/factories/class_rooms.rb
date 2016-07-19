FactoryGirl.define do
  factory :class_room do
    student
    course
    entry_at { Time.now }
  end
end