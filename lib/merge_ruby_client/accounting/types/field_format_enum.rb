# frozen_string_literal: true

module Merge
  module Accounting
    # - `string` - string
    #  - `number` - number
    #  - `date` - date
    #  - `datetime` - datetime
    #  - `bool` - bool
    #  - `list` - list
    class FieldFormatEnum
      STRING = "string"
      NUMBER = "number"
      DATE = "date"
      DATETIME = "datetime"
      BOOL = "bool"
      LIST = "list"
    end
  end
end
