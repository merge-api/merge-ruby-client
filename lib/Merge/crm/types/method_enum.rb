# frozen_string_literal: true

module Merge
  module Crm
    # @type [Hash{String => String}]
    METHOD_ENUM = {
      get: "GET",
      options: "OPTIONS",
      head: "HEAD",
      post: "POST",
      put: "PUT",
      patch: "PATCH",
      delete: "DELETE"
    }.frozen
  end
end
