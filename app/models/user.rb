class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  before_create :default_user_name

  has_many :topics, dependent: :destroy

  STATE = {
    :admin => 0,
    :normal => 1
  }

  def has_role?(role)
    case role
      when :admin then self.state == STATE[:admin]
      when :member then self.state == STATE[:normal]
      else false
    end
  end

  private

    def default_user_name
      self.name = self.email
    end

end
