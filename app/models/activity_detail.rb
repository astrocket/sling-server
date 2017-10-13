class ActivityDetail < ApplicationRecord
  belongs_to :activity
  has_attached_file :pic, styles: {xhdpi_4by3: "720x540>", medium: "300x300>", thumb: "160x160>"}, default_url: "/images/upload.png", path: ":rails_root/public/system/:class/:id/:attachment/:style/:filename", :preserve_files => true
  validates_attachment_content_type :pic, content_type: /\Aimage\/.*\Z/
end
