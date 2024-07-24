# frozen_string_literal: true

require "date"
require_relative "application_candidate"
require_relative "application_job"
require_relative "application_offers_item"
require_relative "application_credited_to"
require_relative "application_current_stage"
require_relative "application_reject_reason"
require_relative "remote_data"
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
    class Application
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [Merge::Ats::ApplicationCandidate] The candidate applying.
      attr_reader :candidate
      # @return [Merge::Ats::ApplicationJob] The job being applied for.
      attr_reader :job
      # @return [DateTime] When the application was submitted.
      attr_reader :applied_at
      # @return [DateTime] When the application was rejected.
      attr_reader :rejected_at
      # @return [Array<Merge::Ats::ApplicationOffersItem>]
      attr_reader :offers
      # @return [String] The application's source.
      attr_reader :source
      # @return [Merge::Ats::ApplicationCreditedTo] The user credited for this application.
      attr_reader :credited_to
      # @return [Merge::Ats::ApplicationCurrentStage] The application's current stage.
      attr_reader :current_stage
      # @return [Merge::Ats::ApplicationRejectReason] The application's reason for rejection.
      attr_reader :reject_reason
      # @return [Boolean]
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
      # @param candidate [Merge::Ats::ApplicationCandidate] The candidate applying.
      # @param job [Merge::Ats::ApplicationJob] The job being applied for.
      # @param applied_at [DateTime] When the application was submitted.
      # @param rejected_at [DateTime] When the application was rejected.
      # @param offers [Array<Merge::Ats::ApplicationOffersItem>]
      # @param source [String] The application's source.
      # @param credited_to [Merge::Ats::ApplicationCreditedTo] The user credited for this application.
      # @param current_stage [Merge::Ats::ApplicationCurrentStage] The application's current stage.
      # @param reject_reason [Merge::Ats::ApplicationRejectReason] The application's reason for rejection.
      # @param remote_was_deleted [Boolean]
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Ats::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::Application]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, candidate: OMIT, job: OMIT,
                     applied_at: OMIT, rejected_at: OMIT, offers: OMIT, source: OMIT, credited_to: OMIT, current_stage: OMIT, reject_reason: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @candidate = candidate if candidate != OMIT
        @job = job if job != OMIT
        @applied_at = applied_at if applied_at != OMIT
        @rejected_at = rejected_at if rejected_at != OMIT
        @offers = offers if offers != OMIT
        @source = source if source != OMIT
        @credited_to = credited_to if credited_to != OMIT
        @current_stage = current_stage if current_stage != OMIT
        @reject_reason = reject_reason if reject_reason != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "candidate": candidate,
          "job": job,
          "applied_at": applied_at,
          "rejected_at": rejected_at,
          "offers": offers,
          "source": source,
          "credited_to": credited_to,
          "current_stage": current_stage,
          "reject_reason": reject_reason,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Application
      #
      # @param json_object [String]
      # @return [Merge::Ats::Application]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        if parsed_json["candidate"].nil?
          candidate = nil
        else
          candidate = parsed_json["candidate"].to_json
          candidate = Merge::Ats::ApplicationCandidate.from_json(json_object: candidate)
        end
        if parsed_json["job"].nil?
          job = nil
        else
          job = parsed_json["job"].to_json
          job = Merge::Ats::ApplicationJob.from_json(json_object: job)
        end
        applied_at = (DateTime.parse(parsed_json["applied_at"]) unless parsed_json["applied_at"].nil?)
        rejected_at = (DateTime.parse(parsed_json["rejected_at"]) unless parsed_json["rejected_at"].nil?)
        offers = parsed_json["offers"]&.map do |item|
          item = item.to_json
          Merge::Ats::ApplicationOffersItem.from_json(json_object: item)
        end
        source = parsed_json["source"]
        if parsed_json["credited_to"].nil?
          credited_to = nil
        else
          credited_to = parsed_json["credited_to"].to_json
          credited_to = Merge::Ats::ApplicationCreditedTo.from_json(json_object: credited_to)
        end
        if parsed_json["current_stage"].nil?
          current_stage = nil
        else
          current_stage = parsed_json["current_stage"].to_json
          current_stage = Merge::Ats::ApplicationCurrentStage.from_json(json_object: current_stage)
        end
        if parsed_json["reject_reason"].nil?
          reject_reason = nil
        else
          reject_reason = parsed_json["reject_reason"].to_json
          reject_reason = Merge::Ats::ApplicationRejectReason.from_json(json_object: reject_reason)
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
          candidate: candidate,
          job: job,
          applied_at: applied_at,
          rejected_at: rejected_at,
          offers: offers,
          source: source,
          credited_to: credited_to,
          current_stage: current_stage,
          reject_reason: reject_reason,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of Application to a JSON object
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
        obj.candidate.nil? || Merge::Ats::ApplicationCandidate.validate_raw(obj: obj.candidate)
        obj.job.nil? || Merge::Ats::ApplicationJob.validate_raw(obj: obj.job)
        obj.applied_at&.is_a?(DateTime) != false || raise("Passed value for field obj.applied_at is not the expected type, validation failed.")
        obj.rejected_at&.is_a?(DateTime) != false || raise("Passed value for field obj.rejected_at is not the expected type, validation failed.")
        obj.offers&.is_a?(Array) != false || raise("Passed value for field obj.offers is not the expected type, validation failed.")
        obj.source&.is_a?(String) != false || raise("Passed value for field obj.source is not the expected type, validation failed.")
        obj.credited_to.nil? || Merge::Ats::ApplicationCreditedTo.validate_raw(obj: obj.credited_to)
        obj.current_stage.nil? || Merge::Ats::ApplicationCurrentStage.validate_raw(obj: obj.current_stage)
        obj.reject_reason.nil? || Merge::Ats::ApplicationRejectReason.validate_raw(obj: obj.reject_reason)
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
