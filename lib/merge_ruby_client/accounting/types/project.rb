# frozen_string_literal: true

require "date"
require_relative "project_company"
require_relative "project_contact"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The Project Object
    #  ### Description
    #  The `Project` object is used to track and manage time, costs, resources, and
    #  revenue for specific initiatives or work efforts.
    #  It provides classification on transactions for allocating expenses, revenue, and
    #  activities to a specific project for financial reporting.
    #  ### Usage Example
    #  Fetch from the `GET Project` endpoint and view project information.
    class Project
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String] The project’s name
      attr_reader :name
      # @return [Boolean] `True` if the project is active, `False` if the project is not active.
      attr_reader :is_active
      # @return [Merge::Accounting::ProjectCompany] The subsidiary that the project belongs to.
      attr_reader :company
      # @return [Merge::Accounting::ProjectContact] The supplier, or customer involved in the project.
      attr_reader :contact
      # @return [Hash{String => Object}]
      attr_reader :field_mappings
      # @return [Array<Merge::Accounting::RemoteData>]
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
      # @param name [String] The project’s name
      # @param is_active [Boolean] `True` if the project is active, `False` if the project is not active.
      # @param company [Merge::Accounting::ProjectCompany] The subsidiary that the project belongs to.
      # @param contact [Merge::Accounting::ProjectContact] The supplier, or customer involved in the project.
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Accounting::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::Project]
      def initialize(name:, id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, is_active: OMIT,
                     company: OMIT, contact: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @name = name
        @is_active = is_active if is_active != OMIT
        @company = company if company != OMIT
        @contact = contact if contact != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "name": name,
          "is_active": is_active,
          "company": company,
          "contact": contact,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Project
      #
      # @param json_object [String]
      # @return [Merge::Accounting::Project]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        name = parsed_json["name"]
        is_active = parsed_json["is_active"]
        if parsed_json["company"].nil?
          company = nil
        else
          company = parsed_json["company"].to_json
          company = Merge::Accounting::ProjectCompany.from_json(json_object: company)
        end
        if parsed_json["contact"].nil?
          contact = nil
        else
          contact = parsed_json["contact"].to_json
          contact = Merge::Accounting::ProjectContact.from_json(json_object: contact)
        end
        field_mappings = parsed_json["field_mappings"]
        remote_data = parsed_json["remote_data"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteData.from_json(json_object: item)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          name: name,
          is_active: is_active,
          company: company,
          contact: contact,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of Project to a JSON object
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
        obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.is_active&.is_a?(Boolean) != false || raise("Passed value for field obj.is_active is not the expected type, validation failed.")
        obj.company.nil? || Merge::Accounting::ProjectCompany.validate_raw(obj: obj.company)
        obj.contact.nil? || Merge::Accounting::ProjectContact.validate_raw(obj: obj.contact)
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
