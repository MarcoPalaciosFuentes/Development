class Item < ActiveRecord::Base
	belongs_to :user
	has_many :reviews, :after_add => :update_average_rating, :after_remove => :update_average_rating
	has_attached_file :image, styles: { medium: "800x360#", custom: "400x180#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  	def self.search(search)
  		#find(:all, :conditions => ['place ILIKE ?', "%#{search}%"])
  		where("place LIKE ? or region LIKE ?", "%#{search}%", "%#{search}%") 
      #para postgres utilizar ILIKE
  		#where("region LIKE ?", "%#{search}%")
  		#Para dejar la busqueda en PostgreSQL, cambiar LIKE po ILIKE.
	end

  def add_rating(rating_opts)
    @item.add_rating(:rating => rating, :user => params[:rating][:user])
    self.reviews.create(rating_opts)
    self.update_rating!
  end

  def update_average_rating(review=nil)
    s = self.reviews.sum(:rating)
    c = self.reviews.count
    self.update_attribute(:average_rating, c == 0 ? 0.0 : s / c.to_f)
  end

end