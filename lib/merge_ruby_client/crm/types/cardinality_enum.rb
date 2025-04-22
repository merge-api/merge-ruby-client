# frozen_string_literal: true

module Merge
  module Crm
    # * `ONE_TO_ONE` - ONE_TO_ONE
    #  * `MANY_TO_ONE` - MANY_TO_ONE
    #  * `MANY_TO_MANY` - MANY_TO_MANY
    #  * `ONE_TO_MANY` - ONE_TO_MANY
    class CardinalityEnum
      ONE_TO_ONE = "ONE_TO_ONE"
      MANY_TO_ONE = "MANY_TO_ONE"
      MANY_TO_MANY = "MANY_TO_MANY"
      ONE_TO_MANY = "ONE_TO_MANY"
    end
  end
end
