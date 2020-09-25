# frozen_string_literal: true

ActiveAdmin.register Feature do
  permit_params :name, :description, :status
end
