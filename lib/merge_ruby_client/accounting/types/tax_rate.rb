# frozen_string_literal: true

require "date"
require_relative "tax_rate_company"
require_relative "status_7_d_1_enum"
require_relative "tax_rate_tax_components_item"
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
      # @return [Merge::Accounting::TaxRateCompany] The subsidiary that the tax rate belongs to (in the case of multi-entity
      #  systems).
      attr_reader :company
      # @return [String] The tax code associated with this tax rate or group of tax rates from the
      #  third-party platform.
      attr_reader :code
      # @return [String] The tax rate’s name.
      attr_reader :name
      # @return [String] The tax rate's description.
      attr_reader :description
      # @return [Merge::Accounting::Status7D1Enum] The tax rate’s status - `ACTIVE` if an active tax rate, `ARCHIVED` if not
      #  active.
      #  * `ACTIVE` - ACTIVE
      #  * `ARCHIVED` - ARCHIVED
      attr_reader :status
      # @return [String] The country the tax rate is associated with.
      attr_reader :country
      # @return [Float] The tax’s total tax rate - sum of the tax components (not compounded).
      attr_reader :total_tax_rate
      # @return [Float] The tax rate’s effective tax rate - total amount of tax with compounding.
      attr_reader :effective_tax_rate
      # @return [Array<Merge::Accounting::TaxRateTaxComponentsItem>] The related tax components of the tax rate.
      attr_reader :tax_components
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
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
      # @param company [Merge::Accounting::TaxRateCompany] The subsidiary that the tax rate belongs to (in the case of multi-entity
      #  systems).
      # @param code [String] The tax code associated with this tax rate or group of tax rates from the
      #  third-party platform.
      # @param name [String] The tax rate’s name.
      # @param description [String] The tax rate's description.
      # @param status [Merge::Accounting::Status7D1Enum] The tax rate’s status - `ACTIVE` if an active tax rate, `ARCHIVED` if not
      #  active.
      #  * `ACTIVE` - ACTIVE
      #  * `ARCHIVED` - ARCHIVED
      # @param country [String] The country the tax rate is associated with.
      # @param total_tax_rate [Float] The tax’s total tax rate - sum of the tax components (not compounded).
      # @param effective_tax_rate [Float] The tax rate’s effective tax rate - total amount of tax with compounding.
      # @param tax_components [Array<Merge::Accounting::TaxRateTaxComponentsItem>] The related tax components of the tax rate.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Accounting::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::TaxRate]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, company: OMIT, code: OMIT,
                     name: OMIT, description: OMIT, status: OMIT, country: OMIT, total_tax_rate: OMIT, effective_tax_rate: OMIT, tax_components: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @company = company if company != OMIT
        @code = code if code != OMIT
        @name = name if name != OMIT
        @description = description if description != OMIT
        @status = status if status != OMIT
        @country = country if country != OMIT
        @total_tax_rate = total_tax_rate if total_tax_rate != OMIT
        @effective_tax_rate = effective_tax_rate if effective_tax_rate != OMIT
        @tax_components = tax_components if tax_components != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "company": company,
          "code": code,
          "name": name,
          "description": description,
          "status": status,
          "country": country,
          "total_tax_rate": total_tax_rate,
          "effective_tax_rate": effective_tax_rate,
          "tax_components": tax_components,
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
        if parsed_json["company"].nil?
          company = nil
        else
          company = parsed_json["company"].to_json
          company = Merge::Accounting::TaxRateCompany.from_json(json_object: company)
        end
        code = parsed_json["code"]
        name = parsed_json["name"]
        description = parsed_json["description"]
        status = parsed_json["status"]
        country = parsed_json["country"]
        total_tax_rate = parsed_json["total_tax_rate"]
        effective_tax_rate = parsed_json["effective_tax_rate"]
        tax_components = parsed_json["tax_components"]&.map do |item|
          item = item.to_json
          Merge::Accounting::TaxRateTaxComponentsItem.from_json(json_object: item)
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
          company: company,
          code: code,
          name: name,
          description: description,
          status: status,
          country: country,
          total_tax_rate: total_tax_rate,
          effective_tax_rate: effective_tax_rate,
          tax_components: tax_components,
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
        obj.company.nil? || Merge::Accounting::TaxRateCompany.validate_raw(obj: obj.company)
        obj.code&.is_a?(String) != false || raise("Passed value for field obj.code is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.status&.is_a?(Merge::Accounting::Status7D1Enum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.country&.is_a?(String) != false || raise("Passed value for field obj.country is not the expected type, validation failed.")
        obj.total_tax_rate&.is_a?(Float) != false || raise("Passed value for field obj.total_tax_rate is not the expected type, validation failed.")
        obj.effective_tax_rate&.is_a?(Float) != false || raise("Passed value for field obj.effective_tax_rate is not the expected type, validation failed.")
        obj.tax_components&.is_a?(Array) != false || raise("Passed value for field obj.tax_components is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
