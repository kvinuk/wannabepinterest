require 'rails_helper'

RSpec.describe Board, :type => :model do
  let(:board) { FactoryGirl.build(:board) }
  subject { board }

  it { should validate_presence_of(:name) }
  it { should belong_to(:user) }
end
