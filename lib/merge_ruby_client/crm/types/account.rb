# frozen_string_literal: true

require "date"
require_relative "account_owner"
require_relative "address"
require_relative "phone_number"
require_relative "remote_data"
require_relative "remote_field"
require "ostruct"
require "json"

module Merge
  module Crm
    # # The Account Object
    #  ### Description
    #  The `Account` object is used to represent a company in a CRM system.
    #  ### Usage Example
    #  TODO
    class Account
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [Merge::Crm::AccountOwner] The account's owner.
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
      # @return [Array<Merge::Crm::Address>]
      attr_reader :addresses
      # @return [Array<Merge::Crm::PhoneNumber>]
      attr_reader :phone_numbers
      # @return [DateTime] The last date (either most recent or furthest in the future) of when an activity
      #  occurs in an account.
      attr_reader :last_activity_at
      # @return [DateTime] When the CRM system account data was last modified by a user with a login.
      attr_reader :remote_updated_at
      # @return [DateTime] When the third party's account was created.
      attr_reader :remote_created_at
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      attr_reader :remote_was_deleted
      # @return [Hash{String => Object}]
      attr_reader :field_mappings
      # @return [Array<Merge::Crm::RemoteData>]
      attr_reader :remote_data
      # @return [Array<Merge::Crm::RemoteField>]
      attr_reader :remote_fields
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
      # @param owner [Merge::Crm::AccountOwner] The account's owner.
      # @param name [String] The account's name.
      # @param description [String] The account's description.
      # @param industry [String] The account's industry.
      # @param website [String] The account's website.
      # @param number_of_employees [Integer] The account's number of employees.
      # @param addresses [Array<Merge::Crm::Address>]
      # @param phone_numbers [Array<Merge::Crm::PhoneNumber>]
      # @param last_activity_at [DateTime] The last date (either most recent or furthest in the future) of when an activity
      #  occurs in an account.
      # @param remote_updated_at [DateTime] When the CRM system account data was last modified by a user with a login.
      # @param remote_created_at [DateTime] When the third party's account was created.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Crm::RemoteData>]
      # @param remote_fields [Array<Merge::Crm::RemoteField>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::Account]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, owner: OMIT, name: OMIT,
                     description: OMIT, industry: OMIT, website: OMIT, number_of_employees: OMIT, addresses: OMIT, phone_numbers: OMIT, last_activity_at: OMIT, remote_updated_at: OMIT, remote_created_at: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, remote_fields: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @owner = owner if owner != OMIT
        @name = name if name != OMIT
        @description = description if description != OMIT
        @industry = industry if industry != OMIT
        @website = website if website != OMIT
        @number_of_employees = number_of_employees if number_of_employees != OMIT
        @addresses = addresses if addresses != OMIT
        @phone_numbers = phone_numbers if phone_numbers != OMIT
        @last_activity_at = last_activity_at if last_activity_at != OMIT
        @remote_updated_at = remote_updated_at if remote_updated_at != OMIT
        @remote_created_at = remote_created_at if remote_created_at != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @remote_fields = remote_fields if remote_fields != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "owner": owner,
          "name": name,
          "description": description,
          "industry": industry,
          "website": website,
          "number_of_employees": number_of_employees,
          "addresses": addresses,
          "phone_numbers": phone_numbers,
          "last_activity_at": last_activity_at,
          "remote_updated_at": remote_updated_at,
          "remote_created_at": remote_created_at,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data,
          "remote_fields": remote_fields
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Account
      #
      # @param json_object [String]
      # @return [Merge::Crm::Account]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        if parsed_json["owner"].nil?
          owner = nil
        else
          owner = parsed_json["owner"].to_json
          owner = Merge::Crm::AccountOwner.from_json(json_object: owner)
        end
        name = parsed_json["name"]
        description = parsed_json["description"]
        industry = parsed_json["industry"]
        website = parsed_json["website"]
        number_of_employees = parsed_json["number_of_employees"]
        addresses = parsed_json["addresses"]&.map do |item|
          item = item.to_json
          Merge::Crm::Address.from_json(json_object: item)
        end
        phone_numbers = parsed_json["phone_numbers"]&.map do |item|
          item = item.to_json
          Merge::Crm::PhoneNumber.from_json(json_object: item)
        end
        last_activity_at = (DateTime.parse(parsed_json["last_activity_at"]) unless parsed_json["last_activity_at"].nil?)
        remote_updated_at = unless parsed_json["remote_updated_at"].nil?
                              DateTime.parse(parsed_json["remote_updated_at"])
                            end
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        remote_was_deleted = parsed_json["remote_was_deleted"]
        field_mappings = parsed_json["field_mappings"]
        remote_data = parsed_json["remote_data"]&.map do |item|
          item = item.to_json
          Merge::Crm::RemoteData.from_json(json_object: item)
        end
        remote_fields = parsed_json["remote_fields"]&.map do |item|
          item = item.to_json
          Merge::Crm::RemoteField.from_json(json_object: item)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          owner: owner,
          name: name,
          description: description,
          industry: industry,
          website: website,
          number_of_employees: number_of_employees,
          addresses: addresses,
          phone_numbers: phone_numbers,
          last_activity_at: last_activity_at,
          remote_updated_at: remote_updated_at,
          remote_created_at: remote_created_at,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          remote_fields: remote_fields,
          additional_properties: struct
        )
      end

      # Serialize an instance of Account to a JSON object
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
        obj.owner.nil? || Merge::Crm::AccountOwner.validate_raw(obj: obj.owner)
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.industry&.is_a?(String) != false || raise("Passed value for field obj.industry is not the expected type, validation failed.")
        obj.website&.is_a?(String) != false || raise("Passed value for field obj.website is not the expected type, validation failed.")
        obj.number_of_employees&.is_a?(Integer) != false || raise("Passed value for field obj.number_of_employees is not the expected type, validation failed.")
        obj.addresses&.is_a?(Array) != false || raise("Passed value for field obj.addresses is not the expected type, validation failed.")
        obj.phone_numbers&.is_a?(Array) != false || raise("Passed value for field obj.phone_numbers is not the expected type, validation failed.")
        obj.last_activity_at&.is_a?(DateTime) != false || raise("Passed value for field obj.last_activity_at is not the expected type, validation failed.")
        obj.remote_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_updated_at is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
