# frozen_string_literal: true

require "date"
require "json"

module Merge
  module Ats
    # # The ScreeningQuestionOption Object
    #
    # ### Description
    #
    # The `ScreeningQuestionOption` object is used to represent options for a `ScreeningQuestion` object
    #
    # ### Usage Example
    #
    # TODO
    class ScreeningQuestionOption
      attr_reader :remote_id, :label, :id, :created_at, :modified_at, :additional_properties

      # @param remote_id [String] The third-party API ID of the matching object.
      # @param label [String] Available response options
      # @param id [String]
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ats::ScreeningQuestionOption]
      def initialize(remote_id: nil, label: nil, id: nil, created_at: nil, modified_at: nil, additional_properties: nil)
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [String] Available response options
        @label = label
        # @type [String]
        @id = id
        # @type [DateTime]
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of ScreeningQuestionOption
      #
      # @param json_object [JSON]
      # @return [Ats::ScreeningQuestionOption]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        remote_id = struct.remote_id
        label = struct.label
        id = struct.id
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        new(remote_id: remote_id, label: label, id: id, created_at: created_at, modified_at: modified_at,
            additional_properties: struct)
      end

      # Serialize an instance of ScreeningQuestionOption to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "remote_id": @remote_id,
          "label": @label,
          "id": @id,
          "created_at": @created_at,
          "modified_at": @modified_at
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.label&.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
      end
    end
  end
end
