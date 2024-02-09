# frozen_string_literal: true

module Merge
  module Ticketing
    # @type [CATEGORIES_ENUM]
    CATEGORIES_ENUM = {
      hris: "hris",
      ats: "ats",
      accounting: "accounting",
      ticketing: "ticketing",
      crm: "crm",
      mktg: "mktg",
      filestorage: "filestorage"
    }.freeze
  end
end
