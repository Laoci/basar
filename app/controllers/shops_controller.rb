class ShopsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new, :create]
  # before_action :authenticate_user!, except: :new

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

    if @shops.empty? || query_value.to_s.empty?
      redirect_to root_path, alert: alert
      return nil
    end
  end

  def new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    render :new
  end
end
