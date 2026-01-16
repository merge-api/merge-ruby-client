# frozen_string_literal: true

require "date"
require_relative "scheduled_interview_status_enum"
require "ostruct"
require "json"

module Merge
  module Ats
    # # The ScheduledInterview Object
    #  ### Description
    #  The `ScheduledInterview` object is used to represent a scheduled interview for a
    #  given candidate’s application to a job. An `Application` can have multiple
    #  `ScheduledInterview`s depending on the particular hiring process.
    #  ### Usage Example
    #  Fetch from the `LIST ScheduledInterviews` endpoint and filter by `interviewers`
    #  to show all office locations.
    class ScheduledInterviewRequest
      # @return [String] The application being interviewed.
      attr_reader :application
      # @return [String] The stage of the interview.
      attr_reader :job_interview_stage
      # @return [String] The user organizing the interview.
      attr_reader :organizer
      # @return [Array<String>] Array of `RemoteUser` IDs.
      attr_reader :interviewers
      # @return [String] The interview's location.
      attr_reader :location
      # @return [DateTime] When the interview was started.
      attr_reader :start_at
      # @return [DateTime] When the interview was ended.
      attr_reader :end_at
      # @return [Merge::Ats::ScheduledInterviewStatusEnum] The interview's status.
      #  * `SCHEDULED` - SCHEDULED
      #  * `AWAITING_FEEDBACK` - AWAITING_FEEDBACK
      #  * `COMPLETE` - COMPLETE
      attr_reader :status
      # @return [Hash{String => Object}]
      attr_reader :integration_params
      # @return [Hash{String => Object}]
      attr_reader :linked_account_params
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param application [String] The application being interviewed.
      # @param job_interview_stage [String] The stage of the interview.
      # @param organizer [String] The user organizing the interview.
      # @param interviewers [Array<String>] Array of `RemoteUser` IDs.
      # @param location [String] The interview's location.
      # @param start_at [DateTime] When the interview was started.
      # @param end_at [DateTime] When the interview was ended.
      # @param status [Merge::Ats::ScheduledInterviewStatusEnum] The interview's status.
      #  * `SCHEDULED` - SCHEDULED
      #  * `AWAITING_FEEDBACK` - AWAITING_FEEDBACK
      #  * `COMPLETE` - COMPLETE
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::ScheduledInterviewRequest]
      def initialize(application: OMIT, job_interview_stage: OMIT, organizer: OMIT, interviewers: OMIT, location: OMIT,
                     start_at: OMIT, end_at: OMIT, status: OMIT, integration_params: OMIT, linked_account_params: OMIT, additional_properties: nil)
        @application = application if application != OMIT
        @job_interview_stage = job_interview_stage if job_interview_stage != OMIT
        @organizer = organizer if organizer != OMIT
        @interviewers = interviewers if interviewers != OMIT
        @location = location if location != OMIT
        @start_at = start_at if start_at != OMIT
        @end_at = end_at if end_at != OMIT
        @status = status if status != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "application": application,
          "job_interview_stage": job_interview_stage,
          "organizer": organizer,
          "interviewers": interviewers,
          "location": location,
          "start_at": start_at,
          "end_at": end_at,
          "status": status,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ScheduledInterviewRequest
      #
      # @param json_object [String]
      # @return [Merge::Ats::ScheduledInterviewRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        application = parsed_json["application"]
        job_interview_stage = parsed_json["job_interview_stage"]
        organizer = parsed_json["organizer"]
        interviewers = parsed_json["interviewers"]
        location = parsed_json["location"]
        start_at = (DateTime.parse(parsed_json["start_at"]) unless parsed_json["start_at"].nil?)
        end_at = (DateTime.parse(parsed_json["end_at"]) unless parsed_json["end_at"].nil?)
        status = parsed_json["status"]
        integration_params = parsed_json["integration_params"]
        linked_account_params = parsed_json["linked_account_params"]
        new(
          application: application,
          job_interview_stage: job_interview_stage,
          organizer: organizer,
          interviewers: interviewers,
          location: location,
          start_at: start_at,
          end_at: end_at,
          status: status,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          additional_properties: struct
        )
      end

      # Serialize an instance of ScheduledInterviewRequest to a JSON object
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
        obj.application&.is_a?(String) != false || raise("Passed value for field obj.application is not the expected type, validation failed.")
        obj.job_interview_stage&.is_a?(String) != false || raise("Passed value for field obj.job_interview_stage is not the expected type, validation failed.")
        obj.organizer&.is_a?(String) != false || raise("Passed value for field obj.organizer is not the expected type, validation failed.")
        obj.interviewers&.is_a?(Array) != false || raise("Passed value for field obj.interviewers is not the expected type, validation failed.")
        obj.location&.is_a?(String) != false || raise("Passed value for field obj.location is not the expected type, validation failed.")
        obj.start_at&.is_a?(DateTime) != false || raise("Passed value for field obj.start_at is not the expected type, validation failed.")
        obj.end_at&.is_a?(DateTime) != false || raise("Passed value for field obj.end_at is not the expected type, validation failed.")
        obj.status&.is_a?(Merge::Ats::ScheduledInterviewStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
