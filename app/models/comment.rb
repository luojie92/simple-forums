# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user, primary_key: :id, foreign_key: :from_uid
end
