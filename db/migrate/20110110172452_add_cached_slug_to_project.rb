class AddCachedSlugToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :cached_slug, :string
    add_index  :projects, :cached_slug, :unique => true    
  end

  def self.down
    remove_index  :projects, :cached_slug
    remove_column :projects, :cached_slug
  end
end
