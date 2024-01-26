# frozen_string_literal: true

module Merge
  module Ticketing
    module Collections
      # @type [Hash{String => String}]
      COLLECTIONS_LIST_REQUEST_COLLECTION_TYPE = { list: "LIST", project: "PROJECT" }.frozen
    end
  end
end
