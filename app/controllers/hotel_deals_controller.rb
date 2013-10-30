require 'net/http'

class HotelDealsController < ApplicationController
  def index
    uri = URI('http://deals.expedia.com/beta/deals/hotels.json' + search_string)
    json = Net::HTTP.get(uri)
    out=JSON.parse(json)
    @hotel_deals = out.collect do |e|
      HotelDeal.new(e)
    end
    if params["from_date"].present? && params["to_date"].present?
      @hotel_deals = deals_within_date_range
    end
    @hotel_deals.sort! {|a,b| b.percent_savings <=> a.percent_savings}
  end

  def deals_within_date_range
    @hotel_deals.select {|e| e.within_date_range?(params["from_date"], params["to_date"])}
  end

  def search_string
    a_string = ""
    if params["city"].present?
      a_string << "&city=" + params["city"]
    end
    if params["country_code"].present?
      a_string << "&country=" + params["country_code"].upcase
    end
    if params["province"].present?
      a_string << "&province=" + params["province"]
    end
    if params["minimum_stars"].present?
      a_string << "&minStarRating=" + params["minimum_stars"]
    end
    if params["max_rate"].present?
      a_string << "&maxTotalRate=" + params["max_rate"]
    end
    if params["all_inclusive"].present?
      a_string << "&isAllInclusive=" + "true"
    end
    if a_string.present?
      a_string = a_string.sub("&", "?")
    end
    URI::escape(a_string)
  end
end
