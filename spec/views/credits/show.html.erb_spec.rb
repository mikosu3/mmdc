require 'rails_helper'

RSpec.describe "credits/show", :type => :view do
  before(:each) do
    @credit = assign(:credit, Credit.create!(
      :index => "Index",
      :edit => "Edit"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Index/)
    expect(rendered).to match(/Edit/)
  end
end
