module SessionsHelper

  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    self.current_user = user
  end

  def current_user=(user)
      @current_user = user
  end
  
  def current_user
      @current_user ||= user_from_remember_token #||= (“or equals”) ... set the @current_user instance variable to the user corresponding to the remember token, but only if @current_user is undefined.calls the user_from_remember_token method the first time current_user is called, but on subsequent invocations returns @current_user without calling user_from_remember_token.
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
  end
  
  def current_user?(user)
      user == current_user
  end
  
  def deny_access
      store_location
      redirect_to signin_path, :notice => "Please sign in to access this page." #same as
      #flash[:notice] = "Please sign in to access this page."
      #redirect_to signin_path
  end
  
  def redirect_back_or(default)
      redirect_to(session[:return_to] || default)
      clear_return_to
    end

  private

      def user_from_remember_token
        User.authenticate_with_salt(*remember_token) #the * operator, which allows us to use a two-element array as an argument to a method expecting two variables
      end

      def remember_token
        cookies.signed[:remember_token] || [nil, nil]
        #The reason for this code is that the support for signed cookies inside Rails tests is still immature, and a nil value for the cookie causes spurious test breakage. Returning [nil, nil] instead fixes the issue.
      end 
      def store_location
          session[:return_to] = request.fullpath
        end

        def clear_return_to
          session[:return_to] = nil
        end 
end