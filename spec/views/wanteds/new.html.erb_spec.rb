require 'rails_helper'

RSpec.describe "wanteds/new", :type => :view do
  before(:each) do
    assign(:wanted, Wanted.new(
      :file_name => "MyString",
      :folder_name => "MyString",
      :extension => "MyString",
      :lock_version => 1
    ))
  end

  it "renders new wanted form" do
    render

    assert_select "form[action=?][method=?]", wanteds_path, "post" do

      assert_select "input#wanted_file_name[name=?]", "wanted[file_name]"

      assert_select "input#wanted_folder_name[name=?]", "wanted[folder_name]"

      assert_select "input#wanted_extension[name=?]", "wanted[extension]"

      assert_select "input#wanted_lock_version[name=?]", "wanted[lock_version]"
    end
  end
end
