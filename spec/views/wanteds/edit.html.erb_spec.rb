require 'rails_helper'

RSpec.describe "wanteds/edit", :type => :view do
  before(:each) do
    @wanted = assign(:wanted, Wanted.create!(
      :file_name => "MyString",
      :folder_name => "MyString",
      :extension => "MyString",
      :lock_version => 1
    ))
  end

  it "renders the edit wanted form" do
    render

    assert_select "form[action=?][method=?]", wanted_path(@wanted), "post" do

      assert_select "input#wanted_file_name[name=?]", "wanted[file_name]"

      assert_select "input#wanted_folder_name[name=?]", "wanted[folder_name]"

      assert_select "input#wanted_extension[name=?]", "wanted[extension]"

      assert_select "input#wanted_lock_version[name=?]", "wanted[lock_version]"
    end
  end
end
