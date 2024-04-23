# frozen_string_literal: true

require_relative "object_class_description_request"
require_relative "cardinality_enum"
require "ostruct"
require "json"

module Merge
  module Crm
    class AssociationTypeRequestRequest
      # @return [Merge::Crm::ObjectClassDescriptionRequest]
      attr_reader :source_object_class
      # @return [Array<Merge::Crm::ObjectClassDescriptionRequest>]
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

      # @param source_object_class [Merge::Crm::ObjectClassDescriptionRequest]
      # @param target_object_classes [Array<Merge::Crm::ObjectClassDescriptionRequest>]
      # @param remote_key_name [String]
      # @param display_name [String]
      # @param cardinality [Merge::Crm::CardinalityEnum]
      # @param is_required [Boolean]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::AssociationTypeRequestRequest]
      def initialize(source_object_class:, target_object_classes:, remote_key_name:, display_name: OMIT,
                     cardinality: OMIT, is_required: OMIT, additional_properties: nil)
        @source_object_class = source_object_class
        @target_object_classes = target_object_classes
        @remote_key_name = remote_key_name
        @display_name = display_name if display_name != OMIT
        @cardinality = cardinality if cardinality != OMIT
        @is_required = is_required if is_required != OMIT
        @additional_properties = additional_properties
        @_field_set = {
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

      # Deserialize a JSON object to an instance of AssociationTypeRequestRequest
      #
      # @param json_object [String]
      # @return [Merge::Crm::AssociationTypeRequestRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["source_object_class"].nil?
          source_object_class = nil
        else
          source_object_class = parsed_json["source_object_class"].to_json
          source_object_class = Merge::Crm::ObjectClassDescriptionRequest.from_json(json_object: source_object_class)
        end
        target_object_classes = parsed_json["target_object_classes"]&.map do |v|
          v = v.to_json
          Merge::Crm::ObjectClassDescriptionRequest.from_json(json_object: v)
        end
        remote_key_name = struct["remote_key_name"]
        display_name = struct["display_name"]
        cardinality = struct["cardinality"]
        is_required = struct["is_required"]
        new(
          source_object_class: source_object_class,
          target_object_classes: target_object_classes,
          remote_key_name: remote_key_name,
          display_name: display_name,
          cardinality: cardinality,
          is_required: is_required,
          additional_properties: struct
        )
      end

      # Serialize an instance of AssociationTypeRequestRequest to a JSON object
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
        Merge::Crm::ObjectClassDescriptionRequest.validate_raw(obj: obj.source_object_class)
        obj.target_object_classes.is_a?(Array) != false || raise("Passed value for field obj.target_object_classes is not the expected type, validation failed.")
        obj.remote_key_name.is_a?(String) != false || raise("Passed value for field obj.remote_key_name is not the expected type, validation failed.")
        obj.display_name&.is_a?(String) != false || raise("Passed value for field obj.display_name is not the expected type, validation failed.")
        obj.cardinality&.is_a?(Merge::Crm::CardinalityEnum) != false || raise("Passed value for field obj.cardinality is not the expected type, validation failed.")
        obj.is_required&.is_a?(Boolean) != false || raise("Passed value for field obj.is_required is not the expected type, validation failed.")
      end
    end
  end
end
