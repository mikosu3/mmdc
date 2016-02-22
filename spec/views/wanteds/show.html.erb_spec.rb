require 'rails_helper'

RSpec.describe "wanteds/show", :type => :view do
  before(:each) do
    @wanted = assign(:wanted, Wanted.create!(
      :file_name => "File Name",
      :folder_name => "Folder Name",
      :extension => "Extension",
      :lock_version => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/File Name/)
    expect(rendered).to match(/Folder Name/)
    expect(rendered).to match(/Extension/)
    expect(rendered).to match(/1/)
  end
end
