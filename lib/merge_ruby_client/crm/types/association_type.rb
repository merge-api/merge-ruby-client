# frozen_string_literal: true

require "date"
require_relative "association_sub_type"
require_relative "cardinality_enum"
require "ostruct"
require "json"

module Merge
  module Crm
    # # The AssociationType Object
    #  ### Description
    #  The `Association Type` object represents the relationship between two objects.
    #  ### Usage Example
    #  TODO
    class AssociationType
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [Hash{String => Object}] The class of the source object (Custom Object or Common Model) for the
      #  association type.
      attr_reader :source_object_class
      # @return [Array<Merge::Crm::AssociationSubType>]
      attr_reader :target_object_classes
      # @return [String]
      attr_reader :remote_key_name
      # @return [String]
      attr_reader :display_name
      # @return [Merge::Crm::CardinalityEnum]
      attr_reader :cardinality
      # @return [Boolean]
      attr_reader :is_required
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
      # @param source_object_class [Hash{String => Object}] The class of the source object (Custom Object or Common Model) for the
      #  association type.
      # @param target_object_classes [Array<Merge::Crm::AssociationSubType>]
      # @param remote_key_name [String]
      # @param display_name [String]
      # @param cardinality [Merge::Crm::CardinalityEnum]
      # @param is_required [Boolean]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::AssociationType]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, source_object_class: OMIT,
                     target_object_classes: OMIT, remote_key_name: OMIT, display_name: OMIT, cardinality: OMIT, is_required: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @source_object_class = source_object_class if source_object_class != OMIT
        @target_object_classes = target_object_classes if target_object_classes != OMIT
        @remote_key_name = remote_key_name if remote_key_name != OMIT
        @display_name = display_name if display_name != OMIT
        @cardinality = cardinality if cardinality != OMIT
        @is_required = is_required if is_required != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "source_object_class": source_object_class,
          "target_object_classes": target_object_classes,
          "remote_key_name": remote_key_name,
          "display_name": display_name,
          "cardinality": cardinality,
          "is_required": is_required
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of AssociationType
      #
      # @param json_object [String]
      # @return [Merge::Crm::AssociationType]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct["id"]
        remote_id = struct["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        source_object_class = struct["source_object_class"]
        target_object_classes = parsed_json["target_object_classes"]&.map do |v|
          v = v.to_json
          Merge::Crm::AssociationSubType.from_json(json_object: v)
        end
        remote_key_name = struct["remote_key_name"]
        display_name = struct["display_name"]
        cardinality = struct["cardinality"]
        is_required = struct["is_required"]
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          source_object_class: source_object_class,
          target_object_classes: target_object_classes,
          remote_key_name: remote_key_name,
          display_name: display_name,
          cardinality: cardinality,
          is_required: is_required,
          additional_properties: struct
        )
      end

      # Serialize an instance of AssociationType to a JSON object
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
        obj.source_object_class&.is_a?(Hash) != false || raise("Passed value for field obj.source_object_class is not the expected type, validation failed.")
        obj.target_object_classes&.is_a?(Array) != false || raise("Passed value for field obj.target_object_classes is not the expected type, validation failed.")
        obj.remote_key_name&.is_a?(String) != false || raise("Passed value for field obj.remote_key_name is not the expected type, validation failed.")
        obj.display_name&.is_a?(String) != false || raise("Passed value for field obj.display_name is not the expected type, validation failed.")
        obj.cardinality&.is_a?(Merge::Crm::CardinalityEnum) != false || raise("Passed value for field obj.cardinality is not the expected type, validation failed.")
        obj.is_required&.is_a?(Boolean) != false || raise("Passed value for field obj.is_required is not the expected type, validation failed.")
      end
    end
  end
end
