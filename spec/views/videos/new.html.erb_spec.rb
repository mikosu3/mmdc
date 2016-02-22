require 'rails_helper'

RSpec.describe "videos/new", :type => :view do
  before(:each) do
    assign(:video, Video.new())
  end

  it "renders new video form" do
    render

    assert_select "form[action=?][method=?]", videos_path, "post" do
    end
  end
end
