require 'rails_helper'

RSpec.describe "ranks/show", :type => :view do
  before(:each) do
    @rank = assign(:rank, Rank.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
