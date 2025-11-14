class RenameGroupToGroupNameInTopics < ActiveRecord::Migration[7.1]
  def change
    rename_column :topics, :group, :group_name
  end
end
