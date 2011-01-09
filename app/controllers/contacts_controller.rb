class ContactsController < InheritedResources::Base
  before_filter :store_location
  
  def index
    redirect_to new_contact_path
  end
  
  def create
    @contact = Contact.new(params[:contact])
    if verify_recaptcha(:model => @contact, :message => "Oh! It's error with reCAPTCHA!") && @contact.save
      redirect_to root_path, :notice => "You message sent successfully."
    else
      render :new
    end
  end
  
end
