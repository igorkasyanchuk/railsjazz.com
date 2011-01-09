class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.text :message
      t.boolean :approved, :default => false
      t.timestamps
    end
    add_column :screenshots, :description, :text
  end

  def self.down
    remove_column :screenshots, :description
    drop_table :contacts
  end
end
