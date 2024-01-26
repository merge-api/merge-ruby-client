# frozen_string_literal: true

module Merge
  module Ticketing
    # @type [Hash{String => String}]
    CATEGORY_ENUM = {
      hris: "hris",
      ats: "ats",
      accounting: "accounting",
      ticketing: "ticketing",
      crm: "crm",
      mktg: "mktg",
      filestorage: "filestorage"
    }.frozen
  end
end
