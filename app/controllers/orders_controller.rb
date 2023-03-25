class OrdersController < ApplicationController
  before_action :set_order, only: :show

  def create
    @order = Order.new(order_params)

    if @order.save
      @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:name, :phone_number, :city, :neighborhood,:street, :number, :complement,
                                  :restaurant_id, order_products_attributes: [:product_id, :quantity])
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
