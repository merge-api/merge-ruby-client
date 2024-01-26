# frozen_string_literal: true

module Merge
  module Filestorage
    # @type [Hash{String => String}]
    ROLES_ENUM = { read: "READ", write: "WRITE", owner: "OWNER" }.frozen
  end
end
