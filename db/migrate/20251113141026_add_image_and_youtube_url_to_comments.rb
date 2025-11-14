class AddImageAndYoutubeUrlToComments < ActiveRecord::Migration[7.1]
  def change
    add_column :comments, :image, :string
    add_column :comments, :youtube_url, :string
  end
end
