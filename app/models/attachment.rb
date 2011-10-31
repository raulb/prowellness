class Attachment < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  mount_uploader :image, AttachmentUploader

  def to_jq_upload
    {
      "name" => image.url,
      "size" => image.size,
      "url" => image.url,
      "thumbnail_url" => image.small.url,
      "delete_url" => attachment_path(self.id),
      "delete_type" => "DELETE",
      "image_id" => self.id
     }
  end

end

# == Schema Information
#
# Table name: attachments
#
#  id         :integer         not null, primary key
#  image      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

