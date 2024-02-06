# frozen_string_literal: true

require_relative "job_interview_stage_job"
require "date"
require_relative "remote_data"
require "json"

module Merge
  module Ats
    # # The JobInterviewStage Object
    #
    # ### Description
    #
    # The `JobInterviewStage` object is used to represent a particular recruiting stage for an `Application`. A given `Application` typically has the `JobInterviewStage` object represented in the current_stage field.
    #
    # ### Usage Example
    #
    # Fetch from the `LIST JobInterviewStages` endpoint and view the job interview stages used by a company.
    class JobInterviewStage
      attr_reader :id, :remote_id, :name, :job, :stage_order, :remote_was_deleted, :created_at, :modified_at,
                  :field_mappings, :remote_data, :additional_properties

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param name [String] Standard stage names are offered by ATS systems but can be modified by users.
      # @param job [Ats::JobInterviewStageJob] This field is populated only if the stage is specific to a particular job. If the stage is generic, this field will not be populated.
      # @param stage_order [Integer] The stage’s order, with the lowest values ordered first. If the third-party does not return details on the order of stages, this field will not be populated.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Ats::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ats::JobInterviewStage]
      def initialize(id: nil, remote_id: nil, name: nil, job: nil, stage_order: nil, remote_was_deleted: nil,
                     created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [String] Standard stage names are offered by ATS systems but can be modified by users.
        @name = name
        # @type [Ats::JobInterviewStageJob] This field is populated only if the stage is specific to a particular job. If the stage is generic, this field will not be populated.
        @job = job
        # @type [Integer] The stage’s order, with the lowest values ordered first. If the third-party does not return details on the order of stages, this field will not be populated.
        @stage_order = stage_order
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

      # Deserialize a JSON object to an instance of JobInterviewStage
      #
      # @param json_object [JSON]
      # @return [Ats::JobInterviewStage]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        remote_id = struct.remote_id
        name = struct.name
        if parsed_json["job"].nil?
          job = nil
        else
          job = parsed_json["job"].to_json
          job = Ats::JobInterviewStageJob.from_json(json_object: job)
        end
        stage_order = struct.stage_order
        remote_was_deleted = struct.remote_was_deleted
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        field_mappings = struct.field_mappings
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Ats::RemoteData.from_json(json_object: v)
        end
        new(id: id, remote_id: remote_id, name: name, job: job, stage_order: stage_order,
            remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end

      # Serialize an instance of JobInterviewStage to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "remote_id": @remote_id,
          "name": @name,
          "job": @job,
          "stage_order": @stage_order,
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
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.job.nil? || Ats::JobInterviewStageJob.validate_raw(obj: obj.job)
        obj.stage_order&.is_a?(Integer) != false || raise("Passed value for field obj.stage_order is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
