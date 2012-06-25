class User < ActiveRecord::Base
 # attr_accessible :name
  attr_accessor   :password
  before_save :encrypt_password
  
  validates :name, :presence   => true,
                   :length     => { :within => 2..40},
                   :uniqueness => true
  validates :password, :presence     => true,
                       :confirmation => true,
		       :length       => { :within => 6..40}
 
  def self.authenticate(name, password)
     user = find_by_name(name)
     if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
       user
     else
       nil
     end
  end

  
  private
  
    def encrypt_password
       if password.present?
         self.password_salt = BCrypt::Engine.generate_salt
         self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
       end
    end

end
