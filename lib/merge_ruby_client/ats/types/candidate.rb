# frozen_string_literal: true

require "date"
require_relative "phone_number"
require_relative "email_address"
require_relative "url"
require_relative "candidate_applications_item"
require_relative "candidate_attachments_item"
require_relative "remote_data"
require "json"

module Merge
  module Ats
    # # The Candidate Object
    #
    # ### Description
    #
    # The `Candidate` object is used to represent profile information about a given Candidate. Because it is specific to a Candidate, this information stays constant across applications.
    #
    # ### Usage Example
    #
    # Fetch from the `LIST Candidates` endpoint and filter by `ID` to show all candidates.
    class Candidate
      attr_reader :id, :remote_id, :first_name, :last_name, :company, :title, :remote_created_at, :remote_updated_at,
                  :last_interaction_at, :is_private, :can_email, :locations, :phone_numbers, :email_addresses, :urls, :tags, :applications, :attachments, :remote_was_deleted, :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param first_name [String] The candidate's first name.
      # @param last_name [String] The candidate's last name.
      # @param company [String] The candidate's current company.
      # @param title [String] The candidate's current title.
      # @param remote_created_at [DateTime] When the third party's candidate was created.
      # @param remote_updated_at [DateTime] When the third party's candidate was updated.
      # @param last_interaction_at [DateTime] When the most recent interaction with the candidate occurred.
      # @param is_private [Boolean] Whether or not the candidate is private.
      # @param can_email [Boolean] Whether or not the candidate can be emailed.
      # @param locations [Array<String>] The candidate's locations.
      # @param phone_numbers [Array<Ats::PhoneNumber>]
      # @param email_addresses [Array<Ats::EmailAddress>]
      # @param urls [Array<Ats::Url>]
      # @param tags [Array<String>] Array of `Tag` names as strings.
      # @param applications [Array<Ats::CandidateApplicationsItem>] Array of `Application` object IDs.
      # @param attachments [Array<Ats::CandidateAttachmentsItem>] Array of `Attachment` object IDs.
      # @param remote_was_deleted [Boolean]
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Ats::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ats::Candidate]
      def initialize(id: nil, remote_id: nil, first_name: nil, last_name: nil, company: nil, title: nil,
                     remote_created_at: nil, remote_updated_at: nil, last_interaction_at: nil, is_private: nil, can_email: nil, locations: nil, phone_numbers: nil, email_addresses: nil, urls: nil, tags: nil, applications: nil, attachments: nil, remote_was_deleted: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [String] The candidate's first name.
        @first_name = first_name
        # @type [String] The candidate's last name.
        @last_name = last_name
        # @type [String] The candidate's current company.
        @company = company
        # @type [String] The candidate's current title.
        @title = title
        # @type [DateTime] When the third party's candidate was created.
        @remote_created_at = remote_created_at
        # @type [DateTime] When the third party's candidate was updated.
        @remote_updated_at = remote_updated_at
        # @type [DateTime] When the most recent interaction with the candidate occurred.
        @last_interaction_at = last_interaction_at
        # @type [Boolean] Whether or not the candidate is private.
        @is_private = is_private
        # @type [Boolean] Whether or not the candidate can be emailed.
        @can_email = can_email
        # @type [Array<String>] The candidate's locations.
        @locations = locations
        # @type [Array<Ats::PhoneNumber>]
        @phone_numbers = phone_numbers
        # @type [Array<Ats::EmailAddress>]
        @email_addresses = email_addresses
        # @type [Array<Ats::Url>]
        @urls = urls
        # @type [Array<String>] Array of `Tag` names as strings.
        @tags = tags
        # @type [Array<Ats::CandidateApplicationsItem>] Array of `Application` object IDs.
        @applications = applications
        # @type [Array<Ats::CandidateAttachmentsItem>] Array of `Attachment` object IDs.
        @attachments = attachments
        # @type [Boolean]
        @remote_was_deleted = remote_was_deleted
        # @type [DateTime]
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [Hash{String => String}]
        @field_mappings = field_mappings
        # @type [Array<Ats::RemoteData>]
        @remote_data = remote_data
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Candidate
      #
      # @param json_object [JSON]
      # @return [Ats::Candidate]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        remote_id = struct.remote_id
        first_name = struct.first_name
        last_name = struct.last_name
        company = struct.company
        title = struct.title
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        remote_updated_at = unless parsed_json["remote_updated_at"].nil?
                              DateTime.parse(parsed_json["remote_updated_at"])
                            end
        last_interaction_at = unless parsed_json["last_interaction_at"].nil?
                                DateTime.parse(parsed_json["last_interaction_at"])
                              end
        is_private = struct.is_private
        can_email = struct.can_email
        locations = struct.locations
        phone_numbers = parsed_json["phone_numbers"]&.map do |v|
          v = v.to_json
          Ats::PhoneNumber.from_json(json_object: v)
        end
        email_addresses = parsed_json["email_addresses"]&.map do |v|
          v = v.to_json
          Ats::EmailAddress.from_json(json_object: v)
        end
        urls = parsed_json["urls"]&.map do |v|
          v = v.to_json
          Ats::Url.from_json(json_object: v)
        end
        tags = struct.tags
        applications = parsed_json["applications"]&.map do |v|
          v = v.to_json
          Ats::CandidateApplicationsItem.from_json(json_object: v)
        end
        attachments = parsed_json["attachments"]&.map do |v|
          v = v.to_json
          Ats::CandidateAttachmentsItem.from_json(json_object: v)
        end
        remote_was_deleted = struct.remote_was_deleted
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        field_mappings = struct.field_mappings
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Ats::RemoteData.from_json(json_object: v)
        end
        new(id: id, remote_id: remote_id, first_name: first_name, last_name: last_name, company: company, title: title,
            remote_created_at: remote_created_at, remote_updated_at: remote_updated_at, last_interaction_at: last_interaction_at, is_private: is_private, can_email: can_email, locations: locations, phone_numbers: phone_numbers, email_addresses: email_addresses, urls: urls, tags: tags, applications: applications, attachments: attachments, remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end

      # Serialize an instance of Candidate to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "remote_id": @remote_id,
          "first_name": @first_name,
          "last_name": @last_name,
          "company": @company,
          "title": @title,
          "remote_created_at": @remote_created_at,
          "remote_updated_at": @remote_updated_at,
          "last_interaction_at": @last_interaction_at,
          "is_private": @is_private,
          "can_email": @can_email,
          "locations": @locations,
          "phone_numbers": @phone_numbers,
          "email_addresses": @email_addresses,
          "urls": @urls,
          "tags": @tags,
          "applications": @applications,
          "attachments": @attachments,
          "remote_was_deleted": @remote_was_deleted,
          "created_at": @created_at,
          "modified_at": @modified_at,
          "field_mappings": @field_mappings,
          "remote_data": @remote_data
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
        obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
        obj.company&.is_a?(String) != false || raise("Passed value for field obj.company is not the expected type, validation failed.")
        obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.remote_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_updated_at is not the expected type, validation failed.")
        obj.last_interaction_at&.is_a?(DateTime) != false || raise("Passed value for field obj.last_interaction_at is not the expected type, validation failed.")
        obj.is_private&.is_a?(Boolean) != false || raise("Passed value for field obj.is_private is not the expected type, validation failed.")
        obj.can_email&.is_a?(Boolean) != false || raise("Passed value for field obj.can_email is not the expected type, validation failed.")
        obj.locations&.is_a?(Array) != false || raise("Passed value for field obj.locations is not the expected type, validation failed.")
        obj.phone_numbers&.is_a?(Array) != false || raise("Passed value for field obj.phone_numbers is not the expected type, validation failed.")
        obj.email_addresses&.is_a?(Array) != false || raise("Passed value for field obj.email_addresses is not the expected type, validation failed.")
        obj.urls&.is_a?(Array) != false || raise("Passed value for field obj.urls is not the expected type, validation failed.")
        obj.tags&.is_a?(Array) != false || raise("Passed value for field obj.tags is not the expected type, validation failed.")
        obj.applications&.is_a?(Array) != false || raise("Passed value for field obj.applications is not the expected type, validation failed.")
        obj.attachments&.is_a?(Array) != false || raise("Passed value for field obj.attachments is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
