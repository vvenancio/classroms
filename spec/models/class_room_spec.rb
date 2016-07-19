require 'rails_helper'

RSpec.describe ClassRoom, type: :model do
  subject { create(:class_room) }

  context 'with validations' do
    it { is_expected.to validate_uniqueness_of(:student_id).scoped_to(:course_id) }
    it { is_expected.to validate_presence_of(:entry_at) }
  end

  context 'with associations' do
    it { is_expected.to belong_to(:course) }
    it { is_expected.to belong_to(:student) }
  end

  context 'with delegations' do
    it { is_expected.to delegate_method(:name).to(:student).with_prefix(:student) }
    it { is_expected.to delegate_method(:name).to(:course).with_prefix(:course) }
  end
end