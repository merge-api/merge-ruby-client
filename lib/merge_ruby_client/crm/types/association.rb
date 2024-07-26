# frozen_string_literal: true

require "date"
require_relative "association_association_type"
require "ostruct"
require "json"

module Merge
  module Crm
    # # The Association Object
    #  ### Description
    #  The `Association` record refers to an instance of an Association Type.
    #  ### Usage Example
    #  TODO
    class Association
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String]
      attr_reader :source_object
      # @return [String]
      attr_reader :target_object
      # @return [Merge::Crm::AssociationAssociationType] The association type the association belongs to.
      attr_reader :association_type
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param created_at [DateTime] The datetime that this object was created by Merge.
      # @param modified_at [DateTime] The datetime that this object was modified by Merge.
      # @param source_object [String]
      # @param target_object [String]
      # @param association_type [Merge::Crm::AssociationAssociationType] The association type the association belongs to.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::Association]
      def initialize(created_at: OMIT, modified_at: OMIT, source_object: OMIT, target_object: OMIT,
                     association_type: OMIT, additional_properties: nil)
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @source_object = source_object if source_object != OMIT
        @target_object = target_object if target_object != OMIT
        @association_type = association_type if association_type != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "created_at": created_at,
          "modified_at": modified_at,
          "source_object": source_object,
          "target_object": target_object,
          "association_type": association_type
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Association
      #
      # @param json_object [String]
      # @return [Merge::Crm::Association]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        source_object = parsed_json["source_object"]
        target_object = parsed_json["target_object"]
        if parsed_json["association_type"].nil?
          association_type = nil
        else
          association_type = parsed_json["association_type"].to_json
          association_type = Merge::Crm::AssociationAssociationType.from_json(json_object: association_type)
        end
        new(
          created_at: created_at,
          modified_at: modified_at,
          source_object: source_object,
          target_object: target_object,
          association_type: association_type,
          additional_properties: struct
        )
      end

      # Serialize an instance of Association to a JSON object
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
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.source_object&.is_a?(String) != false || raise("Passed value for field obj.source_object is not the expected type, validation failed.")
        obj.target_object&.is_a?(String) != false || raise("Passed value for field obj.target_object is not the expected type, validation failed.")
        obj.association_type.nil? || Merge::Crm::AssociationAssociationType.validate_raw(obj: obj.association_type)
      end
    end
  end
end
