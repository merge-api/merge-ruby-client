# frozen_string_literal: true

module Merge
  module Ats
    # @type [URL_TYPE_ENUM]
    URL_TYPE_ENUM = {
      personal: "PERSONAL",
      company: "COMPANY",
      portfolio: "PORTFOLIO",
      blog: "BLOG",
      social_media: "SOCIAL_MEDIA",
      other: "OTHER",
      job_posting: "JOB_POSTING"
    }.freeze
  end
end
