# frozen_string_literal: true

json.extract! phone_number, :id, :number, :contact_id, :created_at, :updated_at
json.url phone_number_url(phone_number, format: :json)
