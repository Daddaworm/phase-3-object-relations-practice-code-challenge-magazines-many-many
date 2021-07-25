class Subscription < ActiveRecord::Base
    belongs_to :magazine
    belongs_to :reader

    def print_details
        # puts a string to the terminal to display the details of the subscription
        # the string should be formatted like this: {reader name} subscribed to {magazine title} for ${subscription price}
        reader = self.reader.name
        title = self.magazine.title
        price = self.price
        puts "#{reader} subscribed to #{title} for #{price}"
    end


    


end