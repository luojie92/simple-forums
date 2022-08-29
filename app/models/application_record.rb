# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def errors_as_sentence
    errors.full_messages.to_sentence
  end
end
