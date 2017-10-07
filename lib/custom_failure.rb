class CustomFailure < Devise::FailureApp
  def respond
    self.status = 401
    self.content_type = 'json'
    self.response_body = {
        errors: {
            id: :unauthorized,
            status: 401,
            title: i18n_message
        }
    }.to_json
  end
end
