# frozen_string_literal: true

require_relative "application_request_candidate"
require_relative "application_request_job"
require "date"
require_relative "application_request_offers_item"
require_relative "application_request_credited_to"
require_relative "application_request_current_stage"
require_relative "application_request_reject_reason"
require "ostruct"
require "json"

module Merge
  module Ats
    # # The Application Object
    #  ### Description
    #  The Application Object is used to represent a candidate's journey through a
    #  particular Job's recruiting process. If a Candidate applies for multiple Jobs,
    #  there will be a separate Application for each Job if the third-party integration
    #  allows it.
    #  ### Usage Example
    #  Fetch from the `LIST Applications` endpoint and filter by `ID` to show all
    #  applications.
    class ApplicationRequest
      # @return [Merge::Ats::ApplicationRequestCandidate] The candidate applying.
      attr_reader :candidate
      # @return [Merge::Ats::ApplicationRequestJob] The job being applied for.
      attr_reader :job
      # @return [DateTime] When the application was submitted.
      attr_reader :applied_at
      # @return [DateTime] When the application was rejected.
      attr_reader :rejected_at
      # @return [Array<Merge::Ats::ApplicationRequestOffersItem>]
      attr_reader :offers
      # @return [String] The application's source.
      attr_reader :source
      # @return [Merge::Ats::ApplicationRequestCreditedTo] The user credited for this application.
      attr_reader :credited_to
      # @return [Merge::Ats::ApplicationRequestCurrentStage] The application's current stage.
      attr_reader :current_stage
      # @return [Merge::Ats::ApplicationRequestRejectReason] The application's reason for rejection.
      attr_reader :reject_reason
      # @return [String]
      attr_reader :remote_template_id
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

      # @param candidate [Merge::Ats::ApplicationRequestCandidate] The candidate applying.
      # @param job [Merge::Ats::ApplicationRequestJob] The job being applied for.
      # @param applied_at [DateTime] When the application was submitted.
      # @param rejected_at [DateTime] When the application was rejected.
      # @param offers [Array<Merge::Ats::ApplicationRequestOffersItem>]
      # @param source [String] The application's source.
      # @param credited_to [Merge::Ats::ApplicationRequestCreditedTo] The user credited for this application.
      # @param current_stage [Merge::Ats::ApplicationRequestCurrentStage] The application's current stage.
      # @param reject_reason [Merge::Ats::ApplicationRequestRejectReason] The application's reason for rejection.
      # @param remote_template_id [String]
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::ApplicationRequest]
      def initialize(candidate: OMIT, job: OMIT, applied_at: OMIT, rejected_at: OMIT, offers: OMIT, source: OMIT,
                     credited_to: OMIT, current_stage: OMIT, reject_reason: OMIT, remote_template_id: OMIT, integration_params: OMIT, linked_account_params: OMIT, additional_properties: nil)
        @candidate = candidate if candidate != OMIT
        @job = job if job != OMIT
        @applied_at = applied_at if applied_at != OMIT
        @rejected_at = rejected_at if rejected_at != OMIT
        @offers = offers if offers != OMIT
        @source = source if source != OMIT
        @credited_to = credited_to if credited_to != OMIT
        @current_stage = current_stage if current_stage != OMIT
        @reject_reason = reject_reason if reject_reason != OMIT
        @remote_template_id = remote_template_id if remote_template_id != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "candidate": candidate,
          "job": job,
          "applied_at": applied_at,
          "rejected_at": rejected_at,
          "offers": offers,
          "source": source,
          "credited_to": credited_to,
          "current_stage": current_stage,
          "reject_reason": reject_reason,
          "remote_template_id": remote_template_id,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ApplicationRequest
      #
      # @param json_object [String]
      # @return [Merge::Ats::ApplicationRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["candidate"].nil?
          candidate = nil
        else
          candidate = parsed_json["candidate"].to_json
          candidate = Merge::Ats::ApplicationRequestCandidate.from_json(json_object: candidate)
        end
        if parsed_json["job"].nil?
          job = nil
        else
          job = parsed_json["job"].to_json
          job = Merge::Ats::ApplicationRequestJob.from_json(json_object: job)
        end
        applied_at = (DateTime.parse(parsed_json["applied_at"]) unless parsed_json["applied_at"].nil?)
        rejected_at = (DateTime.parse(parsed_json["rejected_at"]) unless parsed_json["rejected_at"].nil?)
        offers = parsed_json["offers"]&.map do |item|
          item = item.to_json
          Merge::Ats::ApplicationRequestOffersItem.from_json(json_object: item)
        end
        source = parsed_json["source"]
        if parsed_json["credited_to"].nil?
          credited_to = nil
        else
          credited_to = parsed_json["credited_to"].to_json
          credited_to = Merge::Ats::ApplicationRequestCreditedTo.from_json(json_object: credited_to)
        end
        if parsed_json["current_stage"].nil?
          current_stage = nil
        else
          current_stage = parsed_json["current_stage"].to_json
          current_stage = Merge::Ats::ApplicationRequestCurrentStage.from_json(json_object: current_stage)
        end
        if parsed_json["reject_reason"].nil?
          reject_reason = nil
        else
          reject_reason = parsed_json["reject_reason"].to_json
          reject_reason = Merge::Ats::ApplicationRequestRejectReason.from_json(json_object: reject_reason)
        end
        remote_template_id = parsed_json["remote_template_id"]
        integration_params = parsed_json["integration_params"]
        linked_account_params = parsed_json["linked_account_params"]
        new(
          candidate: candidate,
          job: job,
          applied_at: applied_at,
          rejected_at: rejected_at,
          offers: offers,
          source: source,
          credited_to: credited_to,
          current_stage: current_stage,
          reject_reason: reject_reason,
          remote_template_id: remote_template_id,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          additional_properties: struct
        )
      end

      # Serialize an instance of ApplicationRequest to a JSON object
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
        obj.candidate.nil? || Merge::Ats::ApplicationRequestCandidate.validate_raw(obj: obj.candidate)
        obj.job.nil? || Merge::Ats::ApplicationRequestJob.validate_raw(obj: obj.job)
        obj.applied_at&.is_a?(DateTime) != false || raise("Passed value for field obj.applied_at is not the expected type, validation failed.")
        obj.rejected_at&.is_a?(DateTime) != false || raise("Passed value for field obj.rejected_at is not the expected type, validation failed.")
        obj.offers&.is_a?(Array) != false || raise("Passed value for field obj.offers is not the expected type, validation failed.")
        obj.source&.is_a?(String) != false || raise("Passed value for field obj.source is not the expected type, validation failed.")
        obj.credited_to.nil? || Merge::Ats::ApplicationRequestCreditedTo.validate_raw(obj: obj.credited_to)
        obj.current_stage.nil? || Merge::Ats::ApplicationRequestCurrentStage.validate_raw(obj: obj.current_stage)
        obj.reject_reason.nil? || Merge::Ats::ApplicationRequestRejectReason.validate_raw(obj: obj.reject_reason)
        obj.remote_template_id&.is_a?(String) != false || raise("Passed value for field obj.remote_template_id is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
