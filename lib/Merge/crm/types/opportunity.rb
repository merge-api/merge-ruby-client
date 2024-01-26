# frozen_string_literal: true
require_relative "opportunity_owner"
require_relative "opportunity_account"
require_relative "opportunity_stage"
require_relative "opportunity_status"
require "date"
require "date"
require "date"
require "date"
require "date"
require_relative "remote_data"
require_relative "remote_field"
require "json"

module Merge
  module Crm
    # # The Opportunity Object 
### Description

The `Opportunity` object is used to represent a deal opportunity in a CRM system.

### Usage Example

TODO
    class Opportunity
      attr_reader :name, :description, :amount, :owner, :account, :stage, :status, :last_activity_at, :close_date, :remote_created_at, :remote_was_deleted, :id, :remote_id, :created_at, :modified_at, :field_mappings, :remote_data, :remote_fields, :additional_properties
      # @param name [String] The opportunity's name.
      # @param description [String] The opportunity's description.
      # @param amount [Integer] The opportunity's amount.
      # @param owner [Crm::OpportunityOwner] The opportunity's owner.
      # @param account [Crm::OpportunityAccount] The account of the opportunity.
      # @param stage [Crm::OpportunityStage] The stage of the opportunity.
      # @param status [Crm::OpportunityStatus] The opportunity's status.  - `OPEN` - OPEN
- `WON` - WON
- `LOST` - LOST
      # @param last_activity_at [DateTime] When the opportunity's last activity occurred.
      # @param close_date [DateTime] When the opportunity was closed.
      # @param remote_created_at [DateTime] When the third party's opportunity was created.
      # @param remote_was_deleted [Boolean] 
      # @param id [String] 
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param created_at [DateTime] 
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}] 
      # @param remote_data [Array<Crm::RemoteData>] 
      # @param remote_fields [Array<Crm::RemoteField>] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::Opportunity]
      def initialize(name: nil, description: nil, amount: nil, owner: nil, account: nil, stage: nil, status: nil, last_activity_at: nil, close_date: nil, remote_created_at: nil, remote_was_deleted: nil, id: nil, remote_id: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, remote_fields: nil, additional_properties: nil)
        # @type [String] The opportunity's name.
        @name = name
        # @type [String] The opportunity's description.
        @description = description
        # @type [Integer] The opportunity's amount.
        @amount = amount
        # @type [Crm::OpportunityOwner] The opportunity's owner.
        @owner = owner
        # @type [Crm::OpportunityAccount] The account of the opportunity.
        @account = account
        # @type [Crm::OpportunityStage] The stage of the opportunity.
        @stage = stage
        # @type [Crm::OpportunityStatus] The opportunity's status. 
- `OPEN` - OPEN
- `WON` - WON
- `LOST` - LOST
        @status = status
        # @type [DateTime] When the opportunity's last activity occurred.
        @last_activity_at = last_activity_at
        # @type [DateTime] When the opportunity was closed.
        @close_date = close_date
        # @type [DateTime] When the third party's opportunity was created.
        @remote_created_at = remote_created_at
        # @type [Boolean] 
        @remote_was_deleted = remote_was_deleted
        # @type [String] 
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [DateTime] 
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [Hash{String => String}] 
        @field_mappings = field_mappings
        # @type [Array<Crm::RemoteData>] 
        @remote_data = remote_data
        # @type [Array<Crm::RemoteField>] 
        @remote_fields = remote_fields
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of Opportunity
      #
      # @param json_object [JSON] 
      # @return [Crm::Opportunity]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        name = struct.name
        description = struct.description
        amount = struct.amount
        owner = struct.owner.to_h.to_json()
        owner = Crm::OpportunityOwner.from_json(json_object: owner)
        account = struct.account.to_h.to_json()
        account = Crm::OpportunityAccount.from_json(json_object: account)
        stage = struct.stage.to_h.to_json()
        stage = Crm::OpportunityStage.from_json(json_object: stage)
        status = struct.status.to_h.to_json()
        status = Crm::OpportunityStatus.from_json(json_object: status)
        last_activity_at = DateTime.parse(struct.last_activity_at)
        close_date = DateTime.parse(struct.close_date)
        remote_created_at = DateTime.parse(struct.remote_created_at)
        remote_was_deleted = struct.remote_was_deleted
        id = struct.id
        remote_id = struct.remote_id
        created_at = DateTime.parse(struct.created_at)
        modified_at = DateTime.parse(struct.modified_at)
        field_mappings = struct.field_mappings
        remote_data = struct.remote_data.map() do | v |
  v = v.to_h.to_json()
  Crm::RemoteData.from_json(json_object: v)
end
        remote_fields = struct.remote_fields.map() do | v |
  v = v.to_h.to_json()
  Crm::RemoteField.from_json(json_object: v)
end
        new(name: name, description: description, amount: amount, owner: owner, account: account, stage: stage, status: status, last_activity_at: last_activity_at, close_date: close_date, remote_created_at: remote_created_at, remote_was_deleted: remote_was_deleted, id: id, remote_id: remote_id, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, remote_fields: remote_fields, additional_properties: struct)
      end
      # Serialize an instance of Opportunity to a JSON object
      #
      # @return [JSON]
      def to_json
        { "name": @name, "description": @description, "amount": @amount, "owner": @owner, "account": @account, "stage": @stage, "status": @status, "last_activity_at": @last_activity_at, "close_date": @close_date, "remote_created_at": @remote_created_at, "remote_was_deleted": @remote_was_deleted, "id": @id, "remote_id": @remote_id, "created_at": @created_at, "modified_at": @modified_at, "field_mappings": @field_mappings, "remote_data": @remote_data, "remote_fields": @remote_fields }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.amount&.is_a?(Integer) != false || raise("Passed value for field obj.amount is not the expected type, validation failed.")
        obj.owner.nil?() || Crm::OpportunityOwner.validate_raw(obj: obj.owner)
        obj.account.nil?() || Crm::OpportunityAccount.validate_raw(obj: obj.account)
        obj.stage.nil?() || Crm::OpportunityStage.validate_raw(obj: obj.stage)
        obj.status.nil?() || Crm::OpportunityStatus.validate_raw(obj: obj.status)
        obj.last_activity_at&.is_a?(DateTime) != false || raise("Passed value for field obj.last_activity_at is not the expected type, validation failed.")
        obj.close_date&.is_a?(DateTime) != false || raise("Passed value for field obj.close_date is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end