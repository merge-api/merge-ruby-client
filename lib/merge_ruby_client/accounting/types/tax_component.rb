# frozen_string_literal: true

require "date"
require_relative "component_type_enum"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The TaxRate Object
    #  ### Description
    #  The `TaxComponent` object is used to represent any sub-taxes that make up the
    #  `TaxRate`.
    #  ### Usage Example
    #  Fetch from the `LIST TaxRates` endpoint and view tax components relevant to a
    #  tax rate.
    class TaxComponent
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String] The tax rate’s name.
      attr_reader :name
      # @return [String] The tax component’s rate.
      attr_reader :rate
      # @return [Boolean] Returns True if the tax component is compound, False if not.
      attr_reader :is_compound
      # @return [Merge::Accounting::ComponentTypeEnum] Returns PURCHASE if the tax component corresponds to a purchase tax or SALES if
      #  the tax component corresponds to a sales tax.
      #  - `SALES` - SALES
      #  - `PURCHASE` - PURCHASE
      attr_reader :component_type
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      attr_reader :remote_was_deleted
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
      # @param name [String] The tax rate’s name.
      # @param rate [String] The tax component’s rate.
      # @param is_compound [Boolean] Returns True if the tax component is compound, False if not.
      # @param component_type [Merge::Accounting::ComponentTypeEnum] Returns PURCHASE if the tax component corresponds to a purchase tax or SALES if
      #  the tax component corresponds to a sales tax.
      #  - `SALES` - SALES
      #  - `PURCHASE` - PURCHASE
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::TaxComponent]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, name: OMIT, rate: OMIT,
                     is_compound: OMIT, component_type: OMIT, remote_was_deleted: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @name = name if name != OMIT
        @rate = rate if rate != OMIT
        @is_compound = is_compound if is_compound != OMIT
        @component_type = component_type if component_type != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "name": name,
          "rate": rate,
          "is_compound": is_compound,
          "component_type": component_type,
          "remote_was_deleted": remote_was_deleted
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of TaxComponent
      #
      # @param json_object [String]
      # @return [Merge::Accounting::TaxComponent]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        name = parsed_json["name"]
        rate = parsed_json["rate"]
        is_compound = parsed_json["is_compound"]
        component_type = parsed_json["component_type"]
        remote_was_deleted = parsed_json["remote_was_deleted"]
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          name: name,
          rate: rate,
          is_compound: is_compound,
          component_type: component_type,
          remote_was_deleted: remote_was_deleted,
          additional_properties: struct
        )
      end

      # Serialize an instance of TaxComponent to a JSON object
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
        obj.rate&.is_a?(String) != false || raise("Passed value for field obj.rate is not the expected type, validation failed.")
        obj.is_compound&.is_a?(Boolean) != false || raise("Passed value for field obj.is_compound is not the expected type, validation failed.")
        obj.component_type&.is_a?(Merge::Accounting::ComponentTypeEnum) != false || raise("Passed value for field obj.component_type is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
      end
    end
  end
end
