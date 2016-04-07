require 'rails_helper'

RSpec.describe "ranks/new", :type => :view do
  before(:each) do
    assign(:rank, Rank.new())
  end

  it "renders new rank form" do
    render

    assert_select "form[action=?][method=?]", ranks_path, "post" do
    end
  end
end
