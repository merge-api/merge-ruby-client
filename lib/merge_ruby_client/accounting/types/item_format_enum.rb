# frozen_string_literal: true

module Merge
  module Accounting
    # - `string` - uuid
    #  - `number` - url
    #  - `date` - email
    #  - `datetime` - phone
    #  - `bool` - currency
    #  - `list` - decimal
    class ItemFormatEnum
      STRING = "string"
      NUMBER = "number"
      DATE = "date"
      DATETIME = "datetime"
      BOOL = "bool"
      LIST = "list"
    end
  end
end
