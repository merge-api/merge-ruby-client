# frozen_string_literal: true

module Merge
  module Filestorage
    # @type [Hash{String => String}]
    RESPONSE_TYPE_ENUM = { json: "JSON", base_64_gzip: "BASE64_GZIP" }.frozen
  end
end
