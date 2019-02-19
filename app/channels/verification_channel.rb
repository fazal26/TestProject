class VerificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "verification"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
