# frozen_string_literal: true

require "date"
require_relative "group_type_enum"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Hris
    # # The Group Object
    #  ### Description
    #  The `Group` object is used to represent any subset of employees across, for
    #  example, `DEPARTMENT` or `TEAM`. Employees can be in multiple Groups.
    #  ### Usage Example
    #  Fetch from the `LIST Employee` endpoint and expand groups to view an employee's
    #  groups.
    class Group
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime]
      attr_reader :created_at
      # @return [DateTime] This is the datetime that this object was last updated by Merge
      attr_reader :modified_at
      # @return [String] The parent group for this group.
      attr_reader :parent_group
      # @return [String] The group name.
      attr_reader :name
      # @return [Merge::Hris::GroupTypeEnum] The Group type returned directly from the third-party.
      #  - `TEAM` - TEAM
      #  - `DEPARTMENT` - DEPARTMENT
      #  - `COST_CENTER` - COST_CENTER
      #  - `BUSINESS_UNIT` - BUSINESS_UNIT
      #  - `GROUP` - GROUP
      attr_reader :type
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      attr_reader :remote_was_deleted
      # @return [Hash{String => Object}]
      attr_reader :field_mappings
      # @return [Array<Merge::Hris::RemoteData>]
      attr_reader :remote_data
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param parent_group [String] The parent group for this group.
      # @param name [String] The group name.
      # @param type [Merge::Hris::GroupTypeEnum] The Group type returned directly from the third-party.
      #  - `TEAM` - TEAM
      #  - `DEPARTMENT` - DEPARTMENT
      #  - `COST_CENTER` - COST_CENTER
      #  - `BUSINESS_UNIT` - BUSINESS_UNIT
      #  - `GROUP` - GROUP
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Hris::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Hris::Group]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, parent_group: OMIT, name: OMIT,
                     type: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @parent_group = parent_group if parent_group != OMIT
        @name = name if name != OMIT
        @type = type if type != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "parent_group": parent_group,
          "name": name,
          "type": type,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Group
      #
      # @param json_object [String]
      # @return [Merge::Hris::Group]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct["id"]
        remote_id = struct["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        parent_group = struct["parent_group"]
        name = struct["name"]
        type = struct["type"]
        remote_was_deleted = struct["remote_was_deleted"]
        field_mappings = struct["field_mappings"]
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Merge::Hris::RemoteData.from_json(json_object: v)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          parent_group: parent_group,
          name: name,
          type: type,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of Group to a JSON object
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
        obj.parent_group&.is_a?(String) != false || raise("Passed value for field obj.parent_group is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.type&.is_a?(Merge::Hris::GroupTypeEnum) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
