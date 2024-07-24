# frozen_string_literal: true

require "date"
require_relative "phone_number"
require_relative "email_address"
require_relative "url"
require_relative "candidate_applications_item"
require_relative "candidate_attachments_item"
require_relative "remote_data"
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
    class Candidate
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String] The candidate's first name.
      attr_reader :first_name
      # @return [String] The candidate's last name.
      attr_reader :last_name
      # @return [String] The candidate's current company.
      attr_reader :company
      # @return [String] The candidate's current title.
      attr_reader :title
      # @return [DateTime] When the third party's candidate was created.
      attr_reader :remote_created_at
      # @return [DateTime] When the third party's candidate was updated.
      attr_reader :remote_updated_at
      # @return [DateTime] When the most recent interaction with the candidate occurred.
      attr_reader :last_interaction_at
      # @return [Boolean] Whether or not the candidate is private.
      attr_reader :is_private
      # @return [Boolean] Whether or not the candidate can be emailed.
      attr_reader :can_email
      # @return [Array<String>] The candidate's locations.
      attr_reader :locations
      # @return [Array<Merge::Ats::PhoneNumber>]
      attr_reader :phone_numbers
      # @return [Array<Merge::Ats::EmailAddress>]
      attr_reader :email_addresses
      # @return [Array<Merge::Ats::Url>]
      attr_reader :urls
      # @return [Array<String>] Array of `Tag` names as strings.
      attr_reader :tags
      # @return [Array<Merge::Ats::CandidateApplicationsItem>] Array of `Application` object IDs.
      attr_reader :applications
      # @return [Array<Merge::Ats::CandidateAttachmentsItem>] Array of `Attachment` object IDs.
      attr_reader :attachments
      # @return [Boolean]
      attr_reader :remote_was_deleted
      # @return [Hash{String => Object}]
      attr_reader :field_mappings
      # @return [Array<Merge::Ats::RemoteData>]
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
      # @param phone_numbers [Array<Merge::Ats::PhoneNumber>]
      # @param email_addresses [Array<Merge::Ats::EmailAddress>]
      # @param urls [Array<Merge::Ats::Url>]
      # @param tags [Array<String>] Array of `Tag` names as strings.
      # @param applications [Array<Merge::Ats::CandidateApplicationsItem>] Array of `Application` object IDs.
      # @param attachments [Array<Merge::Ats::CandidateAttachmentsItem>] Array of `Attachment` object IDs.
      # @param remote_was_deleted [Boolean]
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Ats::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::Candidate]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, first_name: OMIT, last_name: OMIT,
                     company: OMIT, title: OMIT, remote_created_at: OMIT, remote_updated_at: OMIT, last_interaction_at: OMIT, is_private: OMIT, can_email: OMIT, locations: OMIT, phone_numbers: OMIT, email_addresses: OMIT, urls: OMIT, tags: OMIT, applications: OMIT, attachments: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @first_name = first_name if first_name != OMIT
        @last_name = last_name if last_name != OMIT
        @company = company if company != OMIT
        @title = title if title != OMIT
        @remote_created_at = remote_created_at if remote_created_at != OMIT
        @remote_updated_at = remote_updated_at if remote_updated_at != OMIT
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
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "first_name": first_name,
          "last_name": last_name,
          "company": company,
          "title": title,
          "remote_created_at": remote_created_at,
          "remote_updated_at": remote_updated_at,
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
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Candidate
      #
      # @param json_object [String]
      # @return [Merge::Ats::Candidate]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        first_name = parsed_json["first_name"]
        last_name = parsed_json["last_name"]
        company = parsed_json["company"]
        title = parsed_json["title"]
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        remote_updated_at = unless parsed_json["remote_updated_at"].nil?
                              DateTime.parse(parsed_json["remote_updated_at"])
                            end
        last_interaction_at = unless parsed_json["last_interaction_at"].nil?
                                DateTime.parse(parsed_json["last_interaction_at"])
                              end
        is_private = parsed_json["is_private"]
        can_email = parsed_json["can_email"]
        locations = parsed_json["locations"]
        phone_numbers = parsed_json["phone_numbers"]&.map do |item|
          item = item.to_json
          Merge::Ats::PhoneNumber.from_json(json_object: item)
        end
        email_addresses = parsed_json["email_addresses"]&.map do |item|
          item = item.to_json
          Merge::Ats::EmailAddress.from_json(json_object: item)
        end
        urls = parsed_json["urls"]&.map do |item|
          item = item.to_json
          Merge::Ats::Url.from_json(json_object: item)
        end
        tags = parsed_json["tags"]
        applications = parsed_json["applications"]&.map do |item|
          item = item.to_json
          Merge::Ats::CandidateApplicationsItem.from_json(json_object: item)
        end
        attachments = parsed_json["attachments"]&.map do |item|
          item = item.to_json
          Merge::Ats::CandidateAttachmentsItem.from_json(json_object: item)
        end
        remote_was_deleted = parsed_json["remote_was_deleted"]
        field_mappings = parsed_json["field_mappings"]
        remote_data = parsed_json["remote_data"]&.map do |item|
          item = item.to_json
          Merge::Ats::RemoteData.from_json(json_object: item)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          first_name: first_name,
          last_name: last_name,
          company: company,
          title: title,
          remote_created_at: remote_created_at,
          remote_updated_at: remote_updated_at,
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
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of Candidate to a JSON object
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
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
