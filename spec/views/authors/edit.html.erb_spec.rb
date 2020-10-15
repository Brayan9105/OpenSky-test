require 'rails_helper'

RSpec.describe "authors/edit", type: :view do
  before(:each) do
    @author = assign(:author, Author.create!(
      name: "MyString",
      age: 1,
      country: nil
    ))
  end

  it "renders the edit author form" do
    render

    assert_select "form[action=?][method=?]", author_path(@author), "post" do

      assert_select "input[name=?]", "author[name]"

      assert_select "input[name=?]", "author[age]"

      assert_select "input[name=?]", "author[country_id]"
    end
  end
end
