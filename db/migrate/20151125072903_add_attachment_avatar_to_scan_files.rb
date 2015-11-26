class AddAttachmentAvatarToScanFiles < ActiveRecord::Migration
  def self.up
    change_table :scan_files do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :scan_files, :avatar
  end
end
