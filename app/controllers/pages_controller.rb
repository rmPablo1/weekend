class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @start_link = user_signed_in? ? dashboard_path : new_user_session_path
  end
end
