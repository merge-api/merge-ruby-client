# frozen_string_literal: true

require "date"
require_relative "status_7_d_1_enum"
require_relative "category_type_enum"
require_relative "tracking_category_company"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The TrackingCategory Object
    #  ### Description
    #  A `TrackingCategory` object represents a categorization method used to classify
    #  transactions within an accounting platform. They are often used to group records
    #  for reporting and analysis purposes. The most common types of
    #  `TrackingCategories` are Classes and Departments.
    #  ### Usage Example
    #  Fetch from the `GET TrackingCategory` endpoint and view a company's tracking
    #  category.
    class TrackingCategory
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String] The tracking category's name.
      attr_reader :name
      # @return [Merge::Accounting::Status7D1Enum] The tracking category's status.
      #  - `ACTIVE` - ACTIVE
      #  - `ARCHIVED` - ARCHIVED
      attr_reader :status
      # @return [Merge::Accounting::CategoryTypeEnum] The tracking category’s type.
      #  - `CLASS` - CLASS
      #  - `DEPARTMENT` - DEPARTMENT
      attr_reader :category_type
      # @return [String]
      attr_reader :parent_category
      # @return [Merge::Accounting::TrackingCategoryCompany] The company the GeneralLedgerTransaction belongs to.
      attr_reader :company
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      attr_reader :remote_was_deleted
      # @return [Hash{String => Object}]
      attr_reader :field_mappings
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
      # @param name [String] The tracking category's name.
      # @param status [Merge::Accounting::Status7D1Enum] The tracking category's status.
      #  - `ACTIVE` - ACTIVE
      #  - `ARCHIVED` - ARCHIVED
      # @param category_type [Merge::Accounting::CategoryTypeEnum] The tracking category’s type.
      #  - `CLASS` - CLASS
      #  - `DEPARTMENT` - DEPARTMENT
      # @param parent_category [String]
      # @param company [Merge::Accounting::TrackingCategoryCompany] The company the GeneralLedgerTransaction belongs to.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param field_mappings [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::TrackingCategory]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, name: OMIT, status: OMIT,
                     category_type: OMIT, parent_category: OMIT, company: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @name = name if name != OMIT
        @status = status if status != OMIT
        @category_type = category_type if category_type != OMIT
        @parent_category = parent_category if parent_category != OMIT
        @company = company if company != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "name": name,
          "status": status,
          "category_type": category_type,
          "parent_category": parent_category,
          "company": company,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of TrackingCategory
      #
      # @param json_object [String]
      # @return [Merge::Accounting::TrackingCategory]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        name = parsed_json["name"]
        status = parsed_json["status"]
        category_type = parsed_json["category_type"]
        parent_category = parsed_json["parent_category"]
        if parsed_json["company"].nil?
          company = nil
        else
          company = parsed_json["company"].to_json
          company = Merge::Accounting::TrackingCategoryCompany.from_json(json_object: company)
        end
        remote_was_deleted = parsed_json["remote_was_deleted"]
        field_mappings = parsed_json["field_mappings"]
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          name: name,
          status: status,
          category_type: category_type,
          parent_category: parent_category,
          company: company,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          additional_properties: struct
        )
      end

      # Serialize an instance of TrackingCategory to a JSON object
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
        obj.status&.is_a?(Merge::Accounting::Status7D1Enum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.category_type&.is_a?(Merge::Accounting::CategoryTypeEnum) != false || raise("Passed value for field obj.category_type is not the expected type, validation failed.")
        obj.parent_category&.is_a?(String) != false || raise("Passed value for field obj.parent_category is not the expected type, validation failed.")
        obj.company.nil? || Merge::Accounting::TrackingCategoryCompany.validate_raw(obj: obj.company)
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
      end
    end
  end
end
