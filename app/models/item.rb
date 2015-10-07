class Item < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader


end
