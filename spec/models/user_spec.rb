require 'rails_helper'

RSpec.describe User, type: :model do
    let(:user) { create(:user) }
    
    ##it { is_expected.to have_many(:wikis) }
    
    describe "attributes" do
        it "should have username and email attributes" do
            expect(user).to have_attributes(username: user.username, email: user.email)
        end
    end
    
    ##describe "invalid user" do
    ##    let(:user_with_invalid_email) { create(:user, email: "") }
        
    ##    it "should be an invalid user due to blank email" do
    ##    expect(user_with_invalid_email).to_not be_valid
    ##    end
    ##end
end
