class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, dependent: :destroy
  has_many :likes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 20 }

  def update_without_current_password(params, *options)
    
    if params[:password].blank? && params[:password_confirmation].blank? 
      params.delete(:password)
      params.delete(:password_confirmation)
    end
      
    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  def liked_by(post_id)
    Like.find_by(user_id: id, post_id: post_id)
  end

end
