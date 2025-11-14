class CreateIdols < ActiveRecord::Migration[7.1]
  def change
    create_table :idols do |t|
      t.string :question1
      t.string :question2
      t.string :question3

      t.timestamps
    end
  end
end
