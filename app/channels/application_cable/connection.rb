module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user_name

    def connect
      self.current_user_name = request.params[:user_name] || "Invitado"
      reject_unauthorized_connection if current_user_name.blank?
    end
  end
end
