require 'rails_helper'

RSpec.describe Wiki, type: :model do
    let(:user) { create(:user) }
    ##let(:my_wiki) { Wiki.create!(title: 'verservv', body: 'servsrebrbeb', private: false, user: my_user) }
    let(:wiki) { create(:wiki, user: user) }
    
    describe "attributes" do
        it "should have title, body and user attributes" do
            ##expect(my_wiki).to have_attributes(title: 'verservv', body: 'servsrebrbeb', user: my_user)
            expect(wiki).to have_attributes(title: wiki.title, body: wiki.body, user: user)
        end
    end
end
