# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'people/index', type: :view do
  before(:each) do
    assign(:people, [
             Person.create!(
               name: 'Name',
               contact: nil
             ),
             Person.create!(
               name: 'Name',
               contact: nil
             )
           ])
  end

  it 'renders a list of people' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
