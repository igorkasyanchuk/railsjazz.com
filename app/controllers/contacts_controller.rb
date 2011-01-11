class ContactsController < InheritedResources::Base
  
  def index
    redirect_to new_contact_path
  end
  
  def create
    @contact = Contact.new(params[:contact])
    #if verify_recaptcha(:model => @contact, :message => "Oh! It's error with reCAPTCHA!") && @contact.save
    if @contact.save
      redirect_to contact_path(@contact)
    else
      render :new
    end
  end
  
end
