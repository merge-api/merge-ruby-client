# frozen_string_literal: true
require_relative "scheduled_interview_application"
require_relative "scheduled_interview_job_interview_stage"
require_relative "scheduled_interview_organizer"
require_relative "scheduled_interview_interviewers_item"
require "date"
require "date"
require "date"
require "date"
require_relative "scheduled_interview_status"
require "date"
require "date"
require_relative "remote_data"
require "json"

module Merge
  module Ats
    # # The ScheduledInterview Object 
### Description

The `ScheduledInterview` object is used to represent a scheduled interview for a given candidate’s application to a job. An `Application` can have multiple `ScheduledInterview`s depending on the particular hiring process.

### Usage Example

Fetch from the `LIST ScheduledInterviews` endpoint and filter by `interviewers` to show all office locations.
    class ScheduledInterview
      attr_reader :id, :remote_id, :application, :job_interview_stage, :organizer, :interviewers, :location, :start_at, :end_at, :remote_created_at, :remote_updated_at, :status, :remote_was_deleted, :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties
      # @param id [String] 
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param application [Ats::ScheduledInterviewApplication] The application being interviewed.
      # @param job_interview_stage [Ats::ScheduledInterviewJobInterviewStage] The stage of the interview.
      # @param organizer [Ats::ScheduledInterviewOrganizer] The user organizing the interview.
      # @param interviewers [Array<Ats::ScheduledInterviewInterviewersItem>] Array of `RemoteUser` IDs.
      # @param location [String] The interview's location.
      # @param start_at [DateTime] When the interview was started.
      # @param end_at [DateTime] When the interview was ended.
      # @param remote_created_at [DateTime] When the third party's interview was created.
      # @param remote_updated_at [DateTime] When the third party's interview was updated.
      # @param status [Ats::ScheduledInterviewStatus] The interview's status.  - `SCHEDULED` - SCHEDULED
- `AWAITING_FEEDBACK` - AWAITING_FEEDBACK
- `COMPLETE` - COMPLETE
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param created_at [DateTime] 
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}] 
      # @param remote_data [Array<Ats::RemoteData>] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ats::ScheduledInterview]
      def initialize(id: nil, remote_id: nil, application: nil, job_interview_stage: nil, organizer: nil, interviewers: nil, location: nil, start_at: nil, end_at: nil, remote_created_at: nil, remote_updated_at: nil, status: nil, remote_was_deleted: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String] 
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [Ats::ScheduledInterviewApplication] The application being interviewed.
        @application = application
        # @type [Ats::ScheduledInterviewJobInterviewStage] The stage of the interview.
        @job_interview_stage = job_interview_stage
        # @type [Ats::ScheduledInterviewOrganizer] The user organizing the interview.
        @organizer = organizer
        # @type [Array<Ats::ScheduledInterviewInterviewersItem>] Array of `RemoteUser` IDs.
        @interviewers = interviewers
        # @type [String] The interview's location.
        @location = location
        # @type [DateTime] When the interview was started.
        @start_at = start_at
        # @type [DateTime] When the interview was ended.
        @end_at = end_at
        # @type [DateTime] When the third party's interview was created.
        @remote_created_at = remote_created_at
        # @type [DateTime] When the third party's interview was updated.
        @remote_updated_at = remote_updated_at
        # @type [Ats::ScheduledInterviewStatus] The interview's status. 
- `SCHEDULED` - SCHEDULED
- `AWAITING_FEEDBACK` - AWAITING_FEEDBACK
- `COMPLETE` - COMPLETE
        @status = status
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
      # Deserialize a JSON object to an instance of ScheduledInterview
      #
      # @param json_object [JSON] 
      # @return [Ats::ScheduledInterview]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        id = struct.id
        remote_id = struct.remote_id
        application = struct.application.to_h.to_json()
        application = Ats::ScheduledInterviewApplication.from_json(json_object: application)
        job_interview_stage = struct.job_interview_stage.to_h.to_json()
        job_interview_stage = Ats::ScheduledInterviewJobInterviewStage.from_json(json_object: job_interview_stage)
        organizer = struct.organizer.to_h.to_json()
        organizer = Ats::ScheduledInterviewOrganizer.from_json(json_object: organizer)
        interviewers = struct.interviewers.map() do | v |
  v = v.to_h.to_json()
  Ats::ScheduledInterviewInterviewersItem.from_json(json_object: v)
end
        location = struct.location
        start_at = DateTime.parse(struct.start_at)
        end_at = DateTime.parse(struct.end_at)
        remote_created_at = DateTime.parse(struct.remote_created_at)
        remote_updated_at = DateTime.parse(struct.remote_updated_at)
        status = struct.status.to_h.to_json()
        status = Ats::ScheduledInterviewStatus.from_json(json_object: status)
        remote_was_deleted = struct.remote_was_deleted
        created_at = DateTime.parse(struct.created_at)
        modified_at = DateTime.parse(struct.modified_at)
        field_mappings = struct.field_mappings
        remote_data = struct.remote_data.map() do | v |
  v = v.to_h.to_json()
  Ats::RemoteData.from_json(json_object: v)
end
        new(id: id, remote_id: remote_id, application: application, job_interview_stage: job_interview_stage, organizer: organizer, interviewers: interviewers, location: location, start_at: start_at, end_at: end_at, remote_created_at: remote_created_at, remote_updated_at: remote_updated_at, status: status, remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end
      # Serialize an instance of ScheduledInterview to a JSON object
      #
      # @return [JSON]
      def to_json
        { "id": @id, "remote_id": @remote_id, "application": @application, "job_interview_stage": @job_interview_stage, "organizer": @organizer, "interviewers": @interviewers, "location": @location, "start_at": @start_at, "end_at": @end_at, "remote_created_at": @remote_created_at, "remote_updated_at": @remote_updated_at, "status": @status, "remote_was_deleted": @remote_was_deleted, "created_at": @created_at, "modified_at": @modified_at, "field_mappings": @field_mappings, "remote_data": @remote_data }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.application.nil?() || Ats::ScheduledInterviewApplication.validate_raw(obj: obj.application)
        obj.job_interview_stage.nil?() || Ats::ScheduledInterviewJobInterviewStage.validate_raw(obj: obj.job_interview_stage)
        obj.organizer.nil?() || Ats::ScheduledInterviewOrganizer.validate_raw(obj: obj.organizer)
        obj.interviewers&.is_a?(Array) != false || raise("Passed value for field obj.interviewers is not the expected type, validation failed.")
        obj.location&.is_a?(String) != false || raise("Passed value for field obj.location is not the expected type, validation failed.")
        obj.start_at&.is_a?(DateTime) != false || raise("Passed value for field obj.start_at is not the expected type, validation failed.")
        obj.end_at&.is_a?(DateTime) != false || raise("Passed value for field obj.end_at is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.remote_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_updated_at is not the expected type, validation failed.")
        obj.status.nil?() || Ats::ScheduledInterviewStatus.validate_raw(obj: obj.status)
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end