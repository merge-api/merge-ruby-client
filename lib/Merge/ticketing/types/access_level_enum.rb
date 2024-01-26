# frozen_string_literal: true

module Merge
  module Ticketing
    # @type [Hash{String => String}]
    ACCESS_LEVEL_ENUM = { private: "PRIVATE", company: "COMPANY", public: "PUBLIC" }.frozen
  end
end
