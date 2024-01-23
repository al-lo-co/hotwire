# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'contacts/new', type: :view do
  before(:each) do
    assign(:contact, Contact.new(
                       identifier: 'MyString'
                     ))
  end

  it 'renders new contact form' do
    render

    assert_select 'form[action=?][method=?]', contacts_path, 'post' do
      assert_select 'input[name=?]', 'contact[identifier]'
    end
  end
end
