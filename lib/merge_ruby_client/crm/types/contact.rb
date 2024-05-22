# frozen_string_literal: true

require "date"
require_relative "contact_account"
require_relative "contact_owner"
require_relative "address"
require_relative "email_address"
require_relative "phone_number"
require_relative "remote_data"
require_relative "remote_field"
require "ostruct"
require "json"

module Merge
  module Crm
    # # The Contact Object
    #  ### Description
    #  The `Contact` object is used to represent an existing point of contact at a
    #  company in a CRM system.
    #  ### Usage Example
    #  TODO
    class Contact
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String] The contact's first name.
      attr_reader :first_name
      # @return [String] The contact's last name.
      attr_reader :last_name
      # @return [Merge::Crm::ContactAccount] The contact's account.
      attr_reader :account
      # @return [Merge::Crm::ContactOwner] The contact's owner.
      attr_reader :owner
      # @return [Array<Merge::Crm::Address>]
      attr_reader :addresses
      # @return [Array<Merge::Crm::EmailAddress>]
      attr_reader :email_addresses
      # @return [Array<Merge::Crm::PhoneNumber>]
      attr_reader :phone_numbers
      # @return [DateTime] When the contact's last activity occurred.
      attr_reader :last_activity_at
      # @return [DateTime] When the third party's contact was created.
      attr_reader :remote_created_at
      # @return [Boolean]
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
      # @param first_name [String] The contact's first name.
      # @param last_name [String] The contact's last name.
      # @param account [Merge::Crm::ContactAccount] The contact's account.
      # @param owner [Merge::Crm::ContactOwner] The contact's owner.
      # @param addresses [Array<Merge::Crm::Address>]
      # @param email_addresses [Array<Merge::Crm::EmailAddress>]
      # @param phone_numbers [Array<Merge::Crm::PhoneNumber>]
      # @param last_activity_at [DateTime] When the contact's last activity occurred.
      # @param remote_created_at [DateTime] When the third party's contact was created.
      # @param remote_was_deleted [Boolean]
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Crm::RemoteData>]
      # @param remote_fields [Array<Merge::Crm::RemoteField>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::Contact]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, first_name: OMIT, last_name: OMIT,
                     account: OMIT, owner: OMIT, addresses: OMIT, email_addresses: OMIT, phone_numbers: OMIT, last_activity_at: OMIT, remote_created_at: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, remote_fields: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @first_name = first_name if first_name != OMIT
        @last_name = last_name if last_name != OMIT
        @account = account if account != OMIT
        @owner = owner if owner != OMIT
        @addresses = addresses if addresses != OMIT
        @email_addresses = email_addresses if email_addresses != OMIT
        @phone_numbers = phone_numbers if phone_numbers != OMIT
        @last_activity_at = last_activity_at if last_activity_at != OMIT
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
          "first_name": first_name,
          "last_name": last_name,
          "account": account,
          "owner": owner,
          "addresses": addresses,
          "email_addresses": email_addresses,
          "phone_numbers": phone_numbers,
          "last_activity_at": last_activity_at,
          "remote_created_at": remote_created_at,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data,
          "remote_fields": remote_fields
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Contact
      #
      # @param json_object [String]
      # @return [Merge::Crm::Contact]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct["id"]
        remote_id = struct["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        first_name = struct["first_name"]
        last_name = struct["last_name"]
        if parsed_json["account"].nil?
          account = nil
        else
          account = parsed_json["account"].to_json
          account = Merge::Crm::ContactAccount.from_json(json_object: account)
        end
        if parsed_json["owner"].nil?
          owner = nil
        else
          owner = parsed_json["owner"].to_json
          owner = Merge::Crm::ContactOwner.from_json(json_object: owner)
        end
        addresses = parsed_json["addresses"]&.map do |v|
          v = v.to_json
          Merge::Crm::Address.from_json(json_object: v)
        end
        email_addresses = parsed_json["email_addresses"]&.map do |v|
          v = v.to_json
          Merge::Crm::EmailAddress.from_json(json_object: v)
        end
        phone_numbers = parsed_json["phone_numbers"]&.map do |v|
          v = v.to_json
          Merge::Crm::PhoneNumber.from_json(json_object: v)
        end
        last_activity_at = (DateTime.parse(parsed_json["last_activity_at"]) unless parsed_json["last_activity_at"].nil?)
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        remote_was_deleted = struct["remote_was_deleted"]
        field_mappings = struct["field_mappings"]
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Merge::Crm::RemoteData.from_json(json_object: v)
        end
        remote_fields = parsed_json["remote_fields"]&.map do |v|
          v = v.to_json
          Merge::Crm::RemoteField.from_json(json_object: v)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          first_name: first_name,
          last_name: last_name,
          account: account,
          owner: owner,
          addresses: addresses,
          email_addresses: email_addresses,
          phone_numbers: phone_numbers,
          last_activity_at: last_activity_at,
          remote_created_at: remote_created_at,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          remote_fields: remote_fields,
          additional_properties: struct
        )
      end

      # Serialize an instance of Contact to a JSON object
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
        obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
        obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
        obj.account.nil? || Merge::Crm::ContactAccount.validate_raw(obj: obj.account)
        obj.owner.nil? || Merge::Crm::ContactOwner.validate_raw(obj: obj.owner)
        obj.addresses&.is_a?(Array) != false || raise("Passed value for field obj.addresses is not the expected type, validation failed.")
        obj.email_addresses&.is_a?(Array) != false || raise("Passed value for field obj.email_addresses is not the expected type, validation failed.")
        obj.phone_numbers&.is_a?(Array) != false || raise("Passed value for field obj.phone_numbers is not the expected type, validation failed.")
        obj.last_activity_at&.is_a?(DateTime) != false || raise("Passed value for field obj.last_activity_at is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
