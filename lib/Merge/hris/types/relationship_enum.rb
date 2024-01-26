# frozen_string_literal: true

module Merge
  module Hris
    # @type [Hash{String => String}]
    RELATIONSHIP_ENUM = { child: "CHILD", spouse: "SPOUSE", domestic_partner: "DOMESTIC_PARTNER" }.frozen
  end
end
