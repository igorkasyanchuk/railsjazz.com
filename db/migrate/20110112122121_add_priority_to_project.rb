class AddPriorityToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :priority, :integer, :default => -1
    Project.reset_column_information
    Project.update_all(:priority => -1)
  end

  def self.down
    remove_column :projects, :priority
  end
end
