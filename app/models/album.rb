class Album < ActiveRecord::Base
  validates :name, :studio_album, :band_id, presence: true
  belongs_to :band
  has_many :tracks
end
