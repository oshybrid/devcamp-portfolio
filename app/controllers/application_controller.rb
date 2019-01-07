class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  require 'concerns/devise_whitelist_concern.rb'
  require 'concerns/set_source_concern.rb'
  require 'concerns/current_user_concern.rb'
  require 'concerns/default_page_content_concern.rb'
  include DeviseWhitelistConcern
  include SetSourceConcern
  include CurrentUserConcern
  include DefaultPageContentConcern
end