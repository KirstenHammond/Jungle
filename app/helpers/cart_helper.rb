module CartHelper
  
  def emptyCart?(cart)
    cart.size === 0 ? true : false
  end

end