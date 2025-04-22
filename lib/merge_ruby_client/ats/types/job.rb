# frozen_string_literal: true

require "date"
require_relative "job_status_enum"
require_relative "job_type_enum"
require_relative "url"
require_relative "job_departments_item"
require_relative "job_offices_item"
require_relative "job_hiring_managers_item"
require_relative "job_recruiters_item"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Ats
    # # The Job Object
    #  ### Description
    #  The `Job` object can be used to track any jobs that are currently or will be
    #  open/closed for applications.
    #  ### Usage Example
    #  Fetch from the `LIST Jobs` endpoint to show all job postings.
    class Job
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String] The job's name.
      attr_reader :name
      # @return [String] The job's description.
      attr_reader :description
      # @return [String] The job's code. Typically an additional identifier used to reference the
      #  particular job that is displayed on the ATS.
      attr_reader :code
      # @return [Merge::Ats::JobStatusEnum] The job's status.
      #  * `OPEN` - OPEN
      #  * `CLOSED` - CLOSED
      #  * `DRAFT` - DRAFT
      #  * `ARCHIVED` - ARCHIVED
      #  * `PENDING` - PENDING
      attr_reader :status
      # @return [Merge::Ats::JobTypeEnum] The job's type.
      #  * `POSTING` - POSTING
      #  * `REQUISITION` - REQUISITION
      #  * `PROFILE` - PROFILE
      attr_reader :type
      # @return [Array<String>] IDs of `JobPosting` objects that serve as job postings for this `Job`.
      attr_reader :job_postings
      # @return [Array<Merge::Ats::Url>]
      attr_reader :job_posting_urls
      # @return [DateTime] When the third party's job was created.
      attr_reader :remote_created_at
      # @return [DateTime] When the third party's job was updated.
      attr_reader :remote_updated_at
      # @return [Boolean] Whether the job is confidential.
      attr_reader :confidential
      # @return [Array<Merge::Ats::JobDepartmentsItem>] IDs of `Department` objects for this `Job`.
      attr_reader :departments
      # @return [Array<Merge::Ats::JobOfficesItem>] IDs of `Office` objects for this `Job`.
      attr_reader :offices
      # @return [Array<Merge::Ats::JobHiringManagersItem>] IDs of `RemoteUser` objects that serve as hiring managers for this `Job`.
      attr_reader :hiring_managers
      # @return [Array<Merge::Ats::JobRecruitersItem>] IDs of `RemoteUser` objects that serve as recruiters for this `Job`.
      attr_reader :recruiters
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
      # @param name [String] The job's name.
      # @param description [String] The job's description.
      # @param code [String] The job's code. Typically an additional identifier used to reference the
      #  particular job that is displayed on the ATS.
      # @param status [Merge::Ats::JobStatusEnum] The job's status.
      #  * `OPEN` - OPEN
      #  * `CLOSED` - CLOSED
      #  * `DRAFT` - DRAFT
      #  * `ARCHIVED` - ARCHIVED
      #  * `PENDING` - PENDING
      # @param type [Merge::Ats::JobTypeEnum] The job's type.
      #  * `POSTING` - POSTING
      #  * `REQUISITION` - REQUISITION
      #  * `PROFILE` - PROFILE
      # @param job_postings [Array<String>] IDs of `JobPosting` objects that serve as job postings for this `Job`.
      # @param job_posting_urls [Array<Merge::Ats::Url>]
      # @param remote_created_at [DateTime] When the third party's job was created.
      # @param remote_updated_at [DateTime] When the third party's job was updated.
      # @param confidential [Boolean] Whether the job is confidential.
      # @param departments [Array<Merge::Ats::JobDepartmentsItem>] IDs of `Department` objects for this `Job`.
      # @param offices [Array<Merge::Ats::JobOfficesItem>] IDs of `Office` objects for this `Job`.
      # @param hiring_managers [Array<Merge::Ats::JobHiringManagersItem>] IDs of `RemoteUser` objects that serve as hiring managers for this `Job`.
      # @param recruiters [Array<Merge::Ats::JobRecruitersItem>] IDs of `RemoteUser` objects that serve as recruiters for this `Job`.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Ats::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::Job]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, name: OMIT, description: OMIT,
                     code: OMIT, status: OMIT, type: OMIT, job_postings: OMIT, job_posting_urls: OMIT, remote_created_at: OMIT, remote_updated_at: OMIT, confidential: OMIT, departments: OMIT, offices: OMIT, hiring_managers: OMIT, recruiters: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @name = name if name != OMIT
        @description = description if description != OMIT
        @code = code if code != OMIT
        @status = status if status != OMIT
        @type = type if type != OMIT
        @job_postings = job_postings if job_postings != OMIT
        @job_posting_urls = job_posting_urls if job_posting_urls != OMIT
        @remote_created_at = remote_created_at if remote_created_at != OMIT
        @remote_updated_at = remote_updated_at if remote_updated_at != OMIT
        @confidential = confidential if confidential != OMIT
        @departments = departments if departments != OMIT
        @offices = offices if offices != OMIT
        @hiring_managers = hiring_managers if hiring_managers != OMIT
        @recruiters = recruiters if recruiters != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "name": name,
          "description": description,
          "code": code,
          "status": status,
          "type": type,
          "job_postings": job_postings,
          "job_posting_urls": job_posting_urls,
          "remote_created_at": remote_created_at,
          "remote_updated_at": remote_updated_at,
          "confidential": confidential,
          "departments": departments,
          "offices": offices,
          "hiring_managers": hiring_managers,
          "recruiters": recruiters,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Job
      #
      # @param json_object [String]
      # @return [Merge::Ats::Job]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        name = parsed_json["name"]
        description = parsed_json["description"]
        code = parsed_json["code"]
        status = parsed_json["status"]
        type = parsed_json["type"]
        job_postings = parsed_json["job_postings"]
        job_posting_urls = parsed_json["job_posting_urls"]&.map do |item|
          item = item.to_json
          Merge::Ats::Url.from_json(json_object: item)
        end
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        remote_updated_at = unless parsed_json["remote_updated_at"].nil?
                              DateTime.parse(parsed_json["remote_updated_at"])
                            end
        confidential = parsed_json["confidential"]
        departments = parsed_json["departments"]&.map do |item|
          item = item.to_json
          Merge::Ats::JobDepartmentsItem.from_json(json_object: item)
        end
        offices = parsed_json["offices"]&.map do |item|
          item = item.to_json
          Merge::Ats::JobOfficesItem.from_json(json_object: item)
        end
        hiring_managers = parsed_json["hiring_managers"]&.map do |item|
          item = item.to_json
          Merge::Ats::JobHiringManagersItem.from_json(json_object: item)
        end
        recruiters = parsed_json["recruiters"]&.map do |item|
          item = item.to_json
          Merge::Ats::JobRecruitersItem.from_json(json_object: item)
        end
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
          name: name,
          description: description,
          code: code,
          status: status,
          type: type,
          job_postings: job_postings,
          job_posting_urls: job_posting_urls,
          remote_created_at: remote_created_at,
          remote_updated_at: remote_updated_at,
          confidential: confidential,
          departments: departments,
          offices: offices,
          hiring_managers: hiring_managers,
          recruiters: recruiters,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of Job to a JSON object
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
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.code&.is_a?(String) != false || raise("Passed value for field obj.code is not the expected type, validation failed.")
        obj.status&.is_a?(Merge::Ats::JobStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.type&.is_a?(Merge::Ats::JobTypeEnum) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        obj.job_postings&.is_a?(Array) != false || raise("Passed value for field obj.job_postings is not the expected type, validation failed.")
        obj.job_posting_urls&.is_a?(Array) != false || raise("Passed value for field obj.job_posting_urls is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.remote_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_updated_at is not the expected type, validation failed.")
        obj.confidential&.is_a?(Boolean) != false || raise("Passed value for field obj.confidential is not the expected type, validation failed.")
        obj.departments&.is_a?(Array) != false || raise("Passed value for field obj.departments is not the expected type, validation failed.")
        obj.offices&.is_a?(Array) != false || raise("Passed value for field obj.offices is not the expected type, validation failed.")
        obj.hiring_managers&.is_a?(Array) != false || raise("Passed value for field obj.hiring_managers is not the expected type, validation failed.")
        obj.recruiters&.is_a?(Array) != false || raise("Passed value for field obj.recruiters is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
