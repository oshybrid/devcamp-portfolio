class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  require 'concerns/devise_whitelist.rb'
  include DeviseWhitelist
end