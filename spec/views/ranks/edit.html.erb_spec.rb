require 'rails_helper'

RSpec.describe "ranks/edit", :type => :view do
  before(:each) do
    @rank = assign(:rank, Rank.create!())
  end

  it "renders the edit rank form" do
    render

    assert_select "form[action=?][method=?]", rank_path(@rank), "post" do
    end
  end
end
