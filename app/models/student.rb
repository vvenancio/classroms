class Student < ActiveRecord::Base
  has_enumeration_for :status, with: DefaultStatus

  validates :name, presence: true, length: { maximum: 45 }
  validates :register_number, presence: true, length: { maximum: 45 }
  validates :status, presence: true, numericality: { only_integer: true }

  has_many :class_rooms
end