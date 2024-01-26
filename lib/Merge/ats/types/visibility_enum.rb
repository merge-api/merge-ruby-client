# frozen_string_literal: true

module Merge
  module Ats
    # @type [Hash{String => String}]
    VISIBILITY_ENUM = { admin_only: "ADMIN_ONLY", public: "PUBLIC", private: "PRIVATE" }.frozen
  end
end
