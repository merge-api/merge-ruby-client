# frozen_string_literal: true

require_relative "association_sub_type"
require_relative "cardinality_enum"
require "date"
require "json"

module Merge
  module Crm
    # # The AssociationType Object
    #
    # ### Description
    #
    # The `Association Type` object represents the relationship between two objects.
    #
    # ### Usage Example
    #
    # TODO
    class AssociationType
      attr_reader :source_object_class, :target_object_classes, :remote_key_name, :display_name, :cardinality,
                  :is_required, :id, :remote_id, :created_at, :modified_at, :additional_properties

      # @param source_object_class [Hash{String => String}]
      # @param target_object_classes [Array<Crm::AssociationSubType>]
      # @param remote_key_name [String]
      # @param display_name [String]
      # @param cardinality [CARDINALITY_ENUM]
      # @param is_required [Boolean]
      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::AssociationType]
      def initialize(source_object_class: nil, target_object_classes: nil, remote_key_name: nil, display_name: nil,
                     cardinality: nil, is_required: nil, id: nil, remote_id: nil, created_at: nil, modified_at: nil, additional_properties: nil)
        # @type [Hash{String => String}]
        @source_object_class = source_object_class
        # @type [Array<Crm::AssociationSubType>]
        @target_object_classes = target_object_classes
        # @type [String]
        @remote_key_name = remote_key_name
        # @type [String]
        @display_name = display_name
        # @type [CARDINALITY_ENUM]
        @cardinality = cardinality
        # @type [Boolean]
        @is_required = is_required
        # @type [String]
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [DateTime]
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AssociationType
      #
      # @param json_object [JSON]
      # @return [Crm::AssociationType]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        source_object_class = struct.source_object_class
        target_object_classes = parsed_json["target_object_classes"]&.map do |v|
          v = v.to_json
          Crm::AssociationSubType.from_json(json_object: v)
        end
        remote_key_name = struct.remote_key_name
        display_name = struct.display_name
        cardinality = Crm::CARDINALITY_ENUM.key(parsed_json["cardinality"]) || parsed_json["cardinality"]
        is_required = struct.is_required
        id = struct.id
        remote_id = struct.remote_id
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        new(source_object_class: source_object_class, target_object_classes: target_object_classes,
            remote_key_name: remote_key_name, display_name: display_name, cardinality: cardinality, is_required: is_required, id: id, remote_id: remote_id, created_at: created_at, modified_at: modified_at, additional_properties: struct)
      end

      # Serialize an instance of AssociationType to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "source_object_class": @source_object_class,
          "target_object_classes": @target_object_classes,
          "remote_key_name": @remote_key_name,
          "display_name": @display_name,
          "cardinality": Crm::CARDINALITY_ENUM[@cardinality] || @cardinality,
          "is_required": @is_required,
          "id": @id,
          "remote_id": @remote_id,
          "created_at": @created_at,
          "modified_at": @modified_at
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.source_object_class&.is_a?(Hash) != false || raise("Passed value for field obj.source_object_class is not the expected type, validation failed.")
        obj.target_object_classes&.is_a?(Array) != false || raise("Passed value for field obj.target_object_classes is not the expected type, validation failed.")
        obj.remote_key_name&.is_a?(String) != false || raise("Passed value for field obj.remote_key_name is not the expected type, validation failed.")
        obj.display_name&.is_a?(String) != false || raise("Passed value for field obj.display_name is not the expected type, validation failed.")
        obj.cardinality&.is_a?(Crm::CARDINALITY_ENUM) != false || raise("Passed value for field obj.cardinality is not the expected type, validation failed.")
        obj.is_required&.is_a?(Boolean) != false || raise("Passed value for field obj.is_required is not the expected type, validation failed.")
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
      end
    end
  end
end
