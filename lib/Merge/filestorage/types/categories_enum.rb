# frozen_string_literal: true

module Merge
  module Filestorage
    # @type [Hash{String => String}]
    CATEGORIES_ENUM = {
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
