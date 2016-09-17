class Item < ActiveRecord::Base
	belongs_to :user
	has_many :reviews
	has_attached_file :image, styles: { medium: "800x360#", custom: "400x180#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  	def self.search(search)
  		#find(:all, :conditions => ['place ILIKE ?', "%#{search}%"])
  		where("place LIKE ? or region LIKE ?", "%#{search}%", "%#{search}%") 
      #para postgres utilizar ILIKE
  		#where("region LIKE ?", "%#{search}%")
  		#Para dejar la busqueda en PostgreSQL, cambiar LIKE po ILIKE.
	end
end
