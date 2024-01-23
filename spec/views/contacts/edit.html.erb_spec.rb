# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'contacts/edit', type: :view do
  let(:contact) do
    Contact.create!(
      identifier: 'MyString'
    )
  end

  before(:each) do
    assign(:contact, contact)
  end

  it 'renders the edit contact form' do
    render

    assert_select 'form[action=?][method=?]', contact_path(contact), 'post' do
      assert_select 'input[name=?]', 'contact[identifier]'
    end
  end
end
