class Page < ActiveRecord::Base
  mount_uploader :avatar, ImageUploader
  mount_uploader :image, ImageUploader
  mount_uploader :attachment, AttachmentUploader
end
