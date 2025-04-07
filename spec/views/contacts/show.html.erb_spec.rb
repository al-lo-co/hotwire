# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'contacts/show', type: :view do
  before(:each) do
    assign(:contact, Contact.create!(
                       identifier: 'Identifier'
                     ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Identifier/)
  end
end
