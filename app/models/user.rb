class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews
    def favorite_product
        # ActiveRecord inbuilt max
        self.reviews.order(:star_rating).last.product
    end

    def remove_reviews(product)
        # filter reviews that match user.id then destroy those that have user_id
        # map through reviews while destroying those that have user_id that match user.id
        # product.reviews.filter{|review|review.user_id==self.id}
        # .map{|review|review.destroy}
        self.reviews.where(product: product).destroy_all
    end 
end