# frozen_string_literal: true

require "date"
require_relative "accounting_period_status_enum"
require "json"

module Merge
  module Accounting
    # # The AccountingPeriod Object
    #
    # ### Description
    #
    # The `AccountingPeriod` object is used to define a period of time in which events occurred.
    #
    # ### Usage Example
    #
    # Common models like `Invoice` and `Transaction` will have `AccountingPeriod` objects which will denote when they occurred.
    class AccountingPeriod
      attr_reader :start_date, :end_date, :status, :name, :id, :created_at, :modified_at, :additional_properties

      # @param start_date [DateTime] Beginning date of the period
      # @param end_date [DateTime] End date of the period
      # @param status [ACCOUNTING_PERIOD_STATUS_ENUM]
      # @param name [String] Name of the accounting period.
      # @param id [String]
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Accounting::AccountingPeriod]
      def initialize(start_date: nil, end_date: nil, status: nil, name: nil, id: nil, created_at: nil,
                     modified_at: nil, additional_properties: nil)
        # @type [DateTime] Beginning date of the period
        @start_date = start_date
        # @type [DateTime] End date of the period
        @end_date = end_date
        # @type [ACCOUNTING_PERIOD_STATUS_ENUM]
        @status = status
        # @type [String] Name of the accounting period.
        @name = name
        # @type [String]
        @id = id
        # @type [DateTime]
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AccountingPeriod
      #
      # @param json_object [JSON]
      # @return [Accounting::AccountingPeriod]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        start_date = (DateTime.parse(parsed_json["start_date"]) unless parsed_json["start_date"].nil?)
        end_date = (DateTime.parse(parsed_json["end_date"]) unless parsed_json["end_date"].nil?)
        status = Accounting::ACCOUNTING_PERIOD_STATUS_ENUM.key(parsed_json["status"]) || parsed_json["status"]
        name = struct.name
        id = struct.id
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        new(start_date: start_date, end_date: end_date, status: status, name: name, id: id, created_at: created_at,
            modified_at: modified_at, additional_properties: struct)
      end

      # Serialize an instance of AccountingPeriod to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "start_date": @start_date,
          "end_date": @end_date,
          "status": Accounting::ACCOUNTING_PERIOD_STATUS_ENUM[@status] || @status,
          "name": @name,
          "id": @id,
          "created_at": @created_at,
          "modified_at": @modified_at
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.start_date&.is_a?(DateTime) != false || raise("Passed value for field obj.start_date is not the expected type, validation failed.")
        obj.end_date&.is_a?(DateTime) != false || raise("Passed value for field obj.end_date is not the expected type, validation failed.")
        obj.status&.is_a?(Accounting::ACCOUNTING_PERIOD_STATUS_ENUM) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
      end
    end
  end
end
