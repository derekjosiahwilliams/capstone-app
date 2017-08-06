class CreateArts < ActiveRecord::Migration[5.1]
  def change
    create_table :arts do |t|
      t.string :photo_url
      t.jsonb :drawing_data
      t.integer :user_id

      t.timestamps
    end
  end
end
