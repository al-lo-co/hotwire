# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'phone_numbers/index', type: :view do
  before(:each) do
    assign(:phone_numbers, [
             PhoneNumber.create!(
               number: 'Number',
               contact: nil
             ),
             PhoneNumber.create!(
               number: 'Number',
               contact: nil
             )
           ])
  end

  it 'renders a list of phone_numbers' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Number'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
