# frozen_string_literal: true

module Merge
  module Crm
    # @type [ORIGIN_TYPE_ENUM]
    ORIGIN_TYPE_ENUM = {
      custom_object: "CUSTOM_OBJECT",
      common_model: "COMMON_MODEL",
      remote_only_model: "REMOTE_ONLY_MODEL"
    }.freeze
  end
end
