require 'rails_helper'

RSpec.describe "journeys/show", :type => :view do
  before(:each) do
    @journey = assign(:journey, Journey.create!(
      :title => "Title",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
