# frozen_string_literal: true

require "date"
require_relative "job_interview_stage_job"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Ats
    # # The JobInterviewStage Object
    #  ### Description
    #  The `JobInterviewStage` object is used to represent a particular recruiting
    #  stage for an `Application`. A given `Application` typically has the
    #  `JobInterviewStage` object represented in the current_stage field.
    #  ### Usage Example
    #  Fetch from the `LIST JobInterviewStages` endpoint and view the job interview
    #  stages used by a company.
    class JobInterviewStage
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime]
      attr_reader :created_at
      # @return [DateTime] This is the datetime that this object was last updated by Merge
      attr_reader :modified_at
      # @return [String] Standard stage names are offered by ATS systems but can be modified by users.
      attr_reader :name
      # @return [Merge::Ats::JobInterviewStageJob] This field is populated only if the stage is specific to a particular job. If
      #  the stage is generic, this field will not be populated.
      attr_reader :job
      # @return [Integer] The stage’s order, with the lowest values ordered first. If the third-party does
      #  not return details on the order of stages, this field will not be populated.
      attr_reader :stage_order
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
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
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param name [String] Standard stage names are offered by ATS systems but can be modified by users.
      # @param job [Merge::Ats::JobInterviewStageJob] This field is populated only if the stage is specific to a particular job. If
      #  the stage is generic, this field will not be populated.
      # @param stage_order [Integer] The stage’s order, with the lowest values ordered first. If the third-party does
      #  not return details on the order of stages, this field will not be populated.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Ats::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::JobInterviewStage]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, name: OMIT, job: OMIT,
                     stage_order: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @name = name if name != OMIT
        @job = job if job != OMIT
        @stage_order = stage_order if stage_order != OMIT
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
          "job": job,
          "stage_order": stage_order,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of JobInterviewStage
      #
      # @param json_object [String]
      # @return [Merge::Ats::JobInterviewStage]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct["id"]
        remote_id = struct["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        name = struct["name"]
        if parsed_json["job"].nil?
          job = nil
        else
          job = parsed_json["job"].to_json
          job = Merge::Ats::JobInterviewStageJob.from_json(json_object: job)
        end
        stage_order = struct["stage_order"]
        remote_was_deleted = struct["remote_was_deleted"]
        field_mappings = struct["field_mappings"]
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Merge::Ats::RemoteData.from_json(json_object: v)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          name: name,
          job: job,
          stage_order: stage_order,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of JobInterviewStage to a JSON object
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
        obj.job.nil? || Merge::Ats::JobInterviewStageJob.validate_raw(obj: obj.job)
        obj.stage_order&.is_a?(Integer) != false || raise("Passed value for field obj.stage_order is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
