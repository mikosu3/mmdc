require 'rails_helper'

RSpec.describe "credits/index", :type => :view do
  before(:each) do
    assign(:credits, [
      Credit.create!(
        :index => "Index",
        :edit => "Edit"
      ),
      Credit.create!(
        :index => "Index",
        :edit => "Edit"
      )
    ])
  end

  it "renders a list of credits" do
    render
    assert_select "tr>td", :text => "Index".to_s, :count => 2
    assert_select "tr>td", :text => "Edit".to_s, :count => 2
  end
end
