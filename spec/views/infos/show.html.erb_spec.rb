require 'rails_helper'

RSpec.describe "infos/show", :type => :view do
  before(:each) do
    @info = assign(:info, Info.create!(
      :title => "Title",
      :note => "MyText",
      :lock_version => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
  end
end
