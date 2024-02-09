# frozen_string_literal: true

require_relative "application_candidate"
require_relative "application_job"
require "date"
require_relative "application_credited_to"
require_relative "application_current_stage"
require_relative "application_reject_reason"
require_relative "remote_data"
require "json"

module Merge
  module Ats
    # # The Application Object
    #
    # ### Description
    #
    # The Application Object is used to represent a candidate's journey through a particular Job's recruiting process. If a Candidate applies for multiple Jobs, there will be a separate Application for each Job if the third-party integration allows it.
    #
    # ### Usage Example
    #
    # Fetch from the `LIST Applications` endpoint and filter by `ID` to show all applications.
    class Application
      attr_reader :id, :remote_id, :candidate, :job, :applied_at, :rejected_at, :source, :credited_to, :current_stage,
                  :reject_reason, :remote_was_deleted, :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param candidate [Ats::ApplicationCandidate] The candidate applying.
      # @param job [Ats::ApplicationJob] The job being applied for.
      # @param applied_at [DateTime] When the application was submitted.
      # @param rejected_at [DateTime] When the application was rejected.
      # @param source [String] The application's source.
      # @param credited_to [Ats::ApplicationCreditedTo] The user credited for this application.
      # @param current_stage [Ats::ApplicationCurrentStage] The application's current stage.
      # @param reject_reason [Ats::ApplicationRejectReason] The application's reason for rejection.
      # @param remote_was_deleted [Boolean]
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Ats::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ats::Application]
      def initialize(id: nil, remote_id: nil, candidate: nil, job: nil, applied_at: nil, rejected_at: nil, source: nil,
                     credited_to: nil, current_stage: nil, reject_reason: nil, remote_was_deleted: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [Ats::ApplicationCandidate] The candidate applying.
        @candidate = candidate
        # @type [Ats::ApplicationJob] The job being applied for.
        @job = job
        # @type [DateTime] When the application was submitted.
        @applied_at = applied_at
        # @type [DateTime] When the application was rejected.
        @rejected_at = rejected_at
        # @type [String] The application's source.
        @source = source
        # @type [Ats::ApplicationCreditedTo] The user credited for this application.
        @credited_to = credited_to
        # @type [Ats::ApplicationCurrentStage] The application's current stage.
        @current_stage = current_stage
        # @type [Ats::ApplicationRejectReason] The application's reason for rejection.
        @reject_reason = reject_reason
        # @type [Boolean]
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

      # Deserialize a JSON object to an instance of Application
      #
      # @param json_object [JSON]
      # @return [Ats::Application]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        remote_id = struct.remote_id
        if parsed_json["candidate"].nil?
          candidate = nil
        else
          candidate = parsed_json["candidate"].to_json
          candidate = Ats::ApplicationCandidate.from_json(json_object: candidate)
        end
        if parsed_json["job"].nil?
          job = nil
        else
          job = parsed_json["job"].to_json
          job = Ats::ApplicationJob.from_json(json_object: job)
        end
        applied_at = (DateTime.parse(parsed_json["applied_at"]) unless parsed_json["applied_at"].nil?)
        rejected_at = (DateTime.parse(parsed_json["rejected_at"]) unless parsed_json["rejected_at"].nil?)
        source = struct.source
        if parsed_json["credited_to"].nil?
          credited_to = nil
        else
          credited_to = parsed_json["credited_to"].to_json
          credited_to = Ats::ApplicationCreditedTo.from_json(json_object: credited_to)
        end
        if parsed_json["current_stage"].nil?
          current_stage = nil
        else
          current_stage = parsed_json["current_stage"].to_json
          current_stage = Ats::ApplicationCurrentStage.from_json(json_object: current_stage)
        end
        if parsed_json["reject_reason"].nil?
          reject_reason = nil
        else
          reject_reason = parsed_json["reject_reason"].to_json
          reject_reason = Ats::ApplicationRejectReason.from_json(json_object: reject_reason)
        end
        remote_was_deleted = struct.remote_was_deleted
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        field_mappings = struct.field_mappings
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Ats::RemoteData.from_json(json_object: v)
        end
        new(id: id, remote_id: remote_id, candidate: candidate, job: job, applied_at: applied_at,
            rejected_at: rejected_at, source: source, credited_to: credited_to, current_stage: current_stage, reject_reason: reject_reason, remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end

      # Serialize an instance of Application to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "remote_id": @remote_id,
          "candidate": @candidate,
          "job": @job,
          "applied_at": @applied_at,
          "rejected_at": @rejected_at,
          "source": @source,
          "credited_to": @credited_to,
          "current_stage": @current_stage,
          "reject_reason": @reject_reason,
          "remote_was_deleted": @remote_was_deleted,
          "created_at": @created_at,
          "modified_at": @modified_at,
          "field_mappings": @field_mappings,
          "remote_data": @remote_data
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.candidate.nil? || Ats::ApplicationCandidate.validate_raw(obj: obj.candidate)
        obj.job.nil? || Ats::ApplicationJob.validate_raw(obj: obj.job)
        obj.applied_at&.is_a?(DateTime) != false || raise("Passed value for field obj.applied_at is not the expected type, validation failed.")
        obj.rejected_at&.is_a?(DateTime) != false || raise("Passed value for field obj.rejected_at is not the expected type, validation failed.")
        obj.source&.is_a?(String) != false || raise("Passed value for field obj.source is not the expected type, validation failed.")
        obj.credited_to.nil? || Ats::ApplicationCreditedTo.validate_raw(obj: obj.credited_to)
        obj.current_stage.nil? || Ats::ApplicationCurrentStage.validate_raw(obj: obj.current_stage)
        obj.reject_reason.nil? || Ats::ApplicationRejectReason.validate_raw(obj: obj.reject_reason)
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
