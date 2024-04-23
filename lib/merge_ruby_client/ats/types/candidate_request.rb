# frozen_string_literal: true

require "date"
require_relative "phone_number_request"
require_relative "email_address_request"
require_relative "url_request"
require_relative "candidate_request_applications_item"
require_relative "candidate_request_attachments_item"
require "ostruct"
require "json"

module Merge
  module Ats
    # # The Candidate Object
    #  ### Description
    #  The `Candidate` object is used to represent profile information about a given
    #  Candidate. Because it is specific to a Candidate, this information stays
    #  constant across applications.
    #  ### Usage Example
    #  Fetch from the `LIST Candidates` endpoint and filter by `ID` to show all
    #  candidates.
    class CandidateRequest
      # @return [String] The candidate's first name.
      attr_reader :first_name
      # @return [String] The candidate's last name.
      attr_reader :last_name
      # @return [String] The candidate's current company.
      attr_reader :company
      # @return [String] The candidate's current title.
      attr_reader :title
      # @return [DateTime] When the most recent interaction with the candidate occurred.
      attr_reader :last_interaction_at
      # @return [Boolean] Whether or not the candidate is private.
      attr_reader :is_private
      # @return [Boolean] Whether or not the candidate can be emailed.
      attr_reader :can_email
      # @return [Array<String>] The candidate's locations.
      attr_reader :locations
      # @return [Array<Merge::Ats::PhoneNumberRequest>]
      attr_reader :phone_numbers
      # @return [Array<Merge::Ats::EmailAddressRequest>]
      attr_reader :email_addresses
      # @return [Array<Merge::Ats::UrlRequest>]
      attr_reader :urls
      # @return [Array<String>] Array of `Tag` names as strings.
      attr_reader :tags
      # @return [Array<Merge::Ats::CandidateRequestApplicationsItem>] Array of `Application` object IDs.
      attr_reader :applications
      # @return [Array<Merge::Ats::CandidateRequestAttachmentsItem>] Array of `Attachment` object IDs.
      attr_reader :attachments
      # @return [String]
      attr_reader :remote_template_id
      # @return [Hash{String => Object}]
      attr_reader :integration_params
      # @return [Hash{String => Object}]
      attr_reader :linked_account_params
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param first_name [String] The candidate's first name.
      # @param last_name [String] The candidate's last name.
      # @param company [String] The candidate's current company.
      # @param title [String] The candidate's current title.
      # @param last_interaction_at [DateTime] When the most recent interaction with the candidate occurred.
      # @param is_private [Boolean] Whether or not the candidate is private.
      # @param can_email [Boolean] Whether or not the candidate can be emailed.
      # @param locations [Array<String>] The candidate's locations.
      # @param phone_numbers [Array<Merge::Ats::PhoneNumberRequest>]
      # @param email_addresses [Array<Merge::Ats::EmailAddressRequest>]
      # @param urls [Array<Merge::Ats::UrlRequest>]
      # @param tags [Array<String>] Array of `Tag` names as strings.
      # @param applications [Array<Merge::Ats::CandidateRequestApplicationsItem>] Array of `Application` object IDs.
      # @param attachments [Array<Merge::Ats::CandidateRequestAttachmentsItem>] Array of `Attachment` object IDs.
      # @param remote_template_id [String]
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::CandidateRequest]
      def initialize(first_name: OMIT, last_name: OMIT, company: OMIT, title: OMIT, last_interaction_at: OMIT,
                     is_private: OMIT, can_email: OMIT, locations: OMIT, phone_numbers: OMIT, email_addresses: OMIT, urls: OMIT, tags: OMIT, applications: OMIT, attachments: OMIT, remote_template_id: OMIT, integration_params: OMIT, linked_account_params: OMIT, additional_properties: nil)
        @first_name = first_name if first_name != OMIT
        @last_name = last_name if last_name != OMIT
        @company = company if company != OMIT
        @title = title if title != OMIT
        @last_interaction_at = last_interaction_at if last_interaction_at != OMIT
        @is_private = is_private if is_private != OMIT
        @can_email = can_email if can_email != OMIT
        @locations = locations if locations != OMIT
        @phone_numbers = phone_numbers if phone_numbers != OMIT
        @email_addresses = email_addresses if email_addresses != OMIT
        @urls = urls if urls != OMIT
        @tags = tags if tags != OMIT
        @applications = applications if applications != OMIT
        @attachments = attachments if attachments != OMIT
        @remote_template_id = remote_template_id if remote_template_id != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "first_name": first_name,
          "last_name": last_name,
          "company": company,
          "title": title,
          "last_interaction_at": last_interaction_at,
          "is_private": is_private,
          "can_email": can_email,
          "locations": locations,
          "phone_numbers": phone_numbers,
          "email_addresses": email_addresses,
          "urls": urls,
          "tags": tags,
          "applications": applications,
          "attachments": attachments,
          "remote_template_id": remote_template_id,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of CandidateRequest
      #
      # @param json_object [String]
      # @return [Merge::Ats::CandidateRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        first_name = struct["first_name"]
        last_name = struct["last_name"]
        company = struct["company"]
        title = struct["title"]
        last_interaction_at = unless parsed_json["last_interaction_at"].nil?
                                DateTime.parse(parsed_json["last_interaction_at"])
                              end
        is_private = struct["is_private"]
        can_email = struct["can_email"]
        locations = struct["locations"]
        phone_numbers = parsed_json["phone_numbers"]&.map do |v|
          v = v.to_json
          Merge::Ats::PhoneNumberRequest.from_json(json_object: v)
        end
        email_addresses = parsed_json["email_addresses"]&.map do |v|
          v = v.to_json
          Merge::Ats::EmailAddressRequest.from_json(json_object: v)
        end
        urls = parsed_json["urls"]&.map do |v|
          v = v.to_json
          Merge::Ats::UrlRequest.from_json(json_object: v)
        end
        tags = struct["tags"]
        applications = parsed_json["applications"]&.map do |v|
          v = v.to_json
          Merge::Ats::CandidateRequestApplicationsItem.from_json(json_object: v)
        end
        attachments = parsed_json["attachments"]&.map do |v|
          v = v.to_json
          Merge::Ats::CandidateRequestAttachmentsItem.from_json(json_object: v)
        end
        remote_template_id = struct["remote_template_id"]
        integration_params = struct["integration_params"]
        linked_account_params = struct["linked_account_params"]
        new(
          first_name: first_name,
          last_name: last_name,
          company: company,
          title: title,
          last_interaction_at: last_interaction_at,
          is_private: is_private,
          can_email: can_email,
          locations: locations,
          phone_numbers: phone_numbers,
          email_addresses: email_addresses,
          urls: urls,
          tags: tags,
          applications: applications,
          attachments: attachments,
          remote_template_id: remote_template_id,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          additional_properties: struct
        )
      end

      # Serialize an instance of CandidateRequest to a JSON object
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
