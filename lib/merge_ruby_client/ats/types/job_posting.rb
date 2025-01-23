# frozen_string_literal: true

require "date"
require_relative "job_posting_job_posting_urls_item"
require_relative "job_posting_job"
require_relative "job_posting_status_enum"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Ats
    # # The JobPosting Object
    #  ### Description
    #  The `JobPosting` object represents an external announcement on a job board
    #  created by an organization to attract qualified candidates to apply for a
    #  specific `Job` opening
    #  ### Usage Example
    #  Fetch from the `LIST JobPostings` endpoint to show all job postings.
    class JobPosting
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String] The job posting’s title.
      attr_reader :title
      # @return [Array<Merge::Ats::JobPostingJobPostingUrlsItem>] The Url object is used to represent hyperlinks for a candidate to apply to a
      #  given job.
      attr_reader :job_posting_urls
      # @return [Merge::Ats::JobPostingJob] ID of `Job` object for this `JobPosting`.
      attr_reader :job
      # @return [Merge::Ats::JobPostingStatusEnum] The job posting's status.
      #  - `PUBLISHED` - PUBLISHED
      #  - `CLOSED` - CLOSED
      #  - `DRAFT` - DRAFT
      #  - `INTERNAL` - INTERNAL
      #  - `PENDING` - PENDING
      attr_reader :status
      # @return [String] The job posting’s content.
      attr_reader :content
      # @return [DateTime] When the third party's job posting was created.
      attr_reader :remote_created_at
      # @return [DateTime] When the third party's job posting was updated.
      attr_reader :remote_updated_at
      # @return [Boolean] Indicates whether the job posting is internal or external.
      attr_reader :is_internal
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      attr_reader :remote_was_deleted
      # @return [Hash{String => Object}]
      attr_reader :field_mappings
      # @return [Array<Merge::Ats::RemoteData>]
      attr_reader :remote_data
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param created_at [DateTime] The datetime that this object was created by Merge.
      # @param modified_at [DateTime] The datetime that this object was modified by Merge.
      # @param title [String] The job posting’s title.
      # @param job_posting_urls [Array<Merge::Ats::JobPostingJobPostingUrlsItem>] The Url object is used to represent hyperlinks for a candidate to apply to a
      #  given job.
      # @param job [Merge::Ats::JobPostingJob] ID of `Job` object for this `JobPosting`.
      # @param status [Merge::Ats::JobPostingStatusEnum] The job posting's status.
      #  - `PUBLISHED` - PUBLISHED
      #  - `CLOSED` - CLOSED
      #  - `DRAFT` - DRAFT
      #  - `INTERNAL` - INTERNAL
      #  - `PENDING` - PENDING
      # @param content [String] The job posting’s content.
      # @param remote_created_at [DateTime] When the third party's job posting was created.
      # @param remote_updated_at [DateTime] When the third party's job posting was updated.
      # @param is_internal [Boolean] Indicates whether the job posting is internal or external.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Ats::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::JobPosting]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, title: OMIT,
                     job_posting_urls: OMIT, job: OMIT, status: OMIT, content: OMIT, remote_created_at: OMIT, remote_updated_at: OMIT, is_internal: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @title = title if title != OMIT
        @job_posting_urls = job_posting_urls if job_posting_urls != OMIT
        @job = job if job != OMIT
        @status = status if status != OMIT
        @content = content if content != OMIT
        @remote_created_at = remote_created_at if remote_created_at != OMIT
        @remote_updated_at = remote_updated_at if remote_updated_at != OMIT
        @is_internal = is_internal if is_internal != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "title": title,
          "job_posting_urls": job_posting_urls,
          "job": job,
          "status": status,
          "content": content,
          "remote_created_at": remote_created_at,
          "remote_updated_at": remote_updated_at,
          "is_internal": is_internal,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of JobPosting
      #
      # @param json_object [String]
      # @return [Merge::Ats::JobPosting]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        title = parsed_json["title"]
        job_posting_urls = parsed_json["job_posting_urls"]&.map do |item|
          item = item.to_json
          Merge::Ats::JobPostingJobPostingUrlsItem.from_json(json_object: item)
        end
        if parsed_json["job"].nil?
          job = nil
        else
          job = parsed_json["job"].to_json
          job = Merge::Ats::JobPostingJob.from_json(json_object: job)
        end
        status = parsed_json["status"]
        content = parsed_json["content"]
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        remote_updated_at = unless parsed_json["remote_updated_at"].nil?
                              DateTime.parse(parsed_json["remote_updated_at"])
                            end
        is_internal = parsed_json["is_internal"]
        remote_was_deleted = parsed_json["remote_was_deleted"]
        field_mappings = parsed_json["field_mappings"]
        remote_data = parsed_json["remote_data"]&.map do |item|
          item = item.to_json
          Merge::Ats::RemoteData.from_json(json_object: item)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          title: title,
          job_posting_urls: job_posting_urls,
          job: job,
          status: status,
          content: content,
          remote_created_at: remote_created_at,
          remote_updated_at: remote_updated_at,
          is_internal: is_internal,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of JobPosting to a JSON object
      #
      # @return [String]
      def to_json(*_args)
        @_field_set&.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given
      #  hash and check each fields type against the current object's property
      #  definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
        obj.job_posting_urls&.is_a?(Array) != false || raise("Passed value for field obj.job_posting_urls is not the expected type, validation failed.")
        obj.job.nil? || Merge::Ats::JobPostingJob.validate_raw(obj: obj.job)
        obj.status&.is_a?(Merge::Ats::JobPostingStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.content&.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.remote_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_updated_at is not the expected type, validation failed.")
        obj.is_internal&.is_a?(Boolean) != false || raise("Passed value for field obj.is_internal is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
