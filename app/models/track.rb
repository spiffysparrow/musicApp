class Track < ActiveRecord::Base
  validates :name, :bonus, :album_id, presence: true
  
  belongs_to :album
end
