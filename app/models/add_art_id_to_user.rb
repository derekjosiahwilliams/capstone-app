class AddArtIdToUser < ApplicationRecord
  add_column :users, :art_id, :string
end
