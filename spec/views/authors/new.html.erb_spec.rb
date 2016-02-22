require 'rails_helper'

RSpec.describe "authors/new", :type => :view do
  before(:each) do
    assign(:author, Author.new(
      :credit => nil,
      :name => "MyString",
      :url => "MyString",
      :twitter => "MyString",
      :pixiv => "MyString",
      :email => "MyString",
      :lock_version => 1
    ))
  end

  it "renders new author form" do
    render

    assert_select "form[action=?][method=?]", authors_path, "post" do

      assert_select "input#author_credit_id[name=?]", "author[credit_id]"

      assert_select "input#author_name[name=?]", "author[name]"

      assert_select "input#author_url[name=?]", "author[url]"

      assert_select "input#author_twitter[name=?]", "author[twitter]"

      assert_select "input#author_pixiv[name=?]", "author[pixiv]"

      assert_select "input#author_email[name=?]", "author[email]"

      assert_select "input#author_lock_version[name=?]", "author[lock_version]"
    end
  end
end
