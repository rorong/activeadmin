# frozen_string_literal: true

ActiveAdmin.register Product do
  permit_params :name, :description, :labels_limit, :carriers_limit, :started_at, :expired_at, :status, :one_time, :month, :year, feature_ids: []

  index do
    selectable_column
    column :name
    column :features
    column :labels_limit, class: 'col-center'
    column :carriers_limit, class: 'col-center'
    column :started_at, class: 'col-center'
    column :expired_at, class: 'col-center'
    column :status, class: 'col-center'
    column :one_time, class: 'col-center' do |p|
      number_to_currency(p.one_time)
    end
    column :month, class: 'col-center' do |p|
      number_to_currency(p.month)
    end
    column :year, class: 'col-center' do |p|
      number_to_currency(p.year)
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :features
      row :labels_limit, class: 'col-center'
      row :carriers_limit, class: 'col-center'
      row :started_at, class: 'col-center'
      row :expired_at, class: 'col-center'
      row :status, class: 'col-center'
      row :one_time, class: 'col-center' do |p|
        number_to_currency(p.one_time)
      end
      row :month, class: 'col-center' do |p|
        number_to_currency(p.month)
      end
      row :year, class: 'col-center' do |p|
        number_to_currency(p.year)
      end
    end
  end

  form do |f|
    f.inputs :name, :description, :labels_limit, :carriers_limit, :started_at, :expired_at, :status, :one_time, :month, :year
    f.inputs 'Select plan features' do
      f.input :features, as: :check_boxes, collection: Feature.all.order(:id), hidden_fields: false
    end
    f.actions
  end
end
