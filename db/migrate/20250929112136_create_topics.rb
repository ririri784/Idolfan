class CreateTopics < ActiveRecord::Migration[7.1]
  def change
    create_table :topics do |t|
      t.string :title
      t.text :outline
      t.string :image
      t.text :content
      t.integer :user_id
      t.integer :topic_id

      t.timestamps
    end
  end
end
