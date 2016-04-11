require 'rails_helper'

RSpec.describe Tag, :type => :model do
  let(:tag) { FactoryGirl.build(:tag) }
  subject { tag }

  it { should validate_presence_of(:name) }
  it { should belong_to(:board) }
  it { should validate_presence_of(:color) }
end
