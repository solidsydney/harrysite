class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, :last_name, presence: true
  scope :administrators, -> {where(:admin => true)}
  before_create :make_first_user_admin
  after_create :send_account_notification
  has_many :posts

  def display_name
    [first_name, last_name].compact.join(" ")
  end

  def is_admin
    self.admin?
  end


  def make_first_user_admin
    self.admin = true unless User.exists?
  end

  def self.generate_password
    ('a'..'z').to_a.shuffle[0,8].join
  end

  def send_account_notification
    unless Rails.env.test?
      if User.count > 1
        if self.admin?
          AccountMailer.new_account(self).deliver
        end
      end
    end
  end

end
