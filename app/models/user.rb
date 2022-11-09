class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    def favorite_product
    # self.products.maximum(:star_rating)
    # review = self.review.order(:star_rating).last
    self.reviews.order(:star_rating).last.product
    end
end