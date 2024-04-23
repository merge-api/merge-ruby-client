# frozen_string_literal: true

require "date"
require_relative "accounting_period_status_enum"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The AccountingPeriod Object
    #  ### Description
    #  The `AccountingPeriod` object is used to define a period of time in which events
    #  occurred.
    #  ### Usage Example
    #  Common models like `Invoice` and `Transaction` will have `AccountingPeriod`
    #  objects which will denote when they occurred.
    class AccountingPeriod
      # @return [String]
      attr_reader :id
      # @return [DateTime]
      attr_reader :created_at
      # @return [DateTime] This is the datetime that this object was last updated by Merge
      attr_reader :modified_at
      # @return [DateTime] Beginning date of the period
      attr_reader :start_date
      # @return [DateTime] End date of the period
      attr_reader :end_date
      # @return [Merge::Accounting::AccountingPeriodStatusEnum]
      attr_reader :status
      # @return [String] Name of the accounting period.
      attr_reader :name
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String]
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param start_date [DateTime] Beginning date of the period
      # @param end_date [DateTime] End date of the period
      # @param status [Merge::Accounting::AccountingPeriodStatusEnum]
      # @param name [String] Name of the accounting period.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::AccountingPeriod]
      def initialize(id: OMIT, created_at: OMIT, modified_at: OMIT, start_date: OMIT, end_date: OMIT, status: OMIT,
                     name: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @start_date = start_date if start_date != OMIT
        @end_date = end_date if end_date != OMIT
        @status = status if status != OMIT
        @name = name if name != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "created_at": created_at,
          "modified_at": modified_at,
          "start_date": start_date,
          "end_date": end_date,
          "status": status,
          "name": name
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of AccountingPeriod
      #
      # @param json_object [String]
      # @return [Merge::Accounting::AccountingPeriod]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct["id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        start_date = (DateTime.parse(parsed_json["start_date"]) unless parsed_json["start_date"].nil?)
        end_date = (DateTime.parse(parsed_json["end_date"]) unless parsed_json["end_date"].nil?)
        status = struct["status"]
        name = struct["name"]
        new(
          id: id,
          created_at: created_at,
          modified_at: modified_at,
          start_date: start_date,
          end_date: end_date,
          status: status,
          name: name,
          additional_properties: struct
        )
      end

      # Serialize an instance of AccountingPeriod to a JSON object
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
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.start_date&.is_a?(DateTime) != false || raise("Passed value for field obj.start_date is not the expected type, validation failed.")
        obj.end_date&.is_a?(DateTime) != false || raise("Passed value for field obj.end_date is not the expected type, validation failed.")
        obj.status&.is_a?(Merge::Accounting::AccountingPeriodStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      end
    end
  end
end
