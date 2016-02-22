require 'rails_helper'

RSpec.describe "emms/show", :type => :view do
  before(:each) do
    @emm = assign(:emm, Emm.create!(
      :original_name => "Original Name",
      :save_file_name => "Save File Name",
      :lock_version => 1,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Original Name/)
    expect(rendered).to match(/Save File Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
  end
end
