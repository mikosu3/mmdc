require 'rails_helper'

RSpec.describe "emms/new", :type => :view do
  before(:each) do
    assign(:emm, Emm.new(
      :original_name => "MyString",
      :save_file_name => "MyString",
      :lock_version => 1,
      :user => nil
    ))
  end

  it "renders new emm form" do
    render

    assert_select "form[action=?][method=?]", emms_path, "post" do

      assert_select "input#emm_original_name[name=?]", "emm[original_name]"

      assert_select "input#emm_save_file_name[name=?]", "emm[save_file_name]"

      assert_select "input#emm_lock_version[name=?]", "emm[lock_version]"

      assert_select "input#emm_user_id[name=?]", "emm[user_id]"
    end
  end
end
