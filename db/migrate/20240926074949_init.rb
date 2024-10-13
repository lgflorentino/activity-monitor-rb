# frozen_string_literal: true

require "dry-types"

Types = Dry.Types()

ROM::SQL.migration do
  change do
    create_table :services do
      primary_key :id
      column :name, String, null: false
      column :url, String, null: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
    create_table :bb_events do
      primary_key :id
      column :type, String, null: false
      column :content, String, null: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
    create_table :cb_events do
      primary_key :id
      column :type, String, null: false
      column :content, String, null: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end

    create_table :gh_events do
      primary_key :id
      column :type, String, null: false
      column :content, String, null: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
    create_table :gl_events do
      primary_key :id
      column :type, String, null: false
      column :content, String, null: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
    create_table :sh_events do
      primary_key :id
      column :type, String, null: false
      column :content, String, null: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
