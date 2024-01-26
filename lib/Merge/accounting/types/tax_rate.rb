# frozen_string_literal: true
require_relative "tax_rate_company"
require "date"
require "date"
require_relative "remote_data"
require "json"

module Merge
  module Accounting
    # # The TaxRate Object 
### Description

The `TaxRate` object is used to represent a tax rate.

### Usage Example

Fetch from the `LIST TaxRates` endpoint and view tax rates relevant to a company.
    class TaxRate
      attr_reader :description, :total_tax_rate, :effective_tax_rate, :company, :remote_was_deleted, :id, :remote_id, :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties
      # @param description [String] The tax rate's description.
      # @param total_tax_rate [Float] The tax rate's total tax rate.
      # @param effective_tax_rate [Float] The tax rate's effective tax rate.
      # @param company [Accounting::TaxRateCompany] The company the tax rate belongs to.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param id [String] 
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param created_at [DateTime] 
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}] 
      # @param remote_data [Array<Accounting::RemoteData>] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Accounting::TaxRate]
      def initialize(description: nil, total_tax_rate: nil, effective_tax_rate: nil, company: nil, remote_was_deleted: nil, id: nil, remote_id: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String] The tax rate's description.
        @description = description
        # @type [Float] The tax rate's total tax rate.
        @total_tax_rate = total_tax_rate
        # @type [Float] The tax rate's effective tax rate.
        @effective_tax_rate = effective_tax_rate
        # @type [Accounting::TaxRateCompany] The company the tax rate belongs to.
        @company = company
        # @type [Boolean] Indicates whether or not this object has been deleted in the third party platform.
        @remote_was_deleted = remote_was_deleted
        # @type [String] 
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [DateTime] 
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [Hash{String => String}] 
        @field_mappings = field_mappings
        # @type [Array<Accounting::RemoteData>] 
        @remote_data = remote_data
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of TaxRate
      #
      # @param json_object [JSON] 
      # @return [Accounting::TaxRate]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        description = struct.description
        total_tax_rate = struct.total_tax_rate
        effective_tax_rate = struct.effective_tax_rate
        company = struct.company.to_h.to_json()
        company = Accounting::TaxRateCompany.from_json(json_object: company)
        remote_was_deleted = struct.remote_was_deleted
        id = struct.id
        remote_id = struct.remote_id
        created_at = DateTime.parse(struct.created_at)
        modified_at = DateTime.parse(struct.modified_at)
        field_mappings = struct.field_mappings
        remote_data = struct.remote_data.map() do | v |
  v = v.to_h.to_json()
  Accounting::RemoteData.from_json(json_object: v)
end
        new(description: description, total_tax_rate: total_tax_rate, effective_tax_rate: effective_tax_rate, company: company, remote_was_deleted: remote_was_deleted, id: id, remote_id: remote_id, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end
      # Serialize an instance of TaxRate to a JSON object
      #
      # @return [JSON]
      def to_json
        { "description": @description, "total_tax_rate": @total_tax_rate, "effective_tax_rate": @effective_tax_rate, "company": @company, "remote_was_deleted": @remote_was_deleted, "id": @id, "remote_id": @remote_id, "created_at": @created_at, "modified_at": @modified_at, "field_mappings": @field_mappings, "remote_data": @remote_data }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.total_tax_rate&.is_a?(Float) != false || raise("Passed value for field obj.total_tax_rate is not the expected type, validation failed.")
        obj.effective_tax_rate&.is_a?(Float) != false || raise("Passed value for field obj.effective_tax_rate is not the expected type, validation failed.")
        obj.company.nil?() || Accounting::TaxRateCompany.validate_raw(obj: obj.company)
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end