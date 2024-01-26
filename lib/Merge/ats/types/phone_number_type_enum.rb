# frozen_string_literal: true

module Merge
  module Ats
    # @type [Hash{String => String}]
    PHONE_NUMBER_TYPE_ENUM = { home: "HOME", work: "WORK", mobile: "MOBILE", skype: "SKYPE", other: "OTHER" }.frozen
  end
end
