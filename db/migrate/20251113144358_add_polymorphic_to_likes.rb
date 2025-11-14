class AddPolymorphicToLikes < ActiveRecord::Migration[7.1]
  def change
    remove_reference :likes, :topic, foreign_key: true
    add_reference :likes, :likeable, polymorphic: true, null: true
  end
end
