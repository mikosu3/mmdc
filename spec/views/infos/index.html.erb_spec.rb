require 'rails_helper'

RSpec.describe "infos/index", :type => :view do
  before(:each) do
    assign(:infos, [
      Info.create!(
        :title => "Title",
        :note => "MyText",
        :lock_version => 1
      ),
      Info.create!(
        :title => "Title",
        :note => "MyText",
        :lock_version => 1
      )
    ])
  end

  it "renders a list of infos" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
