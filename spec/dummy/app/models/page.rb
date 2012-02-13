class Page < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  mount_uploader :attachment, AttachmentUploader
end
