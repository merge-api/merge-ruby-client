# frozen_string_literal: true

require_relative "address_request"
require "date"
require_relative "remote_field_request"
require "ostruct"
require "json"

module Merge
  module Crm
    # # The Account Object
    #  ### Description
    #  The `Account` object is used to represent a company in a CRM system.
    #  ### Usage Example
    #  TODO
    class PatchedAccountRequest
      # @return [String] The account's owner.
      attr_reader :owner
      # @return [String] The account's name.
      attr_reader :name
      # @return [String] The account's description.
      attr_reader :description
      # @return [String] The account's industry.
      attr_reader :industry
      # @return [String] The account's website.
      attr_reader :website
      # @return [Integer] The account's number of employees.
      attr_reader :number_of_employees
      # @return [Array<Merge::Crm::AddressRequest>]
      attr_reader :addresses
      # @return [DateTime] The last date (either most recent or furthest in the future) of when an activity
      #  occurs in an account.
      attr_reader :last_activity_at
      # @return [Hash{String => Object}]
      attr_reader :integration_params
      # @return [Hash{String => Object}]
      attr_reader :linked_account_params
      # @return [Array<Merge::Crm::RemoteFieldRequest>]
      attr_reader :remote_fields
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param owner [String] The account's owner.
      # @param name [String] The account's name.
      # @param description [String] The account's description.
      # @param industry [String] The account's industry.
      # @param website [String] The account's website.
      # @param number_of_employees [Integer] The account's number of employees.
      # @param addresses [Array<Merge::Crm::AddressRequest>]
      # @param last_activity_at [DateTime] The last date (either most recent or furthest in the future) of when an activity
      #  occurs in an account.
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param remote_fields [Array<Merge::Crm::RemoteFieldRequest>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::PatchedAccountRequest]
      def initialize(owner: OMIT, name: OMIT, description: OMIT, industry: OMIT, website: OMIT,
                     number_of_employees: OMIT, addresses: OMIT, last_activity_at: OMIT, integration_params: OMIT, linked_account_params: OMIT, remote_fields: OMIT, additional_properties: nil)
        @owner = owner if owner != OMIT
        @name = name if name != OMIT
        @description = description if description != OMIT
        @industry = industry if industry != OMIT
        @website = website if website != OMIT
        @number_of_employees = number_of_employees if number_of_employees != OMIT
        @addresses = addresses if addresses != OMIT
        @last_activity_at = last_activity_at if last_activity_at != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @remote_fields = remote_fields if remote_fields != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "owner": owner,
          "name": name,
          "description": description,
          "industry": industry,
          "website": website,
          "number_of_employees": number_of_employees,
          "addresses": addresses,
          "last_activity_at": last_activity_at,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params,
          "remote_fields": remote_fields
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of PatchedAccountRequest
      #
      # @param json_object [String]
      # @return [Merge::Crm::PatchedAccountRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        owner = struct["owner"]
        name = struct["name"]
        description = struct["description"]
        industry = struct["industry"]
        website = struct["website"]
        number_of_employees = struct["number_of_employees"]
        addresses = parsed_json["addresses"]&.map do |v|
          v = v.to_json
          Merge::Crm::AddressRequest.from_json(json_object: v)
        end
        last_activity_at = (DateTime.parse(parsed_json["last_activity_at"]) unless parsed_json["last_activity_at"].nil?)
        integration_params = struct["integration_params"]
        linked_account_params = struct["linked_account_params"]
        remote_fields = parsed_json["remote_fields"]&.map do |v|
          v = v.to_json
          Merge::Crm::RemoteFieldRequest.from_json(json_object: v)
        end
        new(
          owner: owner,
          name: name,
          description: description,
          industry: industry,
          website: website,
          number_of_employees: number_of_employees,
          addresses: addresses,
          last_activity_at: last_activity_at,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          remote_fields: remote_fields,
          additional_properties: struct
        )
      end

      # Serialize an instance of PatchedAccountRequest to a JSON object
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
        obj.owner&.is_a?(String) != false || raise("Passed value for field obj.owner is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.industry&.is_a?(String) != false || raise("Passed value for field obj.industry is not the expected type, validation failed.")
        obj.website&.is_a?(String) != false || raise("Passed value for field obj.website is not the expected type, validation failed.")
        obj.number_of_employees&.is_a?(Integer) != false || raise("Passed value for field obj.number_of_employees is not the expected type, validation failed.")
        obj.addresses&.is_a?(Array) != false || raise("Passed value for field obj.addresses is not the expected type, validation failed.")
        obj.last_activity_at&.is_a?(DateTime) != false || raise("Passed value for field obj.last_activity_at is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
