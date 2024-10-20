# frozen_string_literal: true

require "dry-types"

Types = Dry.Types()

def created_at(db_type)
  if db_type == :sqlite
    column :created_at, Time, default: "DATETIME('now')", null: false
  elsif db_type == :postgres
    column :created_at, Time, default: "now()", null: false
  end
end

def updated_at(db_type)
  if db_type == :sqlite
    column :updated_at, Time, default: "DATETIME('now')", null: false
  elsif db_type == :postgres
    column :updated_at, Time, default: "now()", null: false
  end
end


ROM::SQL.migration do |conn|
  
  change do
    create_table :services do |database_type|
      primary_key :id
      column :name, String, null: false
      column :url, String, null: false
      created_at(database_type)
      updated_at(database_type)
    end

    create_table :authors do |database_type|
      primary_key :id
      foreign_key :service_id, :services
      column :name, String, null: false
      column :username, String, null: false
      column :type, String, null: false
      column :uuid, String, null: false
      column :account_id, String
      created_at(database_type)
      updated_at(database_type)
    end

    create_table :repositories do |database_type|
      primary_key :id
      foreign_key :service_id, :services
      foreign_key :workspace_id, :workspaces
      foreign_key :project_id, :projects
      column :type, String, null: false
      column :full_path, String
      column :name, String, null: false
      column :scm, String, null: false
      column :website, String, null: false
      column :owner, String
      column :private, TrueClass, null: false
      column :uuid, String, null: false
      column :parent, String
      created_at(database_type)
      updated_at(database_type)
    end
    
    create_table :workspaces do |database_type|
      primary_key :id
      foreign_key :service_id, :services
      column :type, String, null: false
      column :uuid, String, null: false
      column :name, String, null: false
      column :slug, String, null: false
      created_at(database_type)
      updated_at(database_type)
    end

    create_table :projects do |database_type|
      primary_key :id
      foreign_key :service_id, :services
      column :type, String, null: false
      column :key, String, null: false
      column :uuid, String, null: false
      created_at(database_type)
      updated_at(database_type)
    end
    
    create_table :links do |database_type|
      primary_key :id
      foreign_key :service_id, :services
      foreign_key :workspace_id, :workspaces
      foreign_key :project_id, :projects
      foreign_key :author_id, :authors
      column :name, String, null: false
      column :href, String, null: false
      created_at(database_type)
      updated_at(database_type)
    end

    create_table :bb_events do |database_type|
      primary_key :id
      foreign_key :service_id, :services
      foreign_key :author_id, :authors
      foreign_key :repository_id, :repositories
      column :type, String, null: false
      column :content, String, null: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
      created_at(database_type)
      updated_at(database_type)
    end
    create_table :cb_events do |database_type|
      primary_key :id
      column :type, String, null: false
      column :content, String, null: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
      created_at(database_type)
      updated_at(database_type)
    end

    create_table :gh_events do |database_type|
      primary_key :id
      column :type, String, null: false
      column :content, String, null: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
      created_at(database_type)
      updated_at(database_type)
    end
    create_table :gl_events do |database_type|
      primary_key :id
      column :type, String, null: false
      column :content, String, null: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
      created_at(database_type)
      updated_at(database_type)
    end

    create_table :sh_events do |database_type|
      primary_key :id
      column :type, String, null: false
      column :content, String, null: false
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
      created_at(database_type)
      updated_at(database_type)
    end
  end
end
