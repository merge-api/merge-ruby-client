# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module Merge
  module Ats
    # # The ScreeningQuestionOption Object
    #  ### Description
    #  The `ScreeningQuestionOption` object is used to represent options for a
    #  `ScreeningQuestion` object
    #  ### Usage Example
    #  TODO
    class ScreeningQuestionOption
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime]
      attr_reader :created_at
      # @return [DateTime] This is the datetime that this object was last updated by Merge
      attr_reader :modified_at
      # @return [String] Available response options
      attr_reader :label
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
      # @param label [String] Available response options
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::ScreeningQuestionOption]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, label: OMIT,
                     additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @label = label if label != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "label": label
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ScreeningQuestionOption
      #
      # @param json_object [String]
      # @return [Merge::Ats::ScreeningQuestionOption]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct["id"]
        remote_id = struct["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        label = struct["label"]
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          label: label,
          additional_properties: struct
        )
      end

      # Serialize an instance of ScreeningQuestionOption to a JSON object
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
        obj.label&.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      end
    end
  end
end
