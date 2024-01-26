# frozen_string_literal: true

module Merge
  module Accounting
    # @type [Hash{String => String}]
    REQUEST_FORMAT_ENUM = { json: "JSON", xml: "XML", multipart: "MULTIPART" }.frozen
  end
end
