require 'rails_helper'

RSpec.describe "authors/show", :type => :view do
  before(:each) do
    @author = assign(:author, Author.create!(
      :credit => nil,
      :name => "Name",
      :url => "Url",
      :twitter => "Twitter",
      :pixiv => "Pixiv",
      :email => "Email",
      :lock_version => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/Twitter/)
    expect(rendered).to match(/Pixiv/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/1/)
  end
end
