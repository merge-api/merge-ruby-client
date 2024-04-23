# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module Merge
  module Crm
    class AssociationSubType
      # @return [String]
      attr_reader :id
      # @return [DateTime]
      attr_reader :created_at
      # @return [DateTime] This is the datetime that this object was last updated by Merge
      attr_reader :modified_at
      # @return [String]
      attr_reader :origin_type
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String]
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param origin_type [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::AssociationSubType]
      def initialize(id: OMIT, created_at: OMIT, modified_at: OMIT, origin_type: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @origin_type = origin_type if origin_type != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "created_at": created_at,
          "modified_at": modified_at,
          "origin_type": origin_type
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of AssociationSubType
      #
      # @param json_object [String]
      # @return [Merge::Crm::AssociationSubType]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct["id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        origin_type = struct["origin_type"]
        new(
          id: id,
          created_at: created_at,
          modified_at: modified_at,
          origin_type: origin_type,
          additional_properties: struct
        )
      end

      # Serialize an instance of AssociationSubType to a JSON object
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
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.origin_type&.is_a?(String) != false || raise("Passed value for field obj.origin_type is not the expected type, validation failed.")
      end
    end
  end
end
