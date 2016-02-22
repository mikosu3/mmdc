require 'rails_helper'

RSpec.describe "infos/new", :type => :view do
  before(:each) do
    assign(:info, Info.new(
      :title => "MyString",
      :note => "MyText",
      :lock_version => 1
    ))
  end

  it "renders new info form" do
    render

    assert_select "form[action=?][method=?]", infos_path, "post" do

      assert_select "input#info_title[name=?]", "info[title]"

      assert_select "textarea#info_note[name=?]", "info[note]"

      assert_select "input#info_lock_version[name=?]", "info[lock_version]"
    end
  end
end
