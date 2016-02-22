require 'rails_helper'

RSpec.describe "videos/show", :type => :view do
  before(:each) do
    @video = assign(:video, Video.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
