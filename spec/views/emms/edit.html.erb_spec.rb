require 'rails_helper'

RSpec.describe "emms/edit", :type => :view do
  before(:each) do
    @emm = assign(:emm, Emm.create!(
      :original_name => "MyString",
      :save_file_name => "MyString",
      :lock_version => 1,
      :user => nil
    ))
  end

  it "renders the edit emm form" do
    render

    assert_select "form[action=?][method=?]", emm_path(@emm), "post" do

      assert_select "input#emm_original_name[name=?]", "emm[original_name]"

      assert_select "input#emm_save_file_name[name=?]", "emm[save_file_name]"

      assert_select "input#emm_lock_version[name=?]", "emm[lock_version]"

      assert_select "input#emm_user_id[name=?]", "emm[user_id]"
    end
  end
end
