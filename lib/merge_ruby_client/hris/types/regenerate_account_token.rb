# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Hris
    # # The RegenerateAccountToken Object
    #  ### Description
    #  The `RegenerateAccountToken` object is used to exchange an old account token for
    #  a new one.
    #  ### Usage Example
    #  Post to receive a new `RegenerateAccountToken`.
    class RegenerateAccountToken
      # @return [String]
      attr_reader :linked_account_id
      # @return [String]
      attr_reader :account_token
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param linked_account_id [String]
      # @param account_token [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Hris::RegenerateAccountToken]
      def initialize(linked_account_id:, account_token:, additional_properties: nil)
        @linked_account_id = linked_account_id
        @account_token = account_token
        @additional_properties = additional_properties
        @_field_set = { "linked_account_id": linked_account_id, "account_token": account_token }
      end

      # Deserialize a JSON object to an instance of RegenerateAccountToken
      #
      # @param json_object [String]
      # @return [Merge::Hris::RegenerateAccountToken]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        linked_account_id = parsed_json["linked_account_id"]
        account_token = parsed_json["account_token"]
        new(
          linked_account_id: linked_account_id,
          account_token: account_token,
          additional_properties: struct
        )
      end

      # Serialize an instance of RegenerateAccountToken to a JSON object
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
        obj.linked_account_id.is_a?(String) != false || raise("Passed value for field obj.linked_account_id is not the expected type, validation failed.")
        obj.account_token.is_a?(String) != false || raise("Passed value for field obj.account_token is not the expected type, validation failed.")
      end
    end
  end
end
