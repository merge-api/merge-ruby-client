# frozen_string_literal: true
require_relative "job_status"
require_relative "url"
require "date"
require "date"
require_relative "job_departments_item"
require_relative "job_offices_item"
require_relative "job_hiring_managers_item"
require_relative "job_recruiters_item"
require "date"
require "date"
require_relative "remote_data"
require "json"

module Merge
  module Ats
    # # The Job Object 
### Description

The `Job` object can be used to track any jobs that are currently or will be open/closed for applications.

### Usage Example

Fetch from the `LIST Jobs` endpoint to show all job postings.
    class Job
      attr_reader :id, :remote_id, :name, :description, :code, :status, :job_posting_urls, :remote_created_at, :remote_updated_at, :confidential, :departments, :offices, :hiring_managers, :recruiters, :remote_was_deleted, :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties
      # @param id [String] 
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param name [String] The job's name.
      # @param description [String] The job's description.
      # @param code [String] The job's code. Typically an additional identifier used to reference the particular job that is displayed on the ATS.
      # @param status [Ats::JobStatus] The job's status.  - `OPEN` - OPEN
- `CLOSED` - CLOSED
- `DRAFT` - DRAFT
- `ARCHIVED` - ARCHIVED
- `PENDING` - PENDING
      # @param job_posting_urls [Array<Ats::Url>] 
      # @param remote_created_at [DateTime] When the third party's job was created.
      # @param remote_updated_at [DateTime] When the third party's job was updated.
      # @param confidential [Boolean] Whether the job is confidential.
      # @param departments [Array<Ats::JobDepartmentsItem>] IDs of `Department` objects for this `Job`.
      # @param offices [Array<Ats::JobOfficesItem>] IDs of `Office` objects for this `Job`.
      # @param hiring_managers [Array<Ats::JobHiringManagersItem>] IDs of `RemoteUser` objects that serve as hiring managers for this `Job`.
      # @param recruiters [Array<Ats::JobRecruitersItem>] IDs of `RemoteUser` objects that serve as recruiters for this `Job`.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param created_at [DateTime] 
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}] 
      # @param remote_data [Array<Ats::RemoteData>] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ats::Job]
      def initialize(id: nil, remote_id: nil, name: nil, description: nil, code: nil, status: nil, job_posting_urls: nil, remote_created_at: nil, remote_updated_at: nil, confidential: nil, departments: nil, offices: nil, hiring_managers: nil, recruiters: nil, remote_was_deleted: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String] 
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [String] The job's name.
        @name = name
        # @type [String] The job's description.
        @description = description
        # @type [String] The job's code. Typically an additional identifier used to reference the particular job that is displayed on the ATS.
        @code = code
        # @type [Ats::JobStatus] The job's status. 
- `OPEN` - OPEN
- `CLOSED` - CLOSED
- `DRAFT` - DRAFT
- `ARCHIVED` - ARCHIVED
- `PENDING` - PENDING
        @status = status
        # @type [Array<Ats::Url>] 
        @job_posting_urls = job_posting_urls
        # @type [DateTime] When the third party's job was created.
        @remote_created_at = remote_created_at
        # @type [DateTime] When the third party's job was updated.
        @remote_updated_at = remote_updated_at
        # @type [Boolean] Whether the job is confidential.
        @confidential = confidential
        # @type [Array<Ats::JobDepartmentsItem>] IDs of `Department` objects for this `Job`.
        @departments = departments
        # @type [Array<Ats::JobOfficesItem>] IDs of `Office` objects for this `Job`.
        @offices = offices
        # @type [Array<Ats::JobHiringManagersItem>] IDs of `RemoteUser` objects that serve as hiring managers for this `Job`.
        @hiring_managers = hiring_managers
        # @type [Array<Ats::JobRecruitersItem>] IDs of `RemoteUser` objects that serve as recruiters for this `Job`.
        @recruiters = recruiters
        # @type [Boolean] Indicates whether or not this object has been deleted in the third party platform.
        @remote_was_deleted = remote_was_deleted
        # @type [DateTime] 
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [Hash{String => String}] 
        @field_mappings = field_mappings
        # @type [Array<Ats::RemoteData>] 
        @remote_data = remote_data
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of Job
      #
      # @param json_object [JSON] 
      # @return [Ats::Job]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        id = struct.id
        remote_id = struct.remote_id
        name = struct.name
        description = struct.description
        code = struct.code
        status = struct.status.to_h.to_json()
        status = Ats::JobStatus.from_json(json_object: status)
        job_posting_urls = struct.job_posting_urls.map() do | v |
  v = v.to_h.to_json()
  Ats::Url.from_json(json_object: v)
