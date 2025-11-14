class AddLikesCountToTopics < ActiveRecord::Migration[7.1]
  def change
    add_column :topics, :likes_count, :integer, default: 0, null: false
  end
end
