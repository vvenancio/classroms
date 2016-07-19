class ClassRoom < ActiveRecord::Base
  belongs_to :course
  belongs_to :student

  validates :student_id , uniqueness: { scope: :course_id }
  validates :entry_at, presence: true
end