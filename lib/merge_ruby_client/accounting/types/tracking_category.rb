# frozen_string_literal: true

require_relative "status_7_d_1_enum"
require_relative "category_type_enum"
require_relative "tracking_category_company"
require "date"
require_relative "remote_data"
require "json"

module Merge
  module Accounting
    # # The TrackingCategory Object
    #
    # ### Description
    #
    # A `TrackingCategory` object represents a categorization method used to classify transactions within an accounting platform. They are often used to group records for reporting and analysis purposes. The most common types of `TrackingCategories` are Classes and Departments.
    #
    # ### Usage Example
    #
    # Fetch from the `GET TrackingCategory` endpoint and view a company's tracking category.
    class TrackingCategory
      attr_reader :name, :status, :category_type, :parent_category, :company, :remote_was_deleted, :id, :remote_id,
                  :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties

      # @param name [String] The tracking category's name.
      # @param status [STATUS_7_D_1_ENUM] The tracking category's status.
      #   - `ACTIVE` - ACTIVE
      #   - `ARCHIVED` - ARCHIVED
      # @param category_type [CATEGORY_TYPE_ENUM] The tracking category’s type.
      #   - `CLASS` - CLASS
      #   - `DEPARTMENT` - DEPARTMENT
      # @param parent_category [String] ID of the parent tracking category.
      # @param company [Accounting::TrackingCategoryCompany] The company the tracking category belongs to.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Accounting::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Accounting::TrackingCategory]
      def initialize(name: nil, status: nil, category_type: nil, parent_category: nil, company: nil,
                     remote_was_deleted: nil, id: nil, remote_id: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String] The tracking category's name.
        @name = name
        # @type [STATUS_7_D_1_ENUM] The tracking category's status.
        #   - `ACTIVE` - ACTIVE
        #   - `ARCHIVED` - ARCHIVED
        @status = status
        # @type [CATEGORY_TYPE_ENUM] The tracking category’s type.
        #   - `CLASS` - CLASS
        #   - `DEPARTMENT` - DEPARTMENT
        @category_type = category_type
        # @type [String] ID of the parent tracking category.
        @parent_category = parent_category
        # @type [Accounting::TrackingCategoryCompany] The company the tracking category belongs to.
        @company = company
        # @type [Boolean] Indicates whether or not this object has been deleted in the third party platform.
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
        # @type [Array<Accounting::RemoteData>]
        @remote_data = remote_data
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of TrackingCategory
      #
      # @param json_object [JSON]
      # @return [Accounting::TrackingCategory]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        name = struct.name
        status = Accounting::STATUS_7_D_1_ENUM.key(parsed_json["status"]) || parsed_json["status"]
        category_type = Accounting::CATEGORY_TYPE_ENUM.key(parsed_json["category_type"]) || parsed_json["category_type"]
        parent_category = struct.parent_category
        if parsed_json["company"].nil?
          company = nil
        else
          company = parsed_json["company"].to_json
          company = Accounting::TrackingCategoryCompany.from_json(json_object: company)
        end
        remote_was_deleted = struct.remote_was_deleted
        id = struct.id
        remote_id = struct.remote_id
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        field_mappings = struct.field_mappings
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Accounting::RemoteData.from_json(json_object: v)
        end
        new(name: name, status: status, category_type: category_type, parent_category: parent_category,
            company: company, remote_was_deleted: remote_was_deleted, id: id, remote_id: remote_id, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end

      # Serialize an instance of TrackingCategory to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "name": @name,
          "status": Accounting::STATUS_7_D_1_ENUM[@status] || @status,
          "category_type": Accounting::CATEGORY_TYPE_ENUM[@category_type] || @category_type,
          "parent_category": @parent_category,
          "company": @company,
          "remote_was_deleted": @remote_was_deleted,
          "id": @id,
          "remote_id": @remote_id,
          "created_at": @created_at,
          "modified_at": @modified_at,
          "field_mappings": @field_mappings,
          "remote_data": @remote_data
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.status&.is_a?(Accounting::STATUS_7_D_1_ENUM) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.category_type&.is_a?(Accounting::CATEGORY_TYPE_ENUM) != false || raise("Passed value for field obj.category_type is not the expected type, validation failed.")
        obj.parent_category&.is_a?(String) != false || raise("Passed value for field obj.parent_category is not the expected type, validation failed.")
        obj.company.nil? || Accounting::TrackingCategoryCompany.validate_raw(obj: obj.company)
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
