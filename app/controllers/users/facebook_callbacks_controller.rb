class Users::FacebookCallbacksController < ApplicationController

  def facebook
    # You should test if params[:access_token] is present
    # and if this request fails
    facebook_data = HTTParty.get("https://graph.facebook.com/me", query: {
        app_id: ENV['SLING_FACEBOOK_APP'] || '1556039037767904', #astro_id for default
        app_secret: ENV['SLING_FACEBOOK_SECRET'] || '38f36a6529d88fa9cb0fee8136386d98', #astro_secret for default
        access_token: params[:data][:access_token], # access_token returned from ios & android app
        fields: 'id, name, email, friends'
    }).parsed_response
=begin return structure sample
    {
        "id": "1346710605452444",
        "name": "이한결",
        "email": "leonardo.lee1993@gmail.com",
        "friends": {
            "data": [
            ],
            "summary": {
                "total_count": 365
            }
        }
    }
=end

    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_fb_omniauth(facebook_data)

    if @user.persisted?
      sign_in @user #this will throw if @user is not activated
      render json: @user
    else
      Rails.logger.info(@user.errors.inspect)
      response = {
          errors: {
              id: :unprocessable_entity,
              status: 422,
              title: "페이스북 로그인 관련 에러 : #{@user.errors.to_s} (문제가 있다면 슬링 개발팀으로 연락주세요)"
          }
      }.to_json

      render json: response, status: 422
    end

  end

end
