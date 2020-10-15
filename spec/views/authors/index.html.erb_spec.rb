require 'rails_helper'

RSpec.describe "authors/index", type: :view do
  before(:each) do
    assign(:authors, [
      Author.create!(
        name: "Name",
        age: 2,
        country: nil
      ),
      Author.create!(
        name: "Name",
        age: 2,
        country: nil
      )
    ])
  end

  it "renders a list of authors" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
