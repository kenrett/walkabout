class AddAttachmentPhotoToGuides < ActiveRecord::Migration
  def self.up
    change_table :guides do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :guides, :photo
  end
end
