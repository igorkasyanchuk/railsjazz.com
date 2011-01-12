class AddPriorityToScreenshot < ActiveRecord::Migration
  def self.up
    add_column :screenshots, :priority, :integer, :default => -1
    Screenshot.reset_column_information
    Screenshot.update_all(:priority => -1)
  end

  def self.down
    remove_column :screenshots, :priority
  end
end
