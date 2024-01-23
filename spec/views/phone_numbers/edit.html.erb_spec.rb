# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'phone_numbers/edit', type: :view do
  let(:phone_number) do
    PhoneNumber.create!(
      number: 'MyString',
      contact: nil
    )
  end

  before(:each) do
    assign(:phone_number, phone_number)
  end

  it 'renders the edit phone_number form' do
    render

    assert_select 'form[action=?][method=?]', phone_number_path(phone_number), 'post' do
      assert_select 'input[name=?]', 'phone_number[number]'

      assert_select 'input[name=?]', 'phone_number[contact_id]'
    end
  end
end
