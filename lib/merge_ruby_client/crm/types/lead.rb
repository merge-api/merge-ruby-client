# frozen_string_literal: true

require "date"
require_relative "lead_owner"
require_relative "address"
require_relative "email_address"
require_relative "phone_number"
require_relative "lead_converted_contact"
require_relative "lead_converted_account"
require_relative "remote_data"
require_relative "remote_field"
require "ostruct"
require "json"

module Merge
  module Crm
    # # The Lead Object
    #  ### Description
    #  The `Lead` object is used to represent an individual who is a potential
    #  customer.
    #  ### Usage Example
    #  TODO
    class Lead
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [Merge::Crm::LeadOwner] The lead's owner.
      attr_reader :owner
      # @return [String] The lead's source.
      attr_reader :lead_source
      # @return [String] The lead's title.
      attr_reader :title
      # @return [String] The lead's company.
      attr_reader :company
      # @return [String] The lead's first name.
      attr_reader :first_name
      # @return [String] The lead's last name.
      attr_reader :last_name
      # @return [Array<Merge::Crm::Address>]
      attr_reader :addresses
      # @return [Array<Merge::Crm::EmailAddress>]
      attr_reader :email_addresses
      # @return [Array<Merge::Crm::PhoneNumber>]
      attr_reader :phone_numbers
      # @return [DateTime] When the third party's lead was updated.
      attr_reader :remote_updated_at
      # @return [DateTime] When the third party's lead was created.
      attr_reader :remote_created_at
      # @return [DateTime] When the lead was converted.
      attr_reader :converted_date
      # @return [Merge::Crm::LeadConvertedContact] The contact of the converted lead.
      attr_reader :converted_contact
      # @return [Merge::Crm::LeadConvertedAccount] The account of the converted lead.
      attr_reader :converted_account
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
      # @param owner [Merge::Crm::LeadOwner] The lead's owner.
      # @param lead_source [String] The lead's source.
      # @param title [String] The lead's title.
      # @param company [String] The lead's company.
      # @param first_name [String] The lead's first name.
      # @param last_name [String] The lead's last name.
      # @param addresses [Array<Merge::Crm::Address>]
      # @param email_addresses [Array<Merge::Crm::EmailAddress>]
      # @param phone_numbers [Array<Merge::Crm::PhoneNumber>]
      # @param remote_updated_at [DateTime] When the third party's lead was updated.
      # @param remote_created_at [DateTime] When the third party's lead was created.
      # @param converted_date [DateTime] When the lead was converted.
      # @param converted_contact [Merge::Crm::LeadConvertedContact] The contact of the converted lead.
      # @param converted_account [Merge::Crm::LeadConvertedAccount] The account of the converted lead.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Crm::RemoteData>]
      # @param remote_fields [Array<Merge::Crm::RemoteField>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::Lead]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, owner: OMIT, lead_source: OMIT,
                     title: OMIT, company: OMIT, first_name: OMIT, last_name: OMIT, addresses: OMIT, email_addresses: OMIT, phone_numbers: OMIT, remote_updated_at: OMIT, remote_created_at: OMIT, converted_date: OMIT, converted_contact: OMIT, converted_account: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, remote_fields: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @owner = owner if owner != OMIT
        @lead_source = lead_source if lead_source != OMIT
        @title = title if title != OMIT
        @company = company if company != OMIT
        @first_name = first_name if first_name != OMIT
        @last_name = last_name if last_name != OMIT
        @addresses = addresses if addresses != OMIT
        @email_addresses = email_addresses if email_addresses != OMIT
        @phone_numbers = phone_numbers if phone_numbers != OMIT
        @remote_updated_at = remote_updated_at if remote_updated_at != OMIT
        @remote_created_at = remote_created_at if remote_created_at != OMIT
        @converted_date = converted_date if converted_date != OMIT
        @converted_contact = converted_contact if converted_contact != OMIT
        @converted_account = converted_account if converted_account != OMIT
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
          "lead_source": lead_source,
          "title": title,
          "company": company,
          "first_name": first_name,
          "last_name": last_name,
          "addresses": addresses,
          "email_addresses": email_addresses,
          "phone_numbers": phone_numbers,
          "remote_updated_at": remote_updated_at,
          "remote_created_at": remote_created_at,
          "converted_date": converted_date,
          "converted_contact": converted_contact,
          "converted_account": converted_account,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data,
          "remote_fields": remote_fields
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Lead
      #
      # @param json_object [String]
      # @return [Merge::Crm::Lead]
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
          owner = Merge::Crm::LeadOwner.from_json(json_object: owner)
        end
        lead_source = parsed_json["lead_source"]
        title = parsed_json["title"]
        company = parsed_json["company"]
        first_name = parsed_json["first_name"]
        last_name = parsed_json["last_name"]
        addresses = parsed_json["addresses"]&.map do |item|
          item = item.to_json
          Merge::Crm::Address.from_json(json_object: item)
        end
        email_addresses = parsed_json["email_addresses"]&.map do |item|
          item = item.to_json
          Merge::Crm::EmailAddress.from_json(json_object: item)
        end
        phone_numbers = parsed_json["phone_numbers"]&.map do |item|
          item = item.to_json
          Merge::Crm::PhoneNumber.from_json(json_object: item)
        end
        remote_updated_at = unless parsed_json["remote_updated_at"].nil?
                              DateTime.parse(parsed_json["remote_updated_at"])
                            end
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        converted_date = (DateTime.parse(parsed_json["converted_date"]) unless parsed_json["converted_date"].nil?)
        if parsed_json["converted_contact"].nil?
          converted_contact = nil
        else
          converted_contact = parsed_json["converted_contact"].to_json
          converted_contact = Merge::Crm::LeadConvertedContact.from_json(json_object: converted_contact)
        end
        if parsed_json["converted_account"].nil?
          converted_account = nil
        else
          converted_account = parsed_json["converted_account"].to_json
          converted_account = Merge::Crm::LeadConvertedAccount.from_json(json_object: converted_account)
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
          lead_source: lead_source,
          title: title,
          company: company,
          first_name: first_name,
          last_name: last_name,
          addresses: addresses,
          email_addresses: email_addresses,
          phone_numbers: phone_numbers,
          remote_updated_at: remote_updated_at,
          remote_created_at: remote_created_at,
          converted_date: converted_date,
          converted_contact: converted_contact,
          converted_account: converted_account,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          remote_fields: remote_fields,
          additional_properties: struct
        )
      end

      # Serialize an instance of Lead to a JSON object
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
        obj.owner.nil? || Merge::Crm::LeadOwner.validate_raw(obj: obj.owner)
        obj.lead_source&.is_a?(String) != false || raise("Passed value for field obj.lead_source is not the expected type, validation failed.")
        obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
        obj.company&.is_a?(String) != false || raise("Passed value for field obj.company is not the expected type, validation failed.")
        obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
        obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
        obj.addresses&.is_a?(Array) != false || raise("Passed value for field obj.addresses is not the expected type, validation failed.")
        obj.email_addresses&.is_a?(Array) != false || raise("Passed value for field obj.email_addresses is not the expected type, validation failed.")
        obj.phone_numbers&.is_a?(Array) != false || raise("Passed value for field obj.phone_numbers is not the expected type, validation failed.")
        obj.remote_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_updated_at is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.converted_date&.is_a?(DateTime) != false || raise("Passed value for field obj.converted_date is not the expected type, validation failed.")
        obj.converted_contact.nil? || Merge::Crm::LeadConvertedContact.validate_raw(obj: obj.converted_contact)
        obj.converted_account.nil? || Merge::Crm::LeadConvertedAccount.validate_raw(obj: obj.converted_account)
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
