# frozen_string_literal: true

module Merge
  module Filestorage
    # @type [Hash{String => String}]
    TYPE_ENUM = { user: "USER", group: "GROUP", company: "COMPANY", anyone: "ANYONE" }.frozen
  end
end
