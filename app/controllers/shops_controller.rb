class ShopsController < ApplicationController
  def index
    query_value = params[:query]
    alert = "Sorry... We can't find anything by #{query_value}"
    if params[:query].present? && /\d{6}/ === query_value
      query_value = query_value.to_i
      @shops = Shop.where(postal_code: query_value)
    elsif params[:query].present?
      sql_query = "shops.name @@ :query OR items.name @@ :query"
      @shops = Shop.joins(:items).where(sql_query, query: "%#{query_value}%").distinct
    else
      return nil
    end

    if @shops.empty?
      redirect_to root_path, alert: alert
      return nil
    end


    # # Not a number or not exactly 6 digits
    # unless Integer(postal_code, exception: false) && postal_code.length == 6
    #   alert = "Invalid Postal Code '#{postal_code}', please enter 6 digits."
    #   redirect_to '/', alert: alert
    #   return
    # end

    # # No results, show notify
    # if @shops.count.zero?
    #   redirect_to '/', notice: "No results found for '#{postal_code}'"
    #   return
    # end
  end
end
