require 'rails_helper'

RSpec.describe Student, type: :model do
  context 'with validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(45) }
    it { is_expected.to validate_presence_of(:register_number) }
    it { is_expected.to validate_length_of(:register_number).is_at_most(45) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_numericality_of(:status).only_integer }
  end

  context 'with association' do
    it { is_expected.to have_many(:class_rooms) }
  end
end