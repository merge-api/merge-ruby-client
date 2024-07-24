# frozen_string_literal: true

require "date"
require_relative "remote_field_class_for_custom_object_class"
require "ostruct"
require "json"

module Merge
  module Crm
    # # The Custom Object Class Object
    #  ### Description
    #  The `Custom Object Class` object is used to represent a Custom Object Schema in
    #  the remote system.
    #  ### Usage Example
    #  TODO
    class CustomObjectClass
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime]
      attr_reader :created_at
      # @return [DateTime]
      attr_reader :modified_at
      # @return [String] The custom object class's name.
      attr_reader :name
      # @return [String] The custom object class's description.
      attr_reader :description
      # @return [Hash{String => String}] The custom object class's singular and plural labels.
      attr_reader :labels
      # @return [Array<Merge::Crm::RemoteFieldClassForCustomObjectClass>]
      attr_reader :fields
      # @return [Array<Hash{String => Object}>] The types of associations with other models that the custom object class can
      #  have.
      attr_reader :association_types
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param created_at [DateTime]
      # @param modified_at [DateTime]
      # @param name [String] The custom object class's name.
      # @param description [String] The custom object class's description.
      # @param labels [Hash{String => String}] The custom object class's singular and plural labels.
      # @param fields [Array<Merge::Crm::RemoteFieldClassForCustomObjectClass>]
      # @param association_types [Array<Hash{String => Object}>] The types of associations with other models that the custom object class can
      #  have.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::CustomObjectClass]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, name: OMIT, description: OMIT,
                     labels: OMIT, fields: OMIT, association_types: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @name = name if name != OMIT
        @description = description if description != OMIT
        @labels = labels if labels != OMIT
        @fields = fields if fields != OMIT
        @association_types = association_types if association_types != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "name": name,
          "description": description,
          "labels": labels,
          "fields": fields,
          "association_types": association_types
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of CustomObjectClass
      #
      # @param json_object [String]
      # @return [Merge::Crm::CustomObjectClass]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        name = parsed_json["name"]
        description = parsed_json["description"]
        labels = parsed_json["labels"]
        fields = parsed_json["fields"]&.map do |item|
          item = item.to_json
          Merge::Crm::RemoteFieldClassForCustomObjectClass.from_json(json_object: item)
        end
        association_types = parsed_json["association_types"]
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          name: name,
          description: description,
          labels: labels,
          fields: fields,
          association_types: association_types,
          additional_properties: struct
        )
      end

      # Serialize an instance of CustomObjectClass to a JSON object
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
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.labels&.is_a?(Hash) != false || raise("Passed value for field obj.labels is not the expected type, validation failed.")
        obj.fields&.is_a?(Array) != false || raise("Passed value for field obj.fields is not the expected type, validation failed.")
        obj.association_types&.is_a?(Array) != false || raise("Passed value for field obj.association_types is not the expected type, validation failed.")
      end
    end
  end
end
