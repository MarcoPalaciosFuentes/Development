module ItemsHelper
#define el metodo que entrega todos los rating del usuario 
  
  def get_best_item()
    best_items = []

    Item.all.each do |item|
      @review = Review.where(item_id: @item.id).order("created_at DESC")
      if @item.reviews.blank?
        @avg_review = 0
      else
        @avg_review = @review.average(:rating).round(2)
        items.push best_items
      end
    end

    best_items

  end


  def user_rating(user)
    review = Review.where(user_id: user.id, item_id: @item.id).first

    return nil if not review

    review.rating
  end


#metodo donde entrega los items que el usuario no a puesto una calificacion
  def get_unrated_items(user)
    items = []

    Item.all.each do |item|
      review = Review.where(user_id: user.id, item_id: item.id).first
      if not review
        items.push item
      end
    end

    items
  end
#metodo para entregar el rating promedio de un usuario
  def user_average_rating(user)
    #av = promedio (avarage), counter = contador(para calcular el total de reviews realizada)
    av, counter = 0.0, 0.0
    
   Review.where(user_id: user.id).each_with_index do |review, i|
      if review.rating
        av = av + review.rating
        counter = counter + 1.0
      end
    end

    av / counter
  end
#calculo de vecindad 
  def get_neighbours(user)
    neighbours = []
    users = User.where("id <> :current_user", { current_user: user.id })

    users.each do |candidate|
      neighbours.push(candidate) if similarity(user, candidate) >= 0
    end

    neighbours
  end

  # Similarity of ratings between user a and user b
  # Calculated with Pearson correlation, which goes:
  # from -1 (low similarity) to 1 (high similarity)
  def similarity(user_a, user_b)
    av_a, av_b = user_average_rating(user_a), user_average_rating(user_b)
    sum_both, sum_a, sum_b = 0, 0, 0
    rating_a = Review.where(user_id: user_a.id)

    rating_a.each do |rating_a|
      if rating_b = Review.where(user_id: user_b.id, item_id: rating_a.item_id).first
        sum_a = sum_a + ( (rating_a.rating - av_a)**2 )
        sum_b = sum_b + ( (rating_b.rating - av_b)**2 )
        sum_both = sum_both + ( (rating_a.rating - av_a) * (rating_b.rating - av_b) )
      end
    end

    sum_both / ( (Math.sqrt(sum_a)) * (Math.sqrt(sum_b)) )
  end

  # Predict if we should recommend book
  def prediction(user, item)
    av_user = user_average_rating(user)
    upper_sum, bottom_sum = 0, 0
    neighbours = get_neighbours(user)

    neighbours.each_with_index do |neighbour, i|
      if neighbour_rating = Review.where(user_id: neighbour.id, item_id: item.id).first
        upper_sum = upper_sum + ( similarity(user, neighbour) * (neighbour_rating.rating - user_average_rating(neighbour)) )
        bottom_sum = bottom_sum + similarity(user, neighbour)
      end
    end

    if upper_sum > 0 and bottom_sum > 0
      av_user + (upper_sum / bottom_sum)
    else
      0
    end
  end

end
