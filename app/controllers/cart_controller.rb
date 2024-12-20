class CartController < ApplicationController
  def show
    @render_cart = false
  end

  def add
    @product = Product.find(params[:id])
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(product_id: @product.id)
  
    if current_orderable && quantity > 0
      current_orderable.update(quantity: quantity)
    elsif quantity <= 0
      current_orderable.destroy
    else
      @cart.orderables.create(product: @product, quantity: quantity)
    end
  
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('cart', partial: 'cart/cart', locals: { cart: @cart })
      end
      format.html { redirect_to cart_path }
    end
  end
  

  def remove
    Orderable.find(params[:id]).destroy

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('cart', partial: 'cart/cart', locals: { cart: @cart })
      end
      format.html { redirect_to cart_path }
    end
  end
end
