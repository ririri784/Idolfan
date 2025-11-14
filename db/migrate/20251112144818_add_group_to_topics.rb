class AddGroupToTopics < ActiveRecord::Migration[7.1]
  def change
    add_column :topics, :group, :string
  end
end
