class Api::V1:: SessionsController < ApplicationController
  def create
    account = Account.find_by(username: params[:username])
    if account.present? && account.authenticate(params[:password])
	    render json: {id: account.id}
    else
      render json: {message: 'not okay'}, status: 404
    end
  end
end
