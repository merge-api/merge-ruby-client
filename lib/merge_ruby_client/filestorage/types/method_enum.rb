# frozen_string_literal: true

module Merge
  module Filestorage
    # @type [METHOD_ENUM]
    METHOD_ENUM = {
      get: "GET",
      options: "OPTIONS",
      head: "HEAD",
      post: "POST",
      put: "PUT",
      patch: "PATCH",
      delete: "DELETE"
    }.freeze
  end
end
