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

    create_table :authors do
      primary_key :id
      column :service_id, ForeignKey(:services), null: false
      column :name, String, null: false
      column :username, String, null: false
      column :type, String, null: false
      column :uuid, String, null: false
      column :account_id, String
    end

    create_table :repositories do
      primary_key :id
      column :service_id, ForeignKey(:services), null: false
      column :type, String, null: false
      column :full_path, String
      column :name, String, null: false
      column :scm, String, null: false
      column :website, String, null: false
      column :owner, String
      column :workspace_id, ForeignKey(:workspaces), null: false
      column :private, TrueClass, null: false
      column :project_id, ForeignKey(:projects), null: false
      column :uuid, String, null: false
      column :parent, String
    end
    
    create_table :workspaces do 
      primary_key :id
      column :service_id, ForeignKey(:services), null: false
      column :type, String, null: false
      column :uuid, String, null: false
      column :name, String, null: false
      column :slug, String, null: false
    end

    create_table :projects do
      primary_key :id
      column :service_id, ForeignKey(:services), null: false
      column :type, String, null: false
      column :key, String, null: false
      column :uuid, String, null: false
    end
    
    create_table :links do 
      primary_key :id
      column :service_id, ForeignKey(:services), null: false
      column :name, String, null: false
      column :href, String, null: false
      column :workspace_id, ForeignKey(:workspaces)
      column :project_id, ForeignKey(:projects)
      column :author_id, ForeignKey(:authors)
    end

    create_table :bb_events do
      primary_key :id
      column :service_id, ForeignKey(:services), null: false
      column :author_id, ForeignKey(:authors), null: false
      column :repository_id, ForeignKey(:repositories), null: false
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
