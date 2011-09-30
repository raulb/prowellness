class Attachment < ActiveRecord::Base

  mount_uploader :image, AttachmentUploader

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

