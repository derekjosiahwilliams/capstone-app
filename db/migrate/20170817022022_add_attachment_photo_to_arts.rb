class AddAttachmentPhotoToArts < ActiveRecord::Migration[5.1]
  def self.up
    change_table :arts do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :arts, :photo
  end
end

