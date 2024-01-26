# frozen_string_literal: true
require_relative "scheduled_interview_request_application"
require_relative "scheduled_interview_request_job_interview_stage"
require_relative "scheduled_interview_request_organizer"
require_relative "scheduled_interview_request_interviewers_item"
require "date"
require "date"
require_relative "scheduled_interview_request_status"
require "json"

module Merge
  module Ats
    # # The ScheduledInterview Object 
### Description

The `ScheduledInterview` object is used to represent a scheduled interview for a given candidate’s application to a job. An `Application` can have multiple `ScheduledInterview`s depending on the particular hiring process.

### Usage Example

Fetch from the `LIST ScheduledInterviews` endpoint and filter by `interviewers` to show all office locations.
    class ScheduledInterviewRequest
      attr_reader :application, :job_interview_stage, :organizer, :interviewers, :location, :start_at, :end_at, :status, :integration_params, :linked_account_params, :additional_properties
      # @param application [Ats::ScheduledInterviewRequestApplication] The application being interviewed.
      # @param job_interview_stage [Ats::ScheduledInterviewRequestJobInterviewStage] The stage of the interview.
      # @param organizer [Ats::ScheduledInterviewRequestOrganizer] The user organizing the interview.
      # @param interviewers [Array<Ats::ScheduledInterviewRequestInterviewersItem>] Array of `RemoteUser` IDs.
      # @param location [String] The interview's location.
      # @param start_at [DateTime] When the interview was started.
      # @param end_at [DateTime] When the interview was ended.
      # @param status [Ats::ScheduledInterviewRequestStatus] The interview's status.  - `SCHEDULED` - SCHEDULED
- `AWAITING_FEEDBACK` - AWAITING_FEEDBACK
- `COMPLETE` - COMPLETE
      # @param integration_params [Hash{String => String}] 
      # @param linked_account_params [Hash{String => String}] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ats::ScheduledInterviewRequest]
      def initialize(application: nil, job_interview_stage: nil, organizer: nil, interviewers: nil, location: nil, start_at: nil, end_at: nil, status: nil, integration_params: nil, linked_account_params: nil, additional_properties: nil)
        # @type [Ats::ScheduledInterviewRequestApplication] The application being interviewed.
        @application = application
        # @type [Ats::ScheduledInterviewRequestJobInterviewStage] The stage of the interview.
        @job_interview_stage = job_interview_stage
        # @type [Ats::ScheduledInterviewRequestOrganizer] The user organizing the interview.
        @organizer = organizer
        # @type [Array<Ats::ScheduledInterviewRequestInterviewersItem>] Array of `RemoteUser` IDs.
        @interviewers = interviewers
        # @type [String] The interview's location.
        @location = location
        # @type [DateTime] When the interview was started.
        @start_at = start_at
        # @type [DateTime] When the interview was ended.
        @end_at = end_at
        # @type [Ats::ScheduledInterviewRequestStatus] The interview's status. 
- `SCHEDULED` - SCHEDULED
- `AWAITING_FEEDBACK` - AWAITING_FEEDBACK
- `COMPLETE` - COMPLETE
        @status = status
        # @type [Hash{String => String}] 
        @integration_params = integration_params
        # @type [Hash{String => String}] 
        @linked_account_params = linked_account_params
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of ScheduledInterviewRequest
      #
      # @param json_object [JSON] 
      # @return [Ats::ScheduledInterviewRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        application = struct.application.to_h.to_json()
        application = Ats::ScheduledInterviewRequestApplication.from_json(json_object: application)
        job_interview_stage = struct.job_interview_stage.to_h.to_json()
        job_interview_stage = Ats::ScheduledInterviewRequestJobInterviewStage.from_json(json_object: job_interview_stage)
        organizer = struct.organizer.to_h.to_json()
        organizer = Ats::ScheduledInterviewRequestOrganizer.from_json(json_object: organizer)
        interviewers = struct.interviewers.map() do | v |
  v = v.to_h.to_json()
  Ats::ScheduledInterviewRequestInterviewersItem.from_json(json_object: v)
end
        location = struct.location
        start_at = DateTime.parse(struct.start_at)
        end_at = DateTime.parse(struct.end_at)
        status = struct.status.to_h.to_json()
        status = Ats::ScheduledInterviewRequestStatus.from_json(json_object: status)
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        new(application: application, job_interview_stage: job_interview_stage, organizer: organizer, interviewers: interviewers, location: location, start_at: start_at, end_at: end_at, status: status, integration_params: integration_params, linked_account_params: linked_account_params, additional_properties: struct)
      end
      # Serialize an instance of ScheduledInterviewRequest to a JSON object
      #
      # @return [JSON]
      def to_json
        { "application": @application, "job_interview_stage": @job_interview_stage, "organizer": @organizer, "interviewers": @interviewers, "location": @location, "start_at": @start_at, "end_at": @end_at, "status": @status, "integration_params": @integration_params, "linked_account_params": @linked_account_params }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.application.nil?() || Ats::ScheduledInterviewRequestApplication.validate_raw(obj: obj.application)
        obj.job_interview_stage.nil?() || Ats::ScheduledInterviewRequestJobInterviewStage.validate_raw(obj: obj.job_interview_stage)
        obj.organizer.nil?() || Ats::ScheduledInterviewRequestOrganizer.validate_raw(obj: obj.organizer)
        obj.interviewers&.is_a?(Array) != false || raise("Passed value for field obj.interviewers is not the expected type, validation failed.")
        obj.location&.is_a?(String) != false || raise("Passed value for field obj.location is not the expected type, validation failed.")
        obj.start_at&.is_a?(DateTime) != false || raise("Passed value for field obj.start_at is not the expected type, validation failed.")
        obj.end_at&.is_a?(DateTime) != false || raise("Passed value for field obj.end_at is not the expected type, validation failed.")
        obj.status.nil?() || Ats::ScheduledInterviewRequestStatus.validate_raw(obj: obj.status)
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end