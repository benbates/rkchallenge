require 'spec_helper'

describe User do

  let(:user) { FactoryGirl.create(:user) }
  let(:exercise) { FactoryGirl.create(:exercise) }  
  subject { user }

  it { should respond_to(:name) }
  it { should respond_to(:results) }
  it { should respond_to(:exercises) }
  it { should be_valid }

  describe "when name is not present" do
    before { user.name = " " }
    it { should_not be_valid }
  end
  
  describe "with results" do
    let!(:result_one) { user.results.create exercise_id: exercise.id, winner: true, score: 55 }
    before do
      result_one.user.reload
      @orig_win_count = result_one.user.win_count
    end

    describe "when new result is added" do
      # user.win_count should increase by 1
      before do
        @result_two = user.results.create! exercise_id: exercise.id, winner: true, score: 55  
        result_one.user.reload  
      end
      it { result_one.user.win_count.should == (@orig_win_count + 1) }
    end
  
    describe "when result is saved" do
      # user.win_count should remain the same
      before do
        result_one.save
        result_one.user.reload
      end
      it { result_one.user.win_count.should == @orig_win_count }
    end
  
    describe "when result is deleted" do
      # user.win_count should decrease by 1
      before do
        result_one.destroy
        result_one.user.reload
      end
      it { result_one.user.win_count.should == (@orig_win_count - 1) }
    end
  end
end