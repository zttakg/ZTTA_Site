class Service < ApplicationRecord
  mount_uploader :cover, AttachmentUploader
  mount_uploader :svg, AttachmentUploader
end
