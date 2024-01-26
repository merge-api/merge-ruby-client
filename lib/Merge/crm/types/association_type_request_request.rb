# frozen_string_literal: true

require_relative "object_class_description_request"
require "json"

module Merge
  module Crm
    class AssociationTypeRequestRequest
      attr_reader :source_object_class, :target_object_classes, :remote_key_name, :display_name, :cardinality,
                  :is_required, :additional_properties

      # @param source_object_class [Crm::ObjectClassDescriptionRequest]
      # @param target_object_classes [Array<Crm::ObjectClassDescriptionRequest>]
      # @param remote_key_name [String]
      # @param display_name [String]
      # @param cardinality [Hash{String => String}]
      # @param is_required [Boolean]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::AssociationTypeRequestRequest]
      def initialize(source_object_class:, target_object_classes:, remote_key_name:, display_name: nil,
                     cardinality: nil, is_required: nil, additional_properties: nil)
        # @type [Crm::ObjectClassDescriptionRequest]
        @source_object_class = source_object_class
        # @type [Array<Crm::ObjectClassDescriptionRequest>]
        @target_object_classes = target_object_classes
        # @type [String]
        @remote_key_name = remote_key_name
        # @type [String]
        @display_name = display_name
        # @type [Hash{String => String}]
        @cardinality = cardinality
        # @type [Boolean]
        @is_required = is_required
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AssociationTypeRequestRequest
      #
      # @param json_object [JSON]
      # @return [Crm::AssociationTypeRequestRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        source_object_class = struct.source_object_class.to_h.to_json
        source_object_class = Crm::ObjectClassDescriptionRequest.from_json(json_object: source_object_class)
        target_object_classes = struct.target_object_classes.map do |v|
          v = v.to_h.to_json
          Crm::ObjectClassDescriptionRequest.from_json(json_object: v)
        end
        remote_key_name = struct.remote_key_name
        display_name = struct.display_name
        cardinality = CARDINALITY_ENUM.key(struct.cardinality)
        is_required = struct.is_required
        new(source_object_class: source_object_class, target_object_classes: target_object_classes,
            remote_key_name: remote_key_name, display_name: display_name, cardinality: cardinality, is_required: is_required, additional_properties: struct)
      end

      # Serialize an instance of AssociationTypeRequestRequest to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "source_object_class": @source_object_class,
          "target_object_classes": @target_object_classes,
          "remote_key_name": @remote_key_name,
          "display_name": @display_name,
          "cardinality": @cardinality,
          "is_required": @is_required
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        Crm::ObjectClassDescriptionRequest.validate_raw(obj: obj.source_object_class)
        obj.target_object_classes.is_a?(Array) != false || raise("Passed value for field obj.target_object_classes is not the expected type, validation failed.")
        obj.remote_key_name.is_a?(String) != false || raise("Passed value for field obj.remote_key_name is not the expected type, validation failed.")
        obj.display_name&.is_a?(String) != false || raise("Passed value for field obj.display_name is not the expected type, validation failed.")
        obj.cardinality&.is_a?(CARDINALITY_ENUM) != false || raise("Passed value for field obj.cardinality is not the expected type, validation failed.")
        obj.is_required&.is_a?(Boolean) != false || raise("Passed value for field obj.is_required is not the expected type, validation failed.")
      end
    end
  end
end
