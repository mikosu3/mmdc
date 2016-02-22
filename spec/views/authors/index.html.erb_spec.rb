require 'rails_helper'

RSpec.describe "authors/index", :type => :view do
  before(:each) do
    assign(:authors, [
      Author.create!(
        :credit => nil,
        :name => "Name",
        :url => "Url",
        :twitter => "Twitter",
        :pixiv => "Pixiv",
        :email => "Email",
        :lock_version => 1
      ),
      Author.create!(
        :credit => nil,
        :name => "Name",
        :url => "Url",
        :twitter => "Twitter",
        :pixiv => "Pixiv",
        :email => "Email",
        :lock_version => 1
      )
    ])
  end

  it "renders a list of authors" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Twitter".to_s, :count => 2
    assert_select "tr>td", :text => "Pixiv".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
