class RegistrantsController < ApplicationController
  def new
    @registrant = Registrant.new
    #create this to bind the registrant to the model- don't need to save, it's a placeholder for a registrant
  end

  def create
    puts "I'm here!!" #remove later
    @registrant = Registrant.new(registrant_params) 
    @registrant.code = SecureRandom.urlsafe_base64 
    @registrant.expires_at = Time.now + 4.hours
    if @registrant.save
      puts "\n\n send email\n\n"
      RegistrantMailer.registrant_email(@registrant).deliver
      redirect_to root_url, notice:"We've sent an email"
      #add a flash notice saying check your email 
    else
      flash.now[:alert] = "Please enter a valid email"
      render :new
    end
  end

  def edit
    puts "\n\n get params " + params.to_s +  " \n\n"

    @registrant = Registrant.find_by(code: params[:code])

    if @registrant and @registrant.expires_at > Time.now
      session[:registrant_id] = @registrant.id
      redirect_to new_user_path
      #create a view and controller for user new 
      #user model -user migration
    else
      flash.now[:error] = @registrant.errors
      redirect_to register_path, alert: "Your registration link has expired. Please try again."
    end
  end

 

  private
  def registrant_params
    params.require(:registrant).permit(:email)
  end

end