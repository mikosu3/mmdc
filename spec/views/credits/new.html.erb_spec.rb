require 'rails_helper'

RSpec.describe "credits/new", :type => :view do
  before(:each) do
    assign(:credit, Credit.new(
      :index => "MyString",
      :edit => "MyString"
    ))
  end

  it "renders new credit form" do
    render

    assert_select "form[action=?][method=?]", credits_path, "post" do

      assert_select "input#credit_index[name=?]", "credit[index]"

      assert_select "input#credit_edit[name=?]", "credit[edit]"
    end
  end
end
