require 'rails_helper'

RSpec.describe "infos/edit", :type => :view do
  before(:each) do
    @info = assign(:info, Info.create!(
      :title => "MyString",
      :note => "MyText",
      :lock_version => 1
    ))
  end

  it "renders the edit info form" do
    render

    assert_select "form[action=?][method=?]", info_path(@info), "post" do

      assert_select "input#info_title[name=?]", "info[title]"

      assert_select "textarea#info_note[name=?]", "info[note]"

      assert_select "input#info_lock_version[name=?]", "info[lock_version]"
    end
  end
end
