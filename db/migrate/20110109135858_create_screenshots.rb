class CreateScreenshots < ActiveRecord::Migration
  def self.up
    create_table :screenshots do |t|
      t.integer :project_id

      t.timestamps
    end
    add_column :screenshots, :image_file_name,    :string
    add_column :screenshots, :image_content_type, :string
    add_column :screenshots, :image_file_size,    :integer
    add_column :screenshots, :image_updated_at,   :datetime
    
    add_column :projects, :image_file_name,    :string
    add_column :projects, :image_content_type, :string
    add_column :projects, :image_file_size,    :integer
    add_column :projects, :image_updated_at,   :datetime
    
    add_column :projects, :preview_image_file_name,    :string
    add_column :projects, :preview_image_content_type, :string
    add_column :projects, :preview_image_file_size,    :integer
    add_column :projects, :preview_image_updated_at,   :datetime
    
    add_index :screenshots, :project_id
  end

  def self.down
    remove_index :screenshots, :project_id

    drop_table :screenshots
    remove_column :projects, :image_file_name
    remove_column :projects, :image_content_type
    remove_column :projects, :image_file_size
    remove_column :projects, :image_updated_at
    
    remove_column :projects, :preview_image_file_name
    remove_column :projects, :preview_image_content_type
    remove_column :projects, :preview_image_file_size
    remove_column :projects, :preview_image_updated_at
  end
end
