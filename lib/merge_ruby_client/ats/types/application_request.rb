# frozen_string_literal: true

require "date"
require_relative "screening_question_answer_request"
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
      # @return [String] The candidate applying.
      attr_reader :candidate
      # @return [String] The job being applied for.
      attr_reader :job
      # @return [DateTime] When the application was submitted.
      attr_reader :applied_at
      # @return [DateTime] When the application was rejected.
      attr_reader :rejected_at
      # @return [Array<String>]
      attr_reader :offers
      # @return [String] The application's source.
      attr_reader :source
      # @return [String] The user credited for this application.
      attr_reader :credited_to
      # @return [Array<Merge::Ats::ScreeningQuestionAnswerRequest>]
      attr_reader :screening_question_answers
      # @return [String] The application's current stage.
      attr_reader :current_stage
      # @return [String] The application's reason for rejection.
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

      # @param candidate [String] The candidate applying.
      # @param job [String] The job being applied for.
      # @param applied_at [DateTime] When the application was submitted.
      # @param rejected_at [DateTime] When the application was rejected.
      # @param offers [Array<String>]
      # @param source [String] The application's source.
      # @param credited_to [String] The user credited for this application.
      # @param screening_question_answers [Array<Merge::Ats::ScreeningQuestionAnswerRequest>]
      # @param current_stage [String] The application's current stage.
      # @param reject_reason [String] The application's reason for rejection.
      # @param remote_template_id [String]
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::ApplicationRequest]
      def initialize(candidate: OMIT, job: OMIT, applied_at: OMIT, rejected_at: OMIT, offers: OMIT, source: OMIT,
                     credited_to: OMIT, screening_question_answers: OMIT, current_stage: OMIT, reject_reason: OMIT, remote_template_id: OMIT, integration_params: OMIT, linked_account_params: OMIT, additional_properties: nil)
        @candidate = candidate if candidate != OMIT
        @job = job if job != OMIT
        @applied_at = applied_at if applied_at != OMIT
        @rejected_at = rejected_at if rejected_at != OMIT
        @offers = offers if offers != OMIT
        @source = source if source != OMIT
        @credited_to = credited_to if credited_to != OMIT
        @screening_question_answers = screening_question_answers if screening_question_answers != OMIT
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
          "screening_question_answers": screening_question_answers,
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
        candidate = parsed_json["candidate"]
        job = parsed_json["job"]
        applied_at = (DateTime.parse(parsed_json["applied_at"]) unless parsed_json["applied_at"].nil?)
        rejected_at = (DateTime.parse(parsed_json["rejected_at"]) unless parsed_json["rejected_at"].nil?)
        offers = parsed_json["offers"]
        source = parsed_json["source"]
        credited_to = parsed_json["credited_to"]
        screening_question_answers = parsed_json["screening_question_answers"]&.map do |item|
          item = item.to_json
          Merge::Ats::ScreeningQuestionAnswerRequest.from_json(json_object: item)
        end
        current_stage = parsed_json["current_stage"]
        reject_reason = parsed_json["reject_reason"]
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
          screening_question_answers: screening_question_answers,
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
        obj.candidate&.is_a?(String) != false || raise("Passed value for field obj.candidate is not the expected type, validation failed.")
        obj.job&.is_a?(String) != false || raise("Passed value for field obj.job is not the expected type, validation failed.")
        obj.applied_at&.is_a?(DateTime) != false || raise("Passed value for field obj.applied_at is not the expected type, validation failed.")
        obj.rejected_at&.is_a?(DateTime) != false || raise("Passed value for field obj.rejected_at is not the expected type, validation failed.")
        obj.offers&.is_a?(Array) != false || raise("Passed value for field obj.offers is not the expected type, validation failed.")
        obj.source&.is_a?(String) != false || raise("Passed value for field obj.source is not the expected type, validation failed.")
        obj.credited_to&.is_a?(String) != false || raise("Passed value for field obj.credited_to is not the expected type, validation failed.")
        obj.screening_question_answers&.is_a?(Array) != false || raise("Passed value for field obj.screening_question_answers is not the expected type, validation failed.")
        obj.current_stage&.is_a?(String) != false || raise("Passed value for field obj.current_stage is not the expected type, validation failed.")
        obj.reject_reason&.is_a?(String) != false || raise("Passed value for field obj.reject_reason is not the expected type, validation failed.")
        obj.remote_template_id&.is_a?(String) != false || raise("Passed value for field obj.remote_template_id is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
