# frozen_string_literal: true

require "date"
require_relative "tax_rate_company"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The TaxRate Object
    #  ### Description
    #  The `TaxRate` object is used to represent a tax rate.
    #  ### Usage Example
    #  Fetch from the `LIST TaxRates` endpoint and view tax rates relevant to a
    #  company.
    class TaxRate
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String] The tax rate's description.
      attr_reader :description
      # @return [Float] The tax’s total tax rate - sum of the tax components (not compounded).
      attr_reader :total_tax_rate
      # @return [Float] The tax rate’s effective tax rate - total amount of tax with compounding.
      attr_reader :effective_tax_rate
      # @return [Merge::Accounting::TaxRateCompany] The subsidiary that the tax rate belongs to (in the case of multi-entity
      #  systems).
      attr_reader :company
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      attr_reader :remote_was_deleted
      # @return [Hash{String => Object}]
      attr_reader :field_mappings
      # @return [Array<Merge::Accounting::RemoteData>]
      attr_reader :remote_data
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
      # @param description [String] The tax rate's description.
      # @param total_tax_rate [Float] The tax’s total tax rate - sum of the tax components (not compounded).
      # @param effective_tax_rate [Float] The tax rate’s effective tax rate - total amount of tax with compounding.
      # @param company [Merge::Accounting::TaxRateCompany] The subsidiary that the tax rate belongs to (in the case of multi-entity
      #  systems).
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Accounting::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::TaxRate]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, description: OMIT,
                     total_tax_rate: OMIT, effective_tax_rate: OMIT, company: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @description = description if description != OMIT
        @total_tax_rate = total_tax_rate if total_tax_rate != OMIT
        @effective_tax_rate = effective_tax_rate if effective_tax_rate != OMIT
        @company = company if company != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "description": description,
          "total_tax_rate": total_tax_rate,
          "effective_tax_rate": effective_tax_rate,
          "company": company,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of TaxRate
      #
      # @param json_object [String]
      # @return [Merge::Accounting::TaxRate]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        description = parsed_json["description"]
        total_tax_rate = parsed_json["total_tax_rate"]
        effective_tax_rate = parsed_json["effective_tax_rate"]
        if parsed_json["company"].nil?
          company = nil
        else
          company = parsed_json["company"].to_json
          company = Merge::Accounting::TaxRateCompany.from_json(json_object: company)
        end
        remote_was_deleted = parsed_json["remote_was_deleted"]
        field_mappings = parsed_json["field_mappings"]
        remote_data = parsed_json["remote_data"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteData.from_json(json_object: item)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          description: description,
          total_tax_rate: total_tax_rate,
          effective_tax_rate: effective_tax_rate,
          company: company,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of TaxRate to a JSON object
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
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.total_tax_rate&.is_a?(Float) != false || raise("Passed value for field obj.total_tax_rate is not the expected type, validation failed.")
        obj.effective_tax_rate&.is_a?(Float) != false || raise("Passed value for field obj.effective_tax_rate is not the expected type, validation failed.")
        obj.company.nil? || Merge::Accounting::TaxRateCompany.validate_raw(obj: obj.company)
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
