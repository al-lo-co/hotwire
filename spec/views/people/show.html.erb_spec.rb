# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'people/show', type: :view do
  before(:each) do
    assign(:person, Person.create!(
                      name: 'Name',
                      contact: nil
                    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
