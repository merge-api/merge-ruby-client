# frozen_string_literal: true
require_relative "application_request_candidate"
require_relative "application_request_job"
require "date"
require "date"
require_relative "application_request_credited_to"
require_relative "application_request_current_stage"
require_relative "application_request_reject_reason"
require "json"

module Merge
  module Ats
    # # The Application Object 
### Description

The Application Object is used to represent a candidate's journey through a particular Job's recruiting process. If a Candidate applies for multiple Jobs, there will be a separate Application for each Job if the third-party integration allows it.

### Usage Example

Fetch from the `LIST Applications` endpoint and filter by `ID` to show all applications.
    class ApplicationRequest
      attr_reader :candidate, :job, :applied_at, :rejected_at, :source, :credited_to, :current_stage, :reject_reason, :remote_template_id, :integration_params, :linked_account_params, :additional_properties
      # @param candidate [Ats::ApplicationRequestCandidate] The candidate applying.
      # @param job [Ats::ApplicationRequestJob] The job being applied for.
      # @param applied_at [DateTime] When the application was submitted.
      # @param rejected_at [DateTime] When the application was rejected.
      # @param source [String] The application's source.
      # @param credited_to [Ats::ApplicationRequestCreditedTo] The user credited for this application.
      # @param current_stage [Ats::ApplicationRequestCurrentStage] The application's current stage.
      # @param reject_reason [Ats::ApplicationRequestRejectReason] The application's reason for rejection.
      # @param remote_template_id [String] 
      # @param integration_params [Hash{String => String}] 
      # @param linked_account_params [Hash{String => String}] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ats::ApplicationRequest]
      def initialize(candidate: nil, job: nil, applied_at: nil, rejected_at: nil, source: nil, credited_to: nil, current_stage: nil, reject_reason: nil, remote_template_id: nil, integration_params: nil, linked_account_params: nil, additional_properties: nil)
        # @type [Ats::ApplicationRequestCandidate] The candidate applying.
        @candidate = candidate
        # @type [Ats::ApplicationRequestJob] The job being applied for.
        @job = job
        # @type [DateTime] When the application was submitted.
        @applied_at = applied_at
        # @type [DateTime] When the application was rejected.
        @rejected_at = rejected_at
        # @type [String] The application's source.
        @source = source
        # @type [Ats::ApplicationRequestCreditedTo] The user credited for this application.
        @credited_to = credited_to
        # @type [Ats::ApplicationRequestCurrentStage] The application's current stage.
        @current_stage = current_stage
        # @type [Ats::ApplicationRequestRejectReason] The application's reason for rejection.
        @reject_reason = reject_reason
        # @type [String] 
        @remote_template_id = remote_template_id
        # @type [Hash{String => String}] 
        @integration_params = integration_params
        # @type [Hash{String => String}] 
        @linked_account_params = linked_account_params
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of ApplicationRequest
      #
      # @param json_object [JSON] 
      # @return [Ats::ApplicationRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        candidate = struct.candidate.to_h.to_json()
        candidate = Ats::ApplicationRequestCandidate.from_json(json_object: candidate)
        job = struct.job.to_h.to_json()
        job = Ats::ApplicationRequestJob.from_json(json_object: job)
        applied_at = DateTime.parse(struct.applied_at)
        rejected_at = DateTime.parse(struct.rejected_at)
        source = struct.source
        credited_to = struct.credited_to.to_h.to_json()
        credited_to = Ats::ApplicationRequestCreditedTo.from_json(json_object: credited_to)
        current_stage = struct.current_stage.to_h.to_json()
        current_stage = Ats::ApplicationRequestCurrentStage.from_json(json_object: current_stage)
        reject_reason = struct.reject_reason.to_h.to_json()
        reject_reason = Ats::ApplicationRequestRejectReason.from_json(json_object: reject_reason)
        remote_template_id = struct.remote_template_id
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        new(candidate: candidate, job: job, applied_at: applied_at, rejected_at: rejected_at, source: source, credited_to: credited_to, current_stage: current_stage, reject_reason: reject_reason, remote_template_id: remote_template_id, integration_params: integration_params, linked_account_params: linked_account_params, additional_properties: struct)
      end
      # Serialize an instance of ApplicationRequest to a JSON object
      #
      # @return [JSON]
      def to_json
        { "candidate": @candidate, "job": @job, "applied_at": @applied_at, "rejected_at": @rejected_at, "source": @source, "credited_to": @credited_to, "current_stage": @current_stage, "reject_reason": @reject_reason, "remote_template_id": @remote_template_id, "integration_params": @integration_params, "linked_account_params": @linked_account_params }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.candidate.nil?() || Ats::ApplicationRequestCandidate.validate_raw(obj: obj.candidate)
        obj.job.nil?() || Ats::ApplicationRequestJob.validate_raw(obj: obj.job)
        obj.applied_at&.is_a?(DateTime) != false || raise("Passed value for field obj.applied_at is not the expected type, validation failed.")
        obj.rejected_at&.is_a?(DateTime) != false || raise("Passed value for field obj.rejected_at is not the expected type, validation failed.")
        obj.source&.is_a?(String) != false || raise("Passed value for field obj.source is not the expected type, validation failed.")
        obj.credited_to.nil?() || Ats::ApplicationRequestCreditedTo.validate_raw(obj: obj.credited_to)
        obj.current_stage.nil?() || Ats::ApplicationRequestCurrentStage.validate_raw(obj: obj.current_stage)
        obj.reject_reason.nil?() || Ats::ApplicationRequestRejectReason.validate_raw(obj: obj.reject_reason)
        obj.remote_template_id&.is_a?(String) != false || raise("Passed value for field obj.remote_template_id is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end