module ListingsHelper
    def format_price(price)
        "$#{'%.2f' %  (price/100.0)}"
    end

end
