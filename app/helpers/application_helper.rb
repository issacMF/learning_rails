# frozen_string_literal: true

module ApplicationHelper
  def error_message(obj, key)
    return if obj.errors.blank?

    if key.is_a?(Array)
      key.map do |k|
        tag.p(obj.errors.full_messages_for(k).first, class: "u-mt-8 text-danger") if obj.errors.messages[k].present?
      end.compact.first
    elsif obj.errors.present? && obj.errors.messages[key]
      tag.p(obj.errors.full_messages_for(key).first, class: "u-mt-8 text-danger")
    end
  end
end
