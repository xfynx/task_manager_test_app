class CabinetController < ApplicationController
  def index
    # TODO: query param
    @users = User.with_role('user')
  end
end
