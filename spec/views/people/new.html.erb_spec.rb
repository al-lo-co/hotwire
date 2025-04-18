# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'people/new', type: :view do
  before(:each) do
    assign(:person, Person.new(
                      name: 'MyString',
                      contact: nil
                    ))
  end

  it 'renders new person form' do
    render

    assert_select 'form[action=?][method=?]', people_path, 'post' do
      assert_select 'input[name=?]', 'person[name]'

      assert_select 'input[name=?]', 'person[contact_id]'
    end
  end
end
