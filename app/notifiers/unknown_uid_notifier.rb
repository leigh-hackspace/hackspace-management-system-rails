class UnknownUidNotifier
  def self.send_notifications(uid)
    HTTParty.post(ENV['SLACK_HMSR_CH_URL'],
    body: {
      text: <<~HEREDOC
      Uknown UID Posted: *#{uid}*
      HEREDOC
    }.to_json)
  end
end
