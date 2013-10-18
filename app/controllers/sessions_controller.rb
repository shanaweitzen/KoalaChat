class SessionsController < ApplicationController
  def new
    @user = User.new()
  end


  def create
    email = params[:user][:email]
    puts params.to_s   

    puts "\n\n email "+email+"\n\n"

    if email_exists?(email)

      puts "email exists"
      @user = User.find_by(email: email)

    if @user.authenticate( params[:user][:password]) 

      session[:user_id] = @user.id
      
      redirect_to chats_url

    else
      puts "invalid email"

      flash.now[:alert] = "Invalid Credentials. Please try again..."
      redirect_to root_url  
    end
  end
   
    
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You've successfully logged out."
  end

  private

  def email_exists?(email)
    User.where(email: email).exists?
  end

end
