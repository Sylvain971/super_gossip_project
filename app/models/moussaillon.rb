class Moussaillon < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :gossips

  USERNAME_REGEX = /\A[a-zA-Z@]+\z/

 	#before_save { anonymous_username.downcase! }
	 
 	 validates :anonymous_username,
 	   presence: true,
 	   uniqueness: { case_sensitive: false },
 	   length: { minimum: 3, maximum: 42 },
 	   format: { with: USERNAME_REGEX, message: "Only allows letters" }

 	   attr_accessor :sign_up_code
  
  	   validates :sign_up_code,
       on: :create,
       presence: true,
       inclusion: { in: ["outwomaco"] }
end
