class StaticController < ApplicationController
  def main
  end
  before_action :authenticate_user, only: [:user]

  def user  	
  end
end
