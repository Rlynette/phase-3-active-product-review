class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews
    def leave_review(user, star_rating, comment)
        Review.create(star_rating: star_rating, comment: comment, user_id: user_id, product_id: self.id)
    end
    def print_all_reviews
        #inside a map/collect
        puts self.reviews.map{|review|"Review for #{review.product.name} by #{review.user.name}: #{review.star_rating}. #{review.comment}"}

        #outside the map/collect
        # self.reviews.map(|review|puts `Review for #{review.product.name} by #{review.user.name}: #{review.star_rating}. #{review.comment}`)
    end
    def average_rating
        self.reviews.average(:star_rating).to_f
    end
end