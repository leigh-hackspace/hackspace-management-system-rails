class Api::V1::HsSessionsController < ApplicationController
  protect_from_forgery with: :null_session
  rescue_from Exception, with: :oh_no_no_no
  skip_before_action :verify_authenticity_token, if: :create

  def create
    if hs_sessions_params[:uid] == "PING"
      render json: {
        status: "PONG"
      }
    else
      user = User.find_by(uid: hs_sessions_params[:uid])
      @hs_session = setup_hs_session(user)

      @hs_session.process_session
      if @hs_session.save
        render json: {
          status: @hs_session.status
        }
      end
    end
  end

  private

  def setup_hs_session(user)
    if user.hs_sessions.blank? || user.hs_sessions.last.timeout?
      HsSession.new(user: user)
    else
      user.hs_sessions.last
    end
  end

  def hs_sessions_params
    {
      uid: params[:uid]
    }
  end

  def oh_no_no_no
    render json: {
      status: "UNRECOGNISED"
    }
  end
end
