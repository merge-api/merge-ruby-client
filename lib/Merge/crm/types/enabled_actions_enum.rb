# frozen_string_literal: true

module Merge
  module Crm
    # @type [Hash{String => String}]
    ENABLED_ACTIONS_ENUM = { read: "READ", write: "WRITE" }.frozen
  end
end
