# frozen_string_literal: true

require "date"
require_relative "phone_number_request"
require_relative "email_address_request"
require_relative "url_request"
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
    class PatchedCandidateRequest
      attr_reader :first_name, :last_name, :company, :title, :last_interaction_at, :is_private, :can_email, :locations,
                  :phone_numbers, :email_addresses, :urls, :tags, :applications, :attachments, :remote_template_id, :integration_params, :linked_account_params, :additional_properties

      # @param first_name [String] The candidate's first name.
      # @param last_name [String] The candidate's last name.
      # @param company [String] The candidate's current company.
      # @param title [String] The candidate's current title.
      # @param last_interaction_at [DateTime] When the most recent interaction with the candidate occurred.
      # @param is_private [Boolean] Whether or not the candidate is private.
      # @param can_email [Boolean] Whether or not the candidate can be emailed.
      # @param locations [Array<String>] The candidate's locations.
      # @param phone_numbers [Array<Ats::PhoneNumberRequest>]
      # @param email_addresses [Array<Ats::EmailAddressRequest>]
      # @param urls [Array<Ats::UrlRequest>]
      # @param tags [Array<String>] Array of `Tag` names as strings.
      # @param applications [Array<String>] Array of `Application` object IDs.
      # @param attachments [Array<String>] Array of `Attachment` object IDs.
      # @param remote_template_id [String]
      # @param integration_params [Hash{String => String}]
      # @param linked_account_params [Hash{String => String}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ats::PatchedCandidateRequest]
      def initialize(first_name: nil, last_name: nil, company: nil, title: nil, last_interaction_at: nil,
                     is_private: nil, can_email: nil, locations: nil, phone_numbers: nil, email_addresses: nil, urls: nil, tags: nil, applications: nil, attachments: nil, remote_template_id: nil, integration_params: nil, linked_account_params: nil, additional_properties: nil)
        # @type [String] The candidate's first name.
        @first_name = first_name
        # @type [String] The candidate's last name.
        @last_name = last_name
        # @type [String] The candidate's current company.
        @company = company
        # @type [String] The candidate's current title.
        @title = title
        # @type [DateTime] When the most recent interaction with the candidate occurred.
        @last_interaction_at = last_interaction_at
        # @type [Boolean] Whether or not the candidate is private.
        @is_private = is_private
        # @type [Boolean] Whether or not the candidate can be emailed.
        @can_email = can_email
        # @type [Array<String>] The candidate's locations.
        @locations = locations
        # @type [Array<Ats::PhoneNumberRequest>]
        @phone_numbers = phone_numbers
        # @type [Array<Ats::EmailAddressRequest>]
        @email_addresses = email_addresses
        # @type [Array<Ats::UrlRequest>]
        @urls = urls
        # @type [Array<String>] Array of `Tag` names as strings.
        @tags = tags
        # @type [Array<String>] Array of `Application` object IDs.
        @applications = applications
        # @type [Array<String>] Array of `Attachment` object IDs.
        @attachments = attachments
        # @type [String]
        @remote_template_id = remote_template_id
        # @type [Hash{String => String}]
        @integration_params = integration_params
        # @type [Hash{String => String}]
        @linked_account_params = linked_account_params
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of PatchedCandidateRequest
      #
      # @param json_object [JSON]
      # @return [Ats::PatchedCandidateRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        first_name = struct.first_name
        last_name = struct.last_name
        company = struct.company
        title = struct.title
        last_interaction_at = unless parsed_json["last_interaction_at"].nil?
                                DateTime.parse(parsed_json["last_interaction_at"])
                              end
        is_private = struct.is_private
        can_email = struct.can_email
        locations = struct.locations
        phone_numbers = parsed_json["phone_numbers"]&.map do |v|
          v = v.to_json
          Ats::PhoneNumberRequest.from_json(json_object: v)
        end
        email_addresses = parsed_json["email_addresses"]&.map do |v|
          v = v.to_json
          Ats::EmailAddressRequest.from_json(json_object: v)
        end
        urls = parsed_json["urls"]&.map do |v|
          v = v.to_json
          Ats::UrlRequest.from_json(json_object: v)
        end
        tags = struct.tags
        applications = struct.applications
        attachments = struct.attachments
        remote_template_id = struct.remote_template_id
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        new(first_name: first_name, last_name: last_name, company: company, title: title,
            last_interaction_at: last_interaction_at, is_private: is_private, can_email: can_email, locations: locations, phone_numbers: phone_numbers, email_addresses: email_addresses, urls: urls, tags: tags, applications: applications, attachments: attachments, remote_template_id: remote_template_id, integration_params: integration_params, linked_account_params: linked_account_params, additional_properties: struct)
      end

      # Serialize an instance of PatchedCandidateRequest to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "first_name": @first_name,
          "last_name": @last_name,
          "company": @company,
          "title": @title,
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
          "remote_template_id": @remote_template_id,
          "integration_params": @integration_params,
          "linked_account_params": @linked_account_params
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
        obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
        obj.company&.is_a?(String) != false || raise("Passed value for field obj.company is not the expected type, validation failed.")
        obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
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
        obj.remote_template_id&.is_a?(String) != false || raise("Passed value for field obj.remote_template_id is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
