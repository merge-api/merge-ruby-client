# frozen_string_literal: true

module Merge
  module Ats
    # - `OPEN` - OPEN
    #  - `CLOSED` - CLOSED
    #  - `DRAFT` - DRAFT
    #  - `ARCHIVED` - ARCHIVED
    #  - `PENDING` - PENDING
    class JobStatusEnum
      OPEN = "OPEN"
      CLOSED = "CLOSED"
      DRAFT = "DRAFT"
      ARCHIVED = "ARCHIVED"
      PENDING = "PENDING"
    end
  end
end
