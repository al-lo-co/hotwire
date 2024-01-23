# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'contacts/index', type: :view do
  before(:each) do
    assign(:contacts, [
             Contact.create!(
               identifier: 'Identifier'
             ),
             Contact.create!(
               identifier: 'Identifier'
             )
           ])
  end

  it 'renders a list of contacts' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Identifier'.to_s), count: 2
  end
end
