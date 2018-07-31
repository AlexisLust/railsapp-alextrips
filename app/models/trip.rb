class Trip < ApplicationRecord
has_many :locations

  has_attached_file :image, styles: {xl: "1600x900#", large: "1280x720#", medium: "400x225#", thumb: "100x75#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def get_locations
    lugares = ""
    locations.each do |l|
      lugares = lugares + l.name + ", "
    end
    #ahora elimino la coma y espacio del ultimo lugar
    lugares = lugares[0...-2]
    lugares
  end
end
