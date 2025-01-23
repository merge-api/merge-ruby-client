# frozen_string_literal: true

require "date"
require_relative "offer_application"
require_relative "offer_creator"
require_relative "offer_status_enum"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Ats
    # # The Offer Object
    #  ### Description
    #  The `Offer` object is used to represent an offer for a candidate's application
    #  specific to a job.
    #  ### Usage Example
    #  Fetch from the `LIST Offers` endpoint and filter by `ID` to show all offers.
    class Offer
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [Merge::Ats::OfferApplication] The application who is receiving the offer.
      attr_reader :application
      # @return [Merge::Ats::OfferCreator] The user who created the offer.
      attr_reader :creator
      # @return [DateTime] When the third party's offer was created.
      attr_reader :remote_created_at
      # @return [DateTime] When the offer was closed.
      attr_reader :closed_at
      # @return [DateTime] When the offer was sent.
      attr_reader :sent_at
      # @return [DateTime] The employment start date on the offer.
      attr_reader :start_date
      # @return [Merge::Ats::OfferStatusEnum] The offer's status.
      #  - `DRAFT` - DRAFT
      #  - `APPROVAL-SENT` - APPROVAL-SENT
      #  - `APPROVED` - APPROVED
      #  - `SENT` - SENT
      #  - `SENT-MANUALLY` - SENT-MANUALLY
      #  - `OPENED` - OPENED
      #  - `DENIED` - DENIED
      #  - `SIGNED` - SIGNED
      #  - `DEPRECATED` - DEPRECATED
      attr_reader :status
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
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
      # @param application [Merge::Ats::OfferApplication] The application who is receiving the offer.
      # @param creator [Merge::Ats::OfferCreator] The user who created the offer.
      # @param remote_created_at [DateTime] When the third party's offer was created.
      # @param closed_at [DateTime] When the offer was closed.
      # @param sent_at [DateTime] When the offer was sent.
      # @param start_date [DateTime] The employment start date on the offer.
      # @param status [Merge::Ats::OfferStatusEnum] The offer's status.
      #  - `DRAFT` - DRAFT
      #  - `APPROVAL-SENT` - APPROVAL-SENT
      #  - `APPROVED` - APPROVED
      #  - `SENT` - SENT
      #  - `SENT-MANUALLY` - SENT-MANUALLY
      #  - `OPENED` - OPENED
      #  - `DENIED` - DENIED
      #  - `SIGNED` - SIGNED
      #  - `DEPRECATED` - DEPRECATED
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Ats::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::Offer]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, application: OMIT, creator: OMIT,
                     remote_created_at: OMIT, closed_at: OMIT, sent_at: OMIT, start_date: OMIT, status: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @application = application if application != OMIT
        @creator = creator if creator != OMIT
        @remote_created_at = remote_created_at if remote_created_at != OMIT
        @closed_at = closed_at if closed_at != OMIT
        @sent_at = sent_at if sent_at != OMIT
        @start_date = start_date if start_date != OMIT
        @status = status if status != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "application": application,
          "creator": creator,
          "remote_created_at": remote_created_at,
          "closed_at": closed_at,
          "sent_at": sent_at,
          "start_date": start_date,
          "status": status,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Offer
      #
      # @param json_object [String]
      # @return [Merge::Ats::Offer]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        if parsed_json["application"].nil?
          application = nil
        else
          application = parsed_json["application"].to_json
          application = Merge::Ats::OfferApplication.from_json(json_object: application)
        end
        if parsed_json["creator"].nil?
          creator = nil
        else
          creator = parsed_json["creator"].to_json
          creator = Merge::Ats::OfferCreator.from_json(json_object: creator)
        end
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        closed_at = (DateTime.parse(parsed_json["closed_at"]) unless parsed_json["closed_at"].nil?)
        sent_at = (DateTime.parse(parsed_json["sent_at"]) unless parsed_json["sent_at"].nil?)
        start_date = (DateTime.parse(parsed_json["start_date"]) unless parsed_json["start_date"].nil?)
        status = parsed_json["status"]
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
          application: application,
          creator: creator,
          remote_created_at: remote_created_at,
          closed_at: closed_at,
          sent_at: sent_at,
          start_date: start_date,
          status: status,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of Offer to a JSON object
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
        obj.application.nil? || Merge::Ats::OfferApplication.validate_raw(obj: obj.application)
        obj.creator.nil? || Merge::Ats::OfferCreator.validate_raw(obj: obj.creator)
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.closed_at&.is_a?(DateTime) != false || raise("Passed value for field obj.closed_at is not the expected type, validation failed.")
        obj.sent_at&.is_a?(DateTime) != false || raise("Passed value for field obj.sent_at is not the expected type, validation failed.")
        obj.start_date&.is_a?(DateTime) != false || raise("Passed value for field obj.start_date is not the expected type, validation failed.")
        obj.status&.is_a?(Merge::Ats::OfferStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
