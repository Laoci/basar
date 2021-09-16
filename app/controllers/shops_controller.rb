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
  end
end
