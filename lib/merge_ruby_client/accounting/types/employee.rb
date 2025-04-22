# frozen_string_literal: true

require "date"
require_relative "employee_company"
require_relative "status_895_enum"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The Employee Object
    #  ### Description
    #  An `Employee` is an individual who works for the company of the linked account.
    #  The `Employee` model contains both contractors and full time employees.
    #  * An `Employee` is a contractor if `is_contractor` property is `True`
    #  * An `Employee` is a full time employee if `is_contractor` property is `False`
    #  ### Usage Example
    #  Fetch from the `LIST Employees` endpoint and view a company's employees.
    class Employee
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String] The employee's first name.
      attr_reader :first_name
      # @return [String] The employee's last name.
      attr_reader :last_name
      # @return [Boolean] `True` if the employee is a contractor, `False` if not.
      attr_reader :is_contractor
      # @return [String] The employee's internal identification number.
      attr_reader :employee_number
      # @return [String] The employee's email address.
      attr_reader :email_address
      # @return [Merge::Accounting::EmployeeCompany] The subsidiary that the employee belongs to.
      attr_reader :company
      # @return [Merge::Accounting::Status895Enum] The employee's status in the accounting system.
      #  * `ACTIVE` - ACTIVE
      #  * `INACTIVE` - INACTIVE
      attr_reader :status
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      attr_reader :remote_was_deleted
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
      # @param first_name [String] The employee's first name.
      # @param last_name [String] The employee's last name.
      # @param is_contractor [Boolean] `True` if the employee is a contractor, `False` if not.
      # @param employee_number [String] The employee's internal identification number.
      # @param email_address [String] The employee's email address.
      # @param company [Merge::Accounting::EmployeeCompany] The subsidiary that the employee belongs to.
      # @param status [Merge::Accounting::Status895Enum] The employee's status in the accounting system.
      #  * `ACTIVE` - ACTIVE
      #  * `INACTIVE` - INACTIVE
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Accounting::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::Employee]
      def initialize(status:, id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, first_name: OMIT, last_name: OMIT,
                     is_contractor: OMIT, employee_number: OMIT, email_address: OMIT, company: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @first_name = first_name if first_name != OMIT
        @last_name = last_name if last_name != OMIT
        @is_contractor = is_contractor if is_contractor != OMIT
        @employee_number = employee_number if employee_number != OMIT
        @email_address = email_address if email_address != OMIT
        @company = company if company != OMIT
        @status = status
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "first_name": first_name,
          "last_name": last_name,
          "is_contractor": is_contractor,
          "employee_number": employee_number,
          "email_address": email_address,
          "company": company,
          "status": status,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Employee
      #
      # @param json_object [String]
      # @return [Merge::Accounting::Employee]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        first_name = parsed_json["first_name"]
        last_name = parsed_json["last_name"]
        is_contractor = parsed_json["is_contractor"]
        employee_number = parsed_json["employee_number"]
        email_address = parsed_json["email_address"]
        if parsed_json["company"].nil?
          company = nil
        else
          company = parsed_json["company"].to_json
          company = Merge::Accounting::EmployeeCompany.from_json(json_object: company)
        end
        status = parsed_json["status"]
        remote_was_deleted = parsed_json["remote_was_deleted"]
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
          first_name: first_name,
          last_name: last_name,
          is_contractor: is_contractor,
          employee_number: employee_number,
          email_address: email_address,
          company: company,
          status: status,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of Employee to a JSON object
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
        obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
        obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
        obj.is_contractor&.is_a?(Boolean) != false || raise("Passed value for field obj.is_contractor is not the expected type, validation failed.")
        obj.employee_number&.is_a?(String) != false || raise("Passed value for field obj.employee_number is not the expected type, validation failed.")
        obj.email_address&.is_a?(String) != false || raise("Passed value for field obj.email_address is not the expected type, validation failed.")
        obj.company.nil? || Merge::Accounting::EmployeeCompany.validate_raw(obj: obj.company)
        obj.status.is_a?(Merge::Accounting::Status895Enum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
