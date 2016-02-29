class SessionsController < AuthenticatedController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)	
	respond_to do |format|
      if user && user.authenticate(params[:session][:password])
		log_in user
        format.html { redirect_to user }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
 end

  def destroy
    log_out
    redirect_to root_url
  end
end