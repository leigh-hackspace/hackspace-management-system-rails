class Api::V1::HsSessionsController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token, if: :create

  def create
    case hs_sessions_params[:uid]
    when "PING"
      render json: {
        status: "PONG"
      }
    else
      user = User.find_by(uid: hs_sessions_params[:uid])
      user.nil? ? log_unknown_uid : setup_hs_session(user)
    end
  end

  private

  def log_unknown_uid
    render json: {
      status: "UNRECOGNISED"
    }

    send_notification
  end

  def setup_hs_session(user)
    if user.hs_sessions.blank? || user.hs_sessions.last.timeout?
      hs_session = HsSession.new(user: user)
    else
      hs_session = user.hs_sessions.last
    end

    hs_session.process_session

    if hs_session.save
      render json: {
        status: hs_session.status
      }
    end
  end

  def send_notification
    UnknownUidNotifier.send_notifications(hs_sessions_params[:uid])
  end

  def hs_sessions_params
    {
      uid: params[:uid]
    }
  end
end
