# frozen_string_literal: true

require "date"
require_relative "remote_field_request"
require "json"

module Merge
  module Crm
    # # The Account Object
    #
    # ### Description
    #
    # The `Account` object is used to represent a company in a CRM system.
    #
    # ### Usage Example
    #
    # TODO
    class PatchedAccountRequest
      attr_reader :owner, :name, :description, :industry, :website, :number_of_employees, :last_activity_at,
                  :integration_params, :linked_account_params, :remote_fields, :additional_properties

      # @param owner [String] The account's owner.
      # @param name [String] The account's name.
      # @param description [String] The account's description.
      # @param industry [String] The account's industry.
      # @param website [String] The account's website.
      # @param number_of_employees [Integer] The account's number of employees.
      # @param last_activity_at [DateTime] The last date (either most recent or furthest in the future) of when an activity occurs in an account.
      # @param integration_params [Hash{String => String}]
      # @param linked_account_params [Hash{String => String}]
      # @param remote_fields [Array<Crm::RemoteFieldRequest>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::PatchedAccountRequest]
      def initialize(owner: nil, name: nil, description: nil, industry: nil, website: nil, number_of_employees: nil,
                     last_activity_at: nil, integration_params: nil, linked_account_params: nil, remote_fields: nil, additional_properties: nil)
        # @type [String] The account's owner.
        @owner = owner
        # @type [String] The account's name.
        @name = name
        # @type [String] The account's description.
        @description = description
        # @type [String] The account's industry.
        @industry = industry
        # @type [String] The account's website.
        @website = website
        # @type [Integer] The account's number of employees.
        @number_of_employees = number_of_employees
        # @type [DateTime] The last date (either most recent or furthest in the future) of when an activity occurs in an account.
        @last_activity_at = last_activity_at
        # @type [Hash{String => String}]
        @integration_params = integration_params
        # @type [Hash{String => String}]
        @linked_account_params = linked_account_params
        # @type [Array<Crm::RemoteFieldRequest>]
        @remote_fields = remote_fields
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of PatchedAccountRequest
      #
      # @param json_object [JSON]
      # @return [Crm::PatchedAccountRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        owner = struct.owner
        name = struct.name
        description = struct.description
        industry = struct.industry
        website = struct.website
        number_of_employees = struct.number_of_employees
        last_activity_at = (DateTime.parse(parsed_json["last_activity_at"]) unless parsed_json["last_activity_at"].nil?)
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        remote_fields = parsed_json["remote_fields"]&.map do |v|
          v = v.to_json
          Crm::RemoteFieldRequest.from_json(json_object: v)
        end
        new(owner: owner, name: name, description: description, industry: industry, website: website,
            number_of_employees: number_of_employees, last_activity_at: last_activity_at, integration_params: integration_params, linked_account_params: linked_account_params, remote_fields: remote_fields, additional_properties: struct)
      end

      # Serialize an instance of PatchedAccountRequest to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "owner": @owner,
          "name": @name,
          "description": @description,
          "industry": @industry,
          "website": @website,
          "number_of_employees": @number_of_employees,
          "last_activity_at": @last_activity_at,
          "integration_params": @integration_params,
          "linked_account_params": @linked_account_params,
          "remote_fields": @remote_fields
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.owner&.is_a?(String) != false || raise("Passed value for field obj.owner is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.industry&.is_a?(String) != false || raise("Passed value for field obj.industry is not the expected type, validation failed.")
        obj.website&.is_a?(String) != false || raise("Passed value for field obj.website is not the expected type, validation failed.")
        obj.number_of_employees&.is_a?(Integer) != false || raise("Passed value for field obj.number_of_employees is not the expected type, validation failed.")
        obj.last_activity_at&.is_a?(DateTime) != false || raise("Passed value for field obj.last_activity_at is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
