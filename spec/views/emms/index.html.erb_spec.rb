require 'rails_helper'

RSpec.describe "emms/index", :type => :view do
  before(:each) do
    assign(:emms, [
      Emm.create!(
        :original_name => "Original Name",
        :save_file_name => "Save File Name",
        :lock_version => 1,
        :user => nil
      ),
      Emm.create!(
        :original_name => "Original Name",
        :save_file_name => "Save File Name",
        :lock_version => 1,
        :user => nil
      )
    ])
  end

  it "renders a list of emms" do
    render
    assert_select "tr>td", :text => "Original Name".to_s, :count => 2
    assert_select "tr>td", :text => "Save File Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
