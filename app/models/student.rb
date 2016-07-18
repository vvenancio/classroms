class Student < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 45 }
  validates :register_number, presence: true, length: { maximum: 45 }
  validates :status, presence: true, numericality: { only_integer: true }
end