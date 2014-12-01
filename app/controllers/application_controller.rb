class ApplicationController < ActionController::Base
 before_filter :authenticate_user!, except: [:faq]
  protect_from_forgery
  
  def current_cart 
    Cart.find(session[:cart_id]) 
  rescue ActiveRecord::RecordNotFound  
    cart = Cart.create
    session[:cart_id] = cart.id 
    cart 
  end

end