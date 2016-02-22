require 'rails_helper'

RSpec.describe "wanteds/index", :type => :view do
  before(:each) do
    assign(:wanteds, [
      Wanted.create!(
        :file_name => "File Name",
        :folder_name => "Folder Name",
        :extension => "Extension",
        :lock_version => 1
      ),
      Wanted.create!(
        :file_name => "File Name",
        :folder_name => "Folder Name",
        :extension => "Extension",
        :lock_version => 1
      )
    ])
  end

  it "renders a list of wanteds" do
    render
    assert_select "tr>td", :text => "File Name".to_s, :count => 2
    assert_select "tr>td", :text => "Folder Name".to_s, :count => 2
    assert_select "tr>td", :text => "Extension".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
