class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
       if resource.persisted?
          resource.image_name = 'default_user.jpg'
          resource.save
       end
    end
  end
end