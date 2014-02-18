require 'spec_helper'

describe Exercise do

  let(:exercise) { FactoryGirl.create(:exercise) }
  subject { exercise }

  it { should respond_to(:exercise_type_id) }
  it { should respond_to(:user) }
  it { should respond_to(:result) }
  it { should be_valid }

  describe "when exercise_type_id is not present" do
    before { exercise.exercise_type_id = " " }
    it { should_not be_valid }
  end
  
  describe "when a exercise is deleted" do
    # results are deleted
    # user win_counts are adjusted
    
  end
  
end