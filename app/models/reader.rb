class Reader < ActiveRecord::Base
    has_many :subscriptions
    has_many :magazines, through: :subscriptions


    def subscribe(magazine, price)
        # takes a magazine (an instance of the Magazine class) and a price (integer) as arguments, and creates a new subscription in the database associated with the magazine and the reader
        Subscription.create(price: price, reader_id: self.id, magazine_id: magazine.id)
    end

    def total_subscription_price
        # Returns the total price for all the reader's subscriptions
        self.subscriptions.pluck(:price).sum
    end

    def cancel_subscription(magazine)
        # takes a magazine instance and removes the subscription for this reader
        # you will have to delete a row from the subscriptions table to get this to work!
        self.subscriptions.where("magazine_id == ?", magazine.id).destroy_all
    end




end