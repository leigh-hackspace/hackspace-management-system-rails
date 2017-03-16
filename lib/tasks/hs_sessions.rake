namespace :hs_sessions do
  desc "Auto sign out all active sessions"
  task auto_sign_out: :environment do
    hs_sessions = HsSession.where(
      "created_at >= ? AND status = ?", Time.zone.now.beginning_of_day, "IN"
    )

    hs_sessions.each do |hs_session|
      hs_session.auto_sign_out
    end

    Rails.logger.info "Auto signed out all active hackspace sessions"
  end
end
