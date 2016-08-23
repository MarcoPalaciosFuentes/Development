class Item < ActiveRecord::Base
	has_attached_file :image, styles: { large: "1000x800>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
