# frozen_string_literal: true

require_relative "association_type"
require "ostruct"
require "json"

module Merge
  module Crm
    class PaginatedAssociationTypeList
      # @return [String]
      attr_reader :next_
      # @return [String]
      attr_reader :previous
      # @return [Array<Merge::Crm::AssociationType>]
      attr_reader :results
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param next_ [String]
      # @param previous [String]
      # @param results [Array<Merge::Crm::AssociationType>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::PaginatedAssociationTypeList]
      def initialize(next_: OMIT, previous: OMIT, results: OMIT, additional_properties: nil)
        @next_ = next_ if next_ != OMIT
        @previous = previous if previous != OMIT
        @results = results if results != OMIT
        @additional_properties = additional_properties
        @_field_set = { "next": next_, "previous": previous, "results": results }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of PaginatedAssociationTypeList
      #
      # @param json_object [String]
      # @return [Merge::Crm::PaginatedAssociationTypeList]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        next_ = struct["next"]
        previous = struct["previous"]
        results = parsed_json["results"]&.map do |v|
          v = v.to_json
          Merge::Crm::AssociationType.from_json(json_object: v)
        end
        new(
          next_: next_,
          previous: previous,
          results: results,
          additional_properties: struct
        )
      end

      # Serialize an instance of PaginatedAssociationTypeList to a JSON object
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
