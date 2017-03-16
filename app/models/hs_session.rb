class HsSession < ActiveRecord::Base
  belongs_to :user

  validates :timein, presence: true

  def process_session
    return false if session_duration_is_too_short?

    if timein?
      create_time_out
    else
      create_time_in
    end
  end

  def auto_sign_out
    self.auto_signed_out = true
    create_time_out
  end

  private

  def session_duration_is_too_short?
    user.hs_sessions.present? &&
      user.hs_sessions.last.updated_at > 30.seconds.ago
  end

  def create_time_in
    update(timein: Time.now, status: "IN")
  end

  def create_time_out
    timeout = Time.now
    update(timeout: timeout, status: "OUT", diff: work_out_diff(timeout))
  end

  def work_out_diff(timeout)
    ((timeout - timein) / 1.hour).round(2)
  end
end
