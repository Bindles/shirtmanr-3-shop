class CartController < ApplicationController
  # def toggle
  #   @render_cart = false
  # end

  def show
    @render_cart = false
  end

  def add
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(product_id: @product.id)
    if current_orderable && quantity > 0
      current_orderable.update(quantity:) #shorthand=> (quantity: quantity)
      #current_orderable.update(quantity: current_orderable.quantity + quantity) #shorthand=> (quantity: quantity)
      #for add
    elsif quantity <= 0
      current_orderable.destroy
    else
      @cart.orderables.create(product: @product, quantity:)
    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [turbo_stream.replace('cart',
                                                    partial: 'cart/cart',
                                                    locals: { cart: @cart }),
                              turbo_stream.replace(@product)]
      end
    end
  end

  def remove
    Orderable.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('cart',
                                                  partial: 'cart/cart',
                                                  locals: { cart: @cart })
      end
    end
  end
end