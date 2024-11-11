class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "MessagesChannel"
    transmit({ body: current_user_name })
  end

  def receive(data)
    message = data['message']
    transmit({ body: message })
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
