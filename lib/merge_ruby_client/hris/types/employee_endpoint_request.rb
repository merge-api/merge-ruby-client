# frozen_string_literal: true

require_relative "employee_request"
require "ostruct"
require "json"

module Merge
  module Hris
    class EmployeeEndpointRequest
      # @return [Merge::Hris::EmployeeRequest]
      attr_reader :model
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param model [Merge::Hris::EmployeeRequest]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Hris::EmployeeEndpointRequest]
      def initialize(model:, additional_properties: nil)
        @model = model
        @additional_properties = additional_properties
        @_field_set = { "model": model }
      end

      # Deserialize a JSON object to an instance of EmployeeEndpointRequest
      #
      # @param json_object [String]
      # @return [Merge::Hris::EmployeeEndpointRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["model"].nil?
          model = nil
        else
          model = parsed_json["model"].to_json
          model = Merge::Hris::EmployeeRequest.from_json(json_object: model)
        end
        new(model: model, additional_properties: struct)
      end

      # Serialize an instance of EmployeeEndpointRequest to a JSON object
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
        Merge::Hris::EmployeeRequest.validate_raw(obj: obj.model)
      end
    end
  end
end
