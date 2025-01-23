# frozen_string_literal: true

require "date"
require_relative "opportunity_owner"
require_relative "opportunity_account"
require_relative "opportunity_stage"
require_relative "opportunity_status_enum"
require_relative "remote_data"
require_relative "remote_field"
require "ostruct"
require "json"

module Merge
  module Crm
    # # The Opportunity Object
    #  ### Description
    #  The `Opportunity` object is used to represent a deal opportunity in a CRM
    #  system.
    #  ### Usage Example
    #  TODO
    class Opportunity
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String] The opportunity's name.
      attr_reader :name
      # @return [String] The opportunity's description.
      attr_reader :description
      # @return [Integer] The opportunity's amount.
      attr_reader :amount
      # @return [Merge::Crm::OpportunityOwner] The opportunity's owner.
      attr_reader :owner
      # @return [Merge::Crm::OpportunityAccount] The account of the opportunity.
      attr_reader :account
      # @return [Merge::Crm::OpportunityStage] The stage of the opportunity.
      attr_reader :stage
      # @return [Merge::Crm::OpportunityStatusEnum] The opportunity's status.
      #  - `OPEN` - OPEN
      #  - `WON` - WON
      #  - `LOST` - LOST
      attr_reader :status
      # @return [DateTime] When the opportunity's last activity occurred.
      attr_reader :last_activity_at
      # @return [DateTime] When the opportunity was closed.
      attr_reader :close_date
      # @return [DateTime] When the third party's opportunity was created.
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
      # @param name [String] The opportunity's name.
      # @param description [String] The opportunity's description.
      # @param amount [Integer] The opportunity's amount.
      # @param owner [Merge::Crm::OpportunityOwner] The opportunity's owner.
      # @param account [Merge::Crm::OpportunityAccount] The account of the opportunity.
      # @param stage [Merge::Crm::OpportunityStage] The stage of the opportunity.
      # @param status [Merge::Crm::OpportunityStatusEnum] The opportunity's status.
      #  - `OPEN` - OPEN
      #  - `WON` - WON
      #  - `LOST` - LOST
      # @param last_activity_at [DateTime] When the opportunity's last activity occurred.
      # @param close_date [DateTime] When the opportunity was closed.
      # @param remote_created_at [DateTime] When the third party's opportunity was created.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Crm::RemoteData>]
      # @param remote_fields [Array<Merge::Crm::RemoteField>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::Opportunity]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, name: OMIT, description: OMIT,
                     amount: OMIT, owner: OMIT, account: OMIT, stage: OMIT, status: OMIT, last_activity_at: OMIT, close_date: OMIT, remote_created_at: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, remote_fields: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @name = name if name != OMIT
        @description = description if description != OMIT
        @amount = amount if amount != OMIT
        @owner = owner if owner != OMIT
        @account = account if account != OMIT
        @stage = stage if stage != OMIT
        @status = status if status != OMIT
        @last_activity_at = last_activity_at if last_activity_at != OMIT
        @close_date = close_date if close_date != OMIT
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
          "name": name,
          "description": description,
          "amount": amount,
          "owner": owner,
          "account": account,
          "stage": stage,
          "status": status,
          "last_activity_at": last_activity_at,
          "close_date": close_date,
          "remote_created_at": remote_created_at,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data,
          "remote_fields": remote_fields
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Opportunity
      #
      # @param json_object [String]
      # @return [Merge::Crm::Opportunity]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        name = parsed_json["name"]
        description = parsed_json["description"]
        amount = parsed_json["amount"]
        if parsed_json["owner"].nil?
          owner = nil
        else
          owner = parsed_json["owner"].to_json
          owner = Merge::Crm::OpportunityOwner.from_json(json_object: owner)
        end
        if parsed_json["account"].nil?
          account = nil
        else
          account = parsed_json["account"].to_json
          account = Merge::Crm::OpportunityAccount.from_json(json_object: account)
        end
        if parsed_json["stage"].nil?
          stage = nil
        else
          stage = parsed_json["stage"].to_json
          stage = Merge::Crm::OpportunityStage.from_json(json_object: stage)
        end
        status = parsed_json["status"]
        last_activity_at = (DateTime.parse(parsed_json["last_activity_at"]) unless parsed_json["last_activity_at"].nil?)
        close_date = (DateTime.parse(parsed_json["close_date"]) unless parsed_json["close_date"].nil?)
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
          name: name,
          description: description,
          amount: amount,
          owner: owner,
          account: account,
          stage: stage,
          status: status,
          last_activity_at: last_activity_at,
          close_date: close_date,
          remote_created_at: remote_created_at,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          remote_fields: remote_fields,
          additional_properties: struct
        )
      end

      # Serialize an instance of Opportunity to a JSON object
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
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.amount&.is_a?(Integer) != false || raise("Passed value for field obj.amount is not the expected type, validation failed.")
        obj.owner.nil? || Merge::Crm::OpportunityOwner.validate_raw(obj: obj.owner)
        obj.account.nil? || Merge::Crm::OpportunityAccount.validate_raw(obj: obj.account)
        obj.stage.nil? || Merge::Crm::OpportunityStage.validate_raw(obj: obj.stage)
        obj.status&.is_a?(Merge::Crm::OpportunityStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.last_activity_at&.is_a?(DateTime) != false || raise("Passed value for field obj.last_activity_at is not the expected type, validation failed.")
        obj.close_date&.is_a?(DateTime) != false || raise("Passed value for field obj.close_date is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
