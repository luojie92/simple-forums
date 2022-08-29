# frozen_string_literal: true

module Deletable
  extend ActiveSupport::Concern

  included do
    scope :with_deleted, -> { unscope(where: :deleted_at) }
    scope :without_deleted, -> { where(deleted_at: nil) }
    scope :only_deleted, -> { with_deleted.where.not(deleted_at: nil) }
    scope :restore_all, -> { update(deleted_at: nil) }
  end

  def destroyed?
    self.deleted_at.present?
  end

  def destroy
    run_callbacks(:destroy) do
      touch(:deleted_at)
    end
  end

  def permanent_destroy
    transaction do
      run_callbacks(:destroy) do
        if persisted?
          self.delete
        end

        @destroyed = true
      end
    end
  end

  def restore
    self.deleted_at = nil
    self.save
  end

  class_methods do
    def permanent_destroy_all
      all.map(&:permanent_destroy)
    end
  end

end
