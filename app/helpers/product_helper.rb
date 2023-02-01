module ProductHelper

  # Sold out logic to render button based on stock levels
  def isSoldOut?(product)
    product.quantity == 0 ? true : false
  end

end
