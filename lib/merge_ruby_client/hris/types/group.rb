# frozen_string_literal: true

require_relative "group_type"
require "date"
require_relative "remote_data"
require "json"

module Merge
  module Hris
    # # The Group Object
    #
    # ### Description
    #
    # The `Group` object is used to represent any subset of employees, such as `PayGroup` or `Team`. Employees can be in multiple Groups.
    #
    # ### Usage Example
    #
    # Fetch from the `LIST Employee` endpoint and expand groups to view an employee's groups.
    class Group
      attr_reader :id, :remote_id, :parent_group, :name, :type, :remote_was_deleted, :created_at, :modified_at,
                  :field_mappings, :remote_data, :additional_properties

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param parent_group [String] The parent group for this group.
      # @param name [String] The group name.
      # @param type [Hris::GroupType] The group type
      #   - `TEAM` - TEAM
      #   - `DEPARTMENT` - DEPARTMENT
      #   - `COST_CENTER` - COST_CENTER
      #   - `BUSINESS_UNIT` - BUSINESS_UNIT
      #   - `GROUP` - GROUP
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Hris::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Hris::Group]
      def initialize(id: nil, remote_id: nil, parent_group: nil, name: nil, type: nil, remote_was_deleted: nil,
                     created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [String] The parent group for this group.
        @parent_group = parent_group
        # @type [String] The group name.
        @name = name
        # @type [Hris::GroupType] The group type
        #   - `TEAM` - TEAM
        #   - `DEPARTMENT` - DEPARTMENT
        #   - `COST_CENTER` - COST_CENTER
        #   - `BUSINESS_UNIT` - BUSINESS_UNIT
        #   - `GROUP` - GROUP
        @type = type
        # @type [Boolean] Indicates whether or not this object has been deleted in the third party platform.
        @remote_was_deleted = remote_was_deleted
        # @type [DateTime]
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [Hash{String => String}]
        @field_mappings = field_mappings
        # @type [Array<Hris::RemoteData>]
        @remote_data = remote_data
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Group
      #
      # @param json_object [JSON]
      # @return [Hris::Group]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        remote_id = struct.remote_id
        parent_group = struct.parent_group
        name = struct.name
        if parsed_json["type"].nil?
          type = nil
        else
          type = parsed_json["type"].to_json
          type = Hris::GroupType.from_json(json_object: type)
        end
        remote_was_deleted = struct.remote_was_deleted
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        field_mappings = struct.field_mappings
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Hris::RemoteData.from_json(json_object: v)
        end
        new(id: id, remote_id: remote_id, parent_group: parent_group, name: name, type: type,
            remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end

      # Serialize an instance of Group to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "remote_id": @remote_id,
          "parent_group": @parent_group,
          "name": @name,
          "type": @type,
          "remote_was_deleted": @remote_was_deleted,
          "created_at": @created_at,
          "modified_at": @modified_at,
          "field_mappings": @field_mappings,
          "remote_data": @remote_data
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.parent_group&.is_a?(String) != false || raise("Passed value for field obj.parent_group is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.type.nil? || Hris::GroupType.validate_raw(obj: obj.type)
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
