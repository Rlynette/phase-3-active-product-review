class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    def favorite_product
    # self.products.maximum(:star_rating)
    # review = self.review.order(:star_rating).last
    self.reviews.order(:star_rating).last.product
    end
    def remove_reviews(product)
        #map through reviews while destroying those that have user_id that match user.id
        # product.reviews()
        self.reviews.where(product: product).destroy_all
    end
end