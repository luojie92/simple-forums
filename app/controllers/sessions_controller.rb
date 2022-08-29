# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    required(:email, :password)
    user = User.find_by(email: params[:email])
    raise ParameterError, 'Invalid email or password' unless user
    raise ParameterError, 'Invalid email or password' unless user.authenticate(params[:password])

    expire_time = 7.days.from_now
    token = encode_jwt_token(user, expire_time)
    render json: { user: user.as_json(only: %i[id nick_name]), token: token, expire_time: expire_time }
  end

  def register_with_email
    required(:email, :password, :nick_name)
    user = User.new(register_with_email_params)
    raise UnprocessableEntityError, user.errors.full_messages.first unless user.save

    head :ok
  end

  private

  def register_with_email_params
    params.permit(:email, :password, :nick_name)
  end
end
