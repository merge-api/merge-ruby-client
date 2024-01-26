# frozen_string_literal: true
require_relative "association_association_type"
require "date"
require "date"
require "json"

module Merge
  module Crm
    # # The Association Object 
### Description

The `Association` record refers to an instance of an Association Type.

### Usage Example

TODO
    class Association
      attr_reader :source_object, :target_object, :association_type, :created_at, :modified_at, :additional_properties
      # @param source_object [Hash{String => String}] 
      # @param target_object [Hash{String => String}] 
      # @param association_type [Crm::AssociationAssociationType] 
      # @param created_at [DateTime] 
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::Association]
      def initialize(source_object: nil, target_object: nil, association_type: nil, created_at: nil, modified_at: nil, additional_properties: nil)
        # @type [Hash{String => String}] 
        @source_object = source_object
        # @type [Hash{String => String}] 
        @target_object = target_object
        # @type [Crm::AssociationAssociationType] 
        @association_type = association_type
        # @type [DateTime] 
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of Association
      #
      # @param json_object [JSON] 
      # @return [Crm::Association]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        source_object = struct.source_object
        target_object = struct.target_object
        association_type = struct.association_type.to_h.to_json()
        association_type = Crm::AssociationAssociationType.from_json(json_object: association_type)
        created_at = DateTime.parse(struct.created_at)
        modified_at = DateTime.parse(struct.modified_at)
        new(source_object: source_object, target_object: target_object, association_type: association_type, created_at: created_at, modified_at: modified_at, additional_properties: struct)
      end
      # Serialize an instance of Association to a JSON object
      #
      # @return [JSON]
      def to_json
        { "source_object": @source_object, "target_object": @target_object, "association_type": @association_type, "created_at": @created_at, "modified_at": @modified_at }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.source_object&.is_a?(Hash) != false || raise("Passed value for field obj.source_object is not the expected type, validation failed.")
        obj.target_object&.is_a?(Hash) != false || raise("Passed value for field obj.target_object is not the expected type, validation failed.")
        obj.association_type.nil?() || Crm::AssociationAssociationType.validate_raw(obj: obj.association_type)
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
      end
    end
  end
end