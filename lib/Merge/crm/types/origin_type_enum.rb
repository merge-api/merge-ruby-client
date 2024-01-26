# frozen_string_literal: true

module Merge
  module Crm
    # @type [Hash{String => String}]
    ORIGIN_TYPE_ENUM = {
      custom_object: "CUSTOM_OBJECT",
      common_model: "COMMON_MODEL",
      remote_only_model: "REMOTE_ONLY_MODEL"
    }.frozen
  end
end
