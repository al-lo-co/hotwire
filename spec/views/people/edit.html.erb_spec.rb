# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'people/edit', type: :view do
  let(:person) do
    Person.create!(
      name: 'MyString',
      contact: nil
    )
  end

  before(:each) do
    assign(:person, person)
  end

  it 'renders the edit person form' do
    render

    assert_select 'form[action=?][method=?]', person_path(person), 'post' do
      assert_select 'input[name=?]', 'person[name]'

      assert_select 'input[name=?]', 'person[contact_id]'
    end
  end
end
