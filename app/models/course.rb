class Course < ActiveRecord::Base
  has_enumeration_for :status, with: DefaultStatus

  validates :name, presence: true, length: { maximum: 45 }
  validates :description, presence: true, length: { maximum: 45 }
  validates :status, presence: true, numericality: { only_integer: true }
end