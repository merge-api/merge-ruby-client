# frozen_string_literal: true

require_relative "offer_application"
require_relative "offer_creator"
require "date"
require_relative "offer_status"
require_relative "remote_data"
require "json"

module Merge
  module Ats
    # # The Offer Object
    #
    # ### Description
    #
    # The `Offer` object is used to represent an offer for a candidate's application specific to a job.
    #
    # ### Usage Example
    #
    # Fetch from the `LIST Offers` endpoint and filter by `ID` to show all offers.
    class Offer
      attr_reader :id, :remote_id, :application, :creator, :remote_created_at, :closed_at, :sent_at, :start_date,
                  :status, :remote_was_deleted, :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param application [Ats::OfferApplication] The application who is receiving the offer.
      # @param creator [Ats::OfferCreator] The user who created the offer.
      # @param remote_created_at [DateTime] When the third party's offer was created.
      # @param closed_at [DateTime] When the offer was closed.
      # @param sent_at [DateTime] When the offer was sent.
      # @param start_date [DateTime] The employment start date on the offer.
      # @param status [Ats::OfferStatus] The offer's status.
      #   - `DRAFT` - DRAFT
      #   - `APPROVAL-SENT` - APPROVAL-SENT
      #   - `APPROVED` - APPROVED
      #   - `SENT` - SENT
      #   - `SENT-MANUALLY` - SENT-MANUALLY
      #   - `OPENED` - OPENED
      #   - `DENIED` - DENIED
      #   - `SIGNED` - SIGNED
      #   - `DEPRECATED` - DEPRECATED
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Ats::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ats::Offer]
      def initialize(id: nil, remote_id: nil, application: nil, creator: nil, remote_created_at: nil, closed_at: nil,
                     sent_at: nil, start_date: nil, status: nil, remote_was_deleted: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [Ats::OfferApplication] The application who is receiving the offer.
        @application = application
        # @type [Ats::OfferCreator] The user who created the offer.
        @creator = creator
        # @type [DateTime] When the third party's offer was created.
        @remote_created_at = remote_created_at
        # @type [DateTime] When the offer was closed.
        @closed_at = closed_at
        # @type [DateTime] When the offer was sent.
        @sent_at = sent_at
        # @type [DateTime] The employment start date on the offer.
        @start_date = start_date
        # @type [Ats::OfferStatus] The offer's status.
        #   - `DRAFT` - DRAFT
        #   - `APPROVAL-SENT` - APPROVAL-SENT
        #   - `APPROVED` - APPROVED
        #   - `SENT` - SENT
        #   - `SENT-MANUALLY` - SENT-MANUALLY
        #   - `OPENED` - OPENED
        #   - `DENIED` - DENIED
        #   - `SIGNED` - SIGNED
        #   - `DEPRECATED` - DEPRECATED
        @status = status
        # @type [Boolean] Indicates whether or not this object has been deleted in the third party platform.
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

      # Deserialize a JSON object to an instance of Offer
      #
      # @param json_object [JSON]
      # @return [Ats::Offer]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        remote_id = struct.remote_id
        if parsed_json["application"].nil?
          application = nil
        else
          application = parsed_json["application"].to_json
          application = Ats::OfferApplication.from_json(json_object: application)
        end
        if parsed_json["creator"].nil?
          creator = nil
        else
          creator = parsed_json["creator"].to_json
          creator = Ats::OfferCreator.from_json(json_object: creator)
        end
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        closed_at = (DateTime.parse(parsed_json["closed_at"]) unless parsed_json["closed_at"].nil?)
        sent_at = (DateTime.parse(parsed_json["sent_at"]) unless parsed_json["sent_at"].nil?)
        start_date = (DateTime.parse(parsed_json["start_date"]) unless parsed_json["start_date"].nil?)
        if parsed_json["status"].nil?
          status = nil
        else
          status = parsed_json["status"].to_json
          status = Ats::OfferStatus.from_json(json_object: status)
        end
        remote_was_deleted = struct.remote_was_deleted
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        field_mappings = struct.field_mappings
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Ats::RemoteData.from_json(json_object: v)
        end
        new(id: id, remote_id: remote_id, application: application, creator: creator,
            remote_created_at: remote_created_at, closed_at: closed_at, sent_at: sent_at, start_date: start_date, status: status, remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end

      # Serialize an instance of Offer to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "remote_id": @remote_id,
          "application": @application,
          "creator": @creator,
          "remote_created_at": @remote_created_at,
          "closed_at": @closed_at,
          "sent_at": @sent_at,
          "start_date": @start_date,
          "status": @status,
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
        obj.application.nil? || Ats::OfferApplication.validate_raw(obj: obj.application)
        obj.creator.nil? || Ats::OfferCreator.validate_raw(obj: obj.creator)
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.closed_at&.is_a?(DateTime) != false || raise("Passed value for field obj.closed_at is not the expected type, validation failed.")
        obj.sent_at&.is_a?(DateTime) != false || raise("Passed value for field obj.sent_at is not the expected type, validation failed.")
        obj.start_date&.is_a?(DateTime) != false || raise("Passed value for field obj.start_date is not the expected type, validation failed.")
        obj.status.nil? || Ats::OfferStatus.validate_raw(obj: obj.status)
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
