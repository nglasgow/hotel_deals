module HotelDealsHelper
  def regular_rate_string(hotel_deal)
    nights = hotel_deal.length_of_stay > 1 ? "nights" : "night"
    hotel_deal.length_of_stay.to_s + " " + nights + " x " + number_to_currency(hotel_deal.original_price_per_night) + " = " + \
      number_to_currency(hotel_deal.original_base_rate_for_entire_stay) + "<br />" + " + " + number_to_currency(hotel_deal.taxes_and_fees) + " tax & fees = " + \
       "<br />" + number_to_currency(hotel_deal.original_base_rate_for_entire_stay + hotel_deal.taxes_and_fees) + " " + hotel_deal.currency_code
  end

  def special_deal_string(hotel_deal)
    nights = hotel_deal.length_of_stay > 1 ? "nights" : "night"
    hotel_deal.length_of_stay.to_s + " " + nights + " x " + number_to_currency(hotel_deal.price_per_night) + " = " + \
      number_to_currency(hotel_deal.base_rate_for_entire_stay) + "<br />" +  " + " + number_to_currency(hotel_deal.taxes_and_fees) + " tax & fees = " + \
      "<br />" + number_to_currency(hotel_deal.base_rate_for_entire_stay_plus_taxes_and_fees) + " " + hotel_deal.currency_code
  end
end
