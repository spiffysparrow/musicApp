class AlbumBandIdIndex < ActiveRecord::Migration
  def change
    add_index :tracks, :album_id
  end
end
