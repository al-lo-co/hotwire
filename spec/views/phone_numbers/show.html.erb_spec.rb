# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'phone_numbers/show', type: :view do
  before(:each) do
    assign(:phone_number, PhoneNumber.create!(
                            number: 'Number',
                            contact: nil
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Number/)
    expect(rendered).to match(//)
  end
end
