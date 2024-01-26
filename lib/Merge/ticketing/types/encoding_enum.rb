# frozen_string_literal: true

module Merge
  module Ticketing
    # @type [Hash{String => String}]
    ENCODING_ENUM = { raw: "RAW", base_64: "BASE64", gzip_base_64: "GZIP_BASE64" }.frozen
  end
end
