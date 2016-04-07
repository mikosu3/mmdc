require 'rails_helper'

RSpec.describe "ranks/index", :type => :view do
  before(:each) do
    assign(:ranks, [
      Rank.create!(),
      Rank.create!()
    ])
  end

  it "renders a list of ranks" do
    render
  end
end