end
        remote_created_at = DateTime.parse(struct.remote_created_at)
        remote_updated_at = DateTime.parse(struct.remote_updated_at)
        confidential = struct.confidential
        departments = struct.departments.map() do | v |
  v = v.to_h.to_json()
  Ats::JobDepartmentsItem.from_json(json_object: v)
end
        offices = struct.offices.map() do | v |
  v = v.to_h.to_json()
  Ats::JobOfficesItem.from_json(json_object: v)
end
        hiring_managers = struct.hiring_managers.map() do | v |
  v = v.to_h.to_json()
  Ats::JobHiringManagersItem.from_json(json_object: v)
end
        recruiters = struct.recruiters.map() do | v |
  v = v.to_h.to_json()
  Ats::JobRecruitersItem.from_json(json_object: v)
end
        remote_was_deleted = struct.remote_was_deleted
        created_at = DateTime.parse(struct.created_at)
        modified_at = DateTime.parse(struct.modified_at)
        field_mappings = struct.field_mappings
        remote_data = struct.remote_data.map() do | v |
  v = v.to_h.to_json()
  Ats::RemoteData.from_json(json_object: v)
end
        new(id: id, remote_id: remote_id, name: name, description: description, code: code, status: status, job_posting_urls: job_posting_urls, remote_created_at: remote_created_at, remote_updated_at: remote_updated_at, confidential: confidential, departments: departments, offices: offices, hiring_managers: hiring_managers, recruiters: recruiters, remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end
      # Serialize an instance of Job to a JSON object
      #
      # @return [JSON]
      def to_json
        { "id": @id, "remote_id": @remote_id, "name": @name, "description": @description, "code": @code, "status": @status, "job_posting_urls": @job_posting_urls, "remote_created_at": @remote_created_at, "remote_updated_at": @remote_updated_at, "confidential": @confidential, "departments": @departments, "offices": @offices, "hiring_managers": @hiring_managers, "recruiters": @recruiters, "remote_was_deleted": @remote_was_deleted, "created_at": @created_at, "modified_at": @modified_at, "field_mappings": @field_mappings, "remote_data": @remote_data }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.code&.is_a?(String) != false || raise("Passed value for field obj.code is not the expected type, validation failed.")
        obj.status.nil?() || Ats::JobStatus.validate_raw(obj: obj.status)
        obj.job_posting_urls&.is_a?(Array) != false || raise("Passed value for field obj.job_posting_urls is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.remote_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_updated_at is not the expected type, validation failed.")
        obj.confidential&.is_a?(Boolean) != false || raise("Passed value for field obj.confidential is not the expected type, validation failed.")
        obj.departments&.is_a?(Array) != false || raise("Passed value for field obj.departments is not the expected type, validation failed.")
        obj.offices&.is_a?(Array) != false || raise("Passed value for field obj.offices is not the expected type, validation failed.")
        obj.hiring_managers&.is_a?(Array) != false || raise("Passed value for field obj.hiring_managers is not the expected type, validation failed.")
        obj.recruiters&.is_a?(Array) != false || raise("Passed value for field obj.recruiters is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end