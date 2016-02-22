require 'rails_helper'

RSpec.describe "videos/index", :type => :view do
  before(:each) do
    assign(:videos, [
      Video.create!(),
      Video.create!()
    ])
  end

  it "renders a list of videos" do
    render
  end
end
