class CreateProjectCategories < ActiveRecord::Migration
  def self.up
    create_table :project_categories do |t|
      t.string :name
    end
    add_column :projects, :project_category_id, :integer
    add_column :projects, :featured, :boolean, :default => false
    add_index :projects, :project_category_id
    ProjectCategory.create(:name => "Web Development")
    ProjectCategory.create(:name => "Web Design")
  end

  def self.down
    remove_index :projects, :project_category_id
    remove_column :projects, :featured
    remove_column :projects, :project_category_id
    drop_table :project_categories
  end
end
