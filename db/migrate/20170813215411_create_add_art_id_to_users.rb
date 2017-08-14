class CreateAddArtIdToUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :add_art_id_to_users do |t|

      t.timestamps
    end
  end
end
