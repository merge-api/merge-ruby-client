# frozen_string_literal: true

require_relative "opportunity_request_owner"
require_relative "opportunity_request_account"
require_relative "opportunity_request_stage"
require_relative "opportunity_status_enum"
require "date"
require_relative "remote_field_request"
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
    class OpportunityRequest
      # @return [String] The opportunity's name.
      attr_reader :name
      # @return [String] The opportunity's description.
      attr_reader :description
      # @return [Integer] The opportunity's amount.
      attr_reader :amount
      # @return [Merge::Crm::OpportunityRequestOwner] The opportunity's owner.
      attr_reader :owner
      # @return [Merge::Crm::OpportunityRequestAccount] The account of the opportunity.
      attr_reader :account
      # @return [Merge::Crm::OpportunityRequestStage] The stage of the opportunity.
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
      # @return [Hash{String => Object}]
      attr_reader :integration_params
      # @return [Hash{String => Object}]
      attr_reader :linked_account_params
      # @return [Array<Merge::Crm::RemoteFieldRequest>]
      attr_reader :remote_fields
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param name [String] The opportunity's name.
      # @param description [String] The opportunity's description.
      # @param amount [Integer] The opportunity's amount.
      # @param owner [Merge::Crm::OpportunityRequestOwner] The opportunity's owner.
      # @param account [Merge::Crm::OpportunityRequestAccount] The account of the opportunity.
      # @param stage [Merge::Crm::OpportunityRequestStage] The stage of the opportunity.
      # @param status [Merge::Crm::OpportunityStatusEnum] The opportunity's status.
      #  - `OPEN` - OPEN
      #  - `WON` - WON
      #  - `LOST` - LOST
      # @param last_activity_at [DateTime] When the opportunity's last activity occurred.
      # @param close_date [DateTime] When the opportunity was closed.
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param remote_fields [Array<Merge::Crm::RemoteFieldRequest>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::OpportunityRequest]
      def initialize(name: OMIT, description: OMIT, amount: OMIT, owner: OMIT, account: OMIT, stage: OMIT,
                     status: OMIT, last_activity_at: OMIT, close_date: OMIT, integration_params: OMIT, linked_account_params: OMIT, remote_fields: OMIT, additional_properties: nil)
        @name = name if name != OMIT
        @description = description if description != OMIT
        @amount = amount if amount != OMIT
        @owner = owner if owner != OMIT
        @account = account if account != OMIT
        @stage = stage if stage != OMIT
        @status = status if status != OMIT
        @last_activity_at = last_activity_at if last_activity_at != OMIT
        @close_date = close_date if close_date != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @remote_fields = remote_fields if remote_fields != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "name": name,
          "description": description,
          "amount": amount,
          "owner": owner,
          "account": account,
          "stage": stage,
          "status": status,
          "last_activity_at": last_activity_at,
          "close_date": close_date,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params,
          "remote_fields": remote_fields
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of OpportunityRequest
      #
      # @param json_object [String]
      # @return [Merge::Crm::OpportunityRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        name = struct["name"]
        description = struct["description"]
        amount = struct["amount"]
        if parsed_json["owner"].nil?
          owner = nil
        else
          owner = parsed_json["owner"].to_json
          owner = Merge::Crm::OpportunityRequestOwner.from_json(json_object: owner)
        end
        if parsed_json["account"].nil?
          account = nil
        else
          account = parsed_json["account"].to_json
          account = Merge::Crm::OpportunityRequestAccount.from_json(json_object: account)
        end
        if parsed_json["stage"].nil?
          stage = nil
        else
          stage = parsed_json["stage"].to_json
          stage = Merge::Crm::OpportunityRequestStage.from_json(json_object: stage)
        end
        status = struct["status"]
        last_activity_at = (DateTime.parse(parsed_json["last_activity_at"]) unless parsed_json["last_activity_at"].nil?)
        close_date = (DateTime.parse(parsed_json["close_date"]) unless parsed_json["close_date"].nil?)
        integration_params = struct["integration_params"]
        linked_account_params = struct["linked_account_params"]
        remote_fields = parsed_json["remote_fields"]&.map do |v|
          v = v.to_json
          Merge::Crm::RemoteFieldRequest.from_json(json_object: v)
        end
        new(
          name: name,
          description: description,
          amount: amount,
          owner: owner,
          account: account,
          stage: stage,
          status: status,
          last_activity_at: last_activity_at,
          close_date: close_date,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          remote_fields: remote_fields,
          additional_properties: struct
        )
      end

      # Serialize an instance of OpportunityRequest to a JSON object
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
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.amount&.is_a?(Integer) != false || raise("Passed value for field obj.amount is not the expected type, validation failed.")
        obj.owner.nil? || Merge::Crm::OpportunityRequestOwner.validate_raw(obj: obj.owner)
        obj.account.nil? || Merge::Crm::OpportunityRequestAccount.validate_raw(obj: obj.account)
        obj.stage.nil? || Merge::Crm::OpportunityRequestStage.validate_raw(obj: obj.stage)
        obj.status&.is_a?(Merge::Crm::OpportunityStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.last_activity_at&.is_a?(DateTime) != false || raise("Passed value for field obj.last_activity_at is not the expected type, validation failed.")
        obj.close_date&.is_a?(DateTime) != false || raise("Passed value for field obj.close_date is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
