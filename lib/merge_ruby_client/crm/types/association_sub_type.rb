# frozen_string_literal: true

require "date"
require "json"

module Merge
  module Crm
    class AssociationSubType
      attr_reader :id, :origin_type, :created_at, :modified_at, :additional_properties

      # @param id [String]
      # @param origin_type [String]
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::AssociationSubType]
      def initialize(id: nil, origin_type: nil, created_at: nil, modified_at: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String]
        @origin_type = origin_type
        # @type [DateTime]
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AssociationSubType
      #
      # @param json_object [JSON]
      # @return [Crm::AssociationSubType]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        origin_type = struct.origin_type
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        new(id: id, origin_type: origin_type, created_at: created_at, modified_at: modified_at,
            additional_properties: struct)
      end

      # Serialize an instance of AssociationSubType to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "id": @id, "origin_type": @origin_type, "created_at": @created_at, "modified_at": @modified_at }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.origin_type&.is_a?(String) != false || raise("Passed value for field obj.origin_type is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
      end
    end
  end
end
