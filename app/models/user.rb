class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :hs_sessions
  validates :uid, presence: true
  validates :uid, uniqueness: true

  before_validation :generate_temp_password, if: :new_user? && :admin_exists?

  ROLES = %w(user admin).freeze

  def admin?
    role == 'admin'
  end

  def process_session
    if hs_sessions.empty? || hs_sessions.last.timeout?
      create_new_session
    else
      sign_out_user
    end
  end

  def work_out_diff
    HsSession.session_length(self)
  end

  private

  def generate_temp_password
    self.password = SecureRandom.hex(10)
  end

  def new_user?
    id.nil?
  end

  def admin_exists?
    User.count(admin?) > 0
  end

  def create_new_session
    hs_sessions.create(timein: Time.now)
  end

  def sign_out_user
    hs_sessions.last.update_attribute(:timeout, Time.now)
    self.work_out_diff
  end
end
