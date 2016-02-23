require 'rails_helper'

RSpec.describe "credits/edit", :type => :view do
  before(:each) do
    @credit = assign(:credit, Credit.create!(
      :index => "MyString",
      :edit => "MyString"
    ))
  end

  it "renders the edit credit form" do
    render

    assert_select "form[action=?][method=?]", credit_path(@credit), "post" do

      assert_select "input#credit_index[name=?]", "credit[index]"

      assert_select "input#credit_edit[name=?]", "credit[edit]"
    end
  end
end
