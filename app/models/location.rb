class Location < ApplicationRecord
  belongs_to :trip


  has_attached_file :image, styles: {xl: "1600x900#", large: "800x600#", medium: "400x300#", thumb: "100x75#"}, default_url: ":style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
