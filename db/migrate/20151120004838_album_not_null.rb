class AlbumNotNull < ActiveRecord::Migration
  def change
    change_column :albums, :name, :string, :null => false
  end
end
