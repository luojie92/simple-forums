# frozen_string_literal: true

module ApplicationHelper
  def required(*options)
    options.each do |option|
      raise ActionController::ParameterMissing, option if !params.key?(option) || params[option].to_s.empty?
    end
  end
end
