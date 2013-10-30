class HotelDeal
  attr_accessor :check_in_date, :check_out_date, :street_address, :city, :province, :country_code,
                :latitude, :longitude, :hotel_description, :destination, :long_destination_name,
                :base_rate_for_entire_stay, :original_base_rate_for_entire_stay, :currency_code,
                :taxes_and_fees, :base_rate_for_entire_stay_plus_taxes_and_fees, :hotel_name,
                :promotion_description, :star_rating, :guest_rating, :price_per_night,
                :original_price_per_night, :percent_savings, :all_inclusive, :image_url, :length_of_stay

  def initialize(a_hash)
    @check_in_date = Date.parse(a_hash["checkInDate"])
    @check_out_date = Date.parse(a_hash["checkOutDate"])
    @street_address = a_hash["streetAddress"]
    @city = a_hash["city"]
    @province = a_hash["province"]
    @country_code = a_hash["country"]
    @latitude = a_hash["latitude"]
    @longitude = a_hash["longitude"]
    @hotel_description = a_hash["description"]
    @destination = a_hash["destination"]
    @long_destination_name = a_hash["longDestinationName"]
    @base_rate_for_entire_stay = a_hash["baseRate"]
    @original_base_rate_for_entire_stay = a_hash["originalBaseRate"]
    @currency_code = a_hash["currency"]
    @taxes_and_fees = a_hash["taxesAndFees"]
    @base_rate_for_entire_stay_plus_taxes_and_fees = a_hash["totalRate"]
    @hotel_name = a_hash["name"]
    @promotion_description = a_hash["promotionDescription"]
    @star_rating = a_hash["starRating"]
    @guest_rating = a_hash["guestRating"]
    @price_per_night = a_hash["pricePerNight"]
    @original_price_per_night = a_hash["originalPricePerNight"]
    @percent_savings = a_hash["percentSavings"]
    @all_inclusive = a_hash["isAllInclusive"]
    @image_url = a_hash["imageUrl"]
    @length_of_stay = a_hash["lengthofStay"]
  end

  def hotel_address
    street_address.to_s + ", " + city.to_s + ", " + province.to_s + ", " + country_code.to_s
  end

  def timeframe
    check_in_date_string + " - " + check_out_date_string
  end

  def check_in_date_string
    if check_in_date
      if check_in_date.year == check_out_date.year
        year_symbol = ""
      else
        year_symbol = "/%Y"
      end
      check_in_date.strftime("%m/%d" + year_symbol)
    else
      ''
    end
  end

  def check_out_date_string
    if check_out_date
      if check_in_date.year == check_out_date.year && check_in_date.month == check_out_date.month
        month_symbol = ""
      else
        month_symbol = "%m/"
      end
      check_out_date.strftime(month_symbol + "%d/%Y")
    else
      ''
    end
  end

  def special_promotion_description
    if promotion_description.present?
      promotion_description
    else
      "Special Rate"
    end
  end

  def all_inclusive_display
    all_inclusive ? "Yes" : "No"
  end

  def within_date_range?(from_date, to_date)
    begin
      from_date_object = Date.parse(from_date)
      to_date_object = Date.parse(to_date)
      if from_date_object > to_date_object then return true end
      trip_date_range = from_date_object..to_date_object
      deal_date_range = check_in_date..check_out_date
      trip_date_range === deal_date_range.first || trip_date_range === deal_date_range.last ||
        deal_date_range === trip_date_range.first || deal_date_range === trip_date_range.last
    rescue ArgumentError
      true
    end
  end
end
