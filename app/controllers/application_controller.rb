# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ErrorConcern
  include TokenConcern
  include AuthConcern
  include ApplicationHelper
end
