require 'rails_helper'

RSpec.describe "authors/index", type: :view do
  before(:each) do
    assign(:authors, [
      Author.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :homepage => "Homepage"
      ),
      Author.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :homepage => "Homepage"
      )
    ])
  end

  it "renders a list of authors" do
    render
    assert_select "tr>td", :text => "First Name Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Homepage".to_s, :count => 2
  end

  it "has a link to add author" do
    render

    assert_select '<a href=?', text: 'Add author'
  end
end
