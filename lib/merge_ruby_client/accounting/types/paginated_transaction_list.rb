# frozen_string_literal: true

require_relative "transaction"
require "ostruct"
require "json"

module Merge
  module Accounting
    class PaginatedTransactionList
      # @return [String]
      attr_reader :next_
      # @return [String]
      attr_reader :previous
      # @return [Array<Merge::Accounting::Transaction>]
      attr_reader :results
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param next_ [String]
      # @param previous [String]
      # @param results [Array<Merge::Accounting::Transaction>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::PaginatedTransactionList]
      def initialize(next_: OMIT, previous: OMIT, results: OMIT, additional_properties: nil)
        @next_ = next_ if next_ != OMIT
        @previous = previous if previous != OMIT
        @results = results if results != OMIT
        @additional_properties = additional_properties
        @_field_set = { "next": next_, "previous": previous, "results": results }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of PaginatedTransactionList
      #
      # @param json_object [String]
      # @return [Merge::Accounting::PaginatedTransactionList]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        next_ = parsed_json["next"]
        previous = parsed_json["previous"]
        results = parsed_json["results"]&.map do |item|
          item = item.to_json
          Merge::Accounting::Transaction.from_json(json_object: item)
        end
        new(
          next_: next_,
          previous: previous,
          results: results,
          additional_properties: struct
        )
      end

      # Serialize an instance of PaginatedTransactionList to a JSON object
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
        obj.next_&.is_a?(String) != false || raise("Passed value for field obj.next_ is not the expected type, validation failed.")
        obj.previous&.is_a?(String) != false || raise("Passed value for field obj.previous is not the expected type, validation failed.")
        obj.results&.is_a?(Array) != false || raise("Passed value for field obj.results is not the expected type, validation failed.")
      end
    end
  end
end
