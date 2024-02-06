# frozen_string_literal: true

module Merge
  module Ticketing
    # @type [CATEGORY_ENUM]
    CATEGORY_ENUM = {
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
