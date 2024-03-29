# frozen_string_literal: true

require_relative "opportunity_request_owner"
require_relative "opportunity_request_account"
require_relative "opportunity_request_stage"
require_relative "opportunity_status_enum"
require "date"
require_relative "remote_field_request"
require "json"

module Merge
  module Crm
    # # The Opportunity Object
    #
    # ### Description
    #
    # The `Opportunity` object is used to represent a deal opportunity in a CRM system.
    #
    # ### Usage Example
    #
    # TODO
    class OpportunityRequest
      attr_reader :name, :description, :amount, :owner, :account, :stage, :status, :last_activity_at, :close_date,
                  :integration_params, :linked_account_params, :remote_fields, :additional_properties

      # @param name [String] The opportunity's name.
      # @param description [String] The opportunity's description.
      # @param amount [Integer] The opportunity's amount.
      # @param owner [Crm::OpportunityRequestOwner] The opportunity's owner.
      # @param account [Crm::OpportunityRequestAccount] The account of the opportunity.
      # @param stage [Crm::OpportunityRequestStage] The stage of the opportunity.
      # @param status [OPPORTUNITY_STATUS_ENUM] The opportunity's status.
      #   - `OPEN` - OPEN
      #   - `WON` - WON
      #   - `LOST` - LOST
      # @param last_activity_at [DateTime] When the opportunity's last activity occurred.
      # @param close_date [DateTime] When the opportunity was closed.
      # @param integration_params [Hash{String => String}]
      # @param linked_account_params [Hash{String => String}]
      # @param remote_fields [Array<Crm::RemoteFieldRequest>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::OpportunityRequest]
      def initialize(name: nil, description: nil, amount: nil, owner: nil, account: nil, stage: nil, status: nil,
                     last_activity_at: nil, close_date: nil, integration_params: nil, linked_account_params: nil, remote_fields: nil, additional_properties: nil)
        # @type [String] The opportunity's name.
        @name = name
        # @type [String] The opportunity's description.
        @description = description
        # @type [Integer] The opportunity's amount.
        @amount = amount
        # @type [Crm::OpportunityRequestOwner] The opportunity's owner.
        @owner = owner
        # @type [Crm::OpportunityRequestAccount] The account of the opportunity.
        @account = account
        # @type [Crm::OpportunityRequestStage] The stage of the opportunity.
        @stage = stage
        # @type [OPPORTUNITY_STATUS_ENUM] The opportunity's status.
        #   - `OPEN` - OPEN
        #   - `WON` - WON
        #   - `LOST` - LOST
        @status = status
        # @type [DateTime] When the opportunity's last activity occurred.
        @last_activity_at = last_activity_at
        # @type [DateTime] When the opportunity was closed.
        @close_date = close_date
        # @type [Hash{String => String}]
        @integration_params = integration_params
        # @type [Hash{String => String}]
        @linked_account_params = linked_account_params
        # @type [Array<Crm::RemoteFieldRequest>]
        @remote_fields = remote_fields
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of OpportunityRequest
      #
      # @param json_object [JSON]
      # @return [Crm::OpportunityRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        name = struct.name
        description = struct.description
        amount = struct.amount
        if parsed_json["owner"].nil?
          owner = nil
        else
          owner = parsed_json["owner"].to_json
          owner = Crm::OpportunityRequestOwner.from_json(json_object: owner)
        end
        if parsed_json["account"].nil?
          account = nil
        else
          account = parsed_json["account"].to_json
          account = Crm::OpportunityRequestAccount.from_json(json_object: account)
        end
        if parsed_json["stage"].nil?
          stage = nil
        else
          stage = parsed_json["stage"].to_json
          stage = Crm::OpportunityRequestStage.from_json(json_object: stage)
        end
        status = Crm::OPPORTUNITY_STATUS_ENUM.key(parsed_json["status"]) || parsed_json["status"]
        last_activity_at = (DateTime.parse(parsed_json["last_activity_at"]) unless parsed_json["last_activity_at"].nil?)
        close_date = (DateTime.parse(parsed_json["close_date"]) unless parsed_json["close_date"].nil?)
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        remote_fields = parsed_json["remote_fields"]&.map do |v|
          v = v.to_json
          Crm::RemoteFieldRequest.from_json(json_object: v)
        end
        new(name: name, description: description, amount: amount, owner: owner, account: account, stage: stage,
            status: status, last_activity_at: last_activity_at, close_date: close_date, integration_params: integration_params, linked_account_params: linked_account_params, remote_fields: remote_fields, additional_properties: struct)
      end

      # Serialize an instance of OpportunityRequest to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "name": @name,
          "description": @description,
          "amount": @amount,
          "owner": @owner,
          "account": @account,
          "stage": @stage,
          "status": Crm::OPPORTUNITY_STATUS_ENUM[@status] || @status,
          "last_activity_at": @last_activity_at,
          "close_date": @close_date,
          "integration_params": @integration_params,
          "linked_account_params": @linked_account_params,
          "remote_fields": @remote_fields
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.amount&.is_a?(Integer) != false || raise("Passed value for field obj.amount is not the expected type, validation failed.")
        obj.owner.nil? || Crm::OpportunityRequestOwner.validate_raw(obj: obj.owner)
        obj.account.nil? || Crm::OpportunityRequestAccount.validate_raw(obj: obj.account)
        obj.stage.nil? || Crm::OpportunityRequestStage.validate_raw(obj: obj.stage)
        obj.status&.is_a?(Crm::OPPORTUNITY_STATUS_ENUM) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.last_activity_at&.is_a?(DateTime) != false || raise("Passed value for field obj.last_activity_at is not the expected type, validation failed.")
        obj.close_date&.is_a?(DateTime) != false || raise("Passed value for field obj.close_date is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
