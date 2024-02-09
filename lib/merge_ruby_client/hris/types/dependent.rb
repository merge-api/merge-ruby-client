# frozen_string_literal: true

require_relative "relationship_enum"
require "date"
require_relative "gender_enum"
require_relative "remote_data"
require "json"

module Merge
  module Hris
    # # The Dependent Object
    #
    # ### Description
    #
    # The `Dependent` object is used to represent a dependent (e.g. child, spouse, domestic partner, etc) of an `Employee`
    #
    # ### Usage Example
    #
    # Fetch from the `LIST Dependents` endpoint and filter by `ID` to show all dependents.
    class Dependent
      attr_reader :id, :remote_id, :first_name, :middle_name, :last_name, :relationship, :employee, :date_of_birth,
                  :gender, :phone_number, :home_location, :is_student, :ssn, :remote_was_deleted, :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param first_name [String] The dependents's first name.
      # @param middle_name [String] The dependents's middle name.
      # @param last_name [String] The dependents's last name.
      # @param relationship [RELATIONSHIP_ENUM] The dependent's relationship to the employee.
      #   - `CHILD` - CHILD
      #   - `SPOUSE` - SPOUSE
      #   - `DOMESTIC_PARTNER` - DOMESTIC_PARTNER
      # @param employee [String] The employee this person is a dependent of.
      # @param date_of_birth [DateTime] The dependent's date of birth.
      # @param gender [GENDER_ENUM] The dependent's gender.
      #   - `MALE` - MALE
      #   - `FEMALE` - FEMALE
      #   - `NON-BINARY` - NON-BINARY
      #   - `OTHER` - OTHER
      #   - `PREFER_NOT_TO_DISCLOSE` - PREFER_NOT_TO_DISCLOSE
      # @param phone_number [String] The dependent's phone number.
      # @param home_location [String] The dependents's home address.
      # @param is_student [Boolean] Whether or not the dependent is a student
      # @param ssn [String] The dependents's social security number.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Hris::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Hris::Dependent]
      def initialize(id: nil, remote_id: nil, first_name: nil, middle_name: nil, last_name: nil, relationship: nil,
                     employee: nil, date_of_birth: nil, gender: nil, phone_number: nil, home_location: nil, is_student: nil, ssn: nil, remote_was_deleted: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [String] The dependents's first name.
        @first_name = first_name
        # @type [String] The dependents's middle name.
        @middle_name = middle_name
        # @type [String] The dependents's last name.
        @last_name = last_name
        # @type [RELATIONSHIP_ENUM] The dependent's relationship to the employee.
        #   - `CHILD` - CHILD
        #   - `SPOUSE` - SPOUSE
        #   - `DOMESTIC_PARTNER` - DOMESTIC_PARTNER
        @relationship = relationship
        # @type [String] The employee this person is a dependent of.
        @employee = employee
        # @type [DateTime] The dependent's date of birth.
        @date_of_birth = date_of_birth
        # @type [GENDER_ENUM] The dependent's gender.
        #   - `MALE` - MALE
        #   - `FEMALE` - FEMALE
        #   - `NON-BINARY` - NON-BINARY
        #   - `OTHER` - OTHER
        #   - `PREFER_NOT_TO_DISCLOSE` - PREFER_NOT_TO_DISCLOSE
        @gender = gender
        # @type [String] The dependent's phone number.
        @phone_number = phone_number
        # @type [String] The dependents's home address.
        @home_location = home_location
        # @type [Boolean] Whether or not the dependent is a student
        @is_student = is_student
        # @type [String] The dependents's social security number.
        @ssn = ssn
        # @type [Boolean] Indicates whether or not this object has been deleted in the third party platform.
        @remote_was_deleted = remote_was_deleted
        # @type [DateTime]
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [Hash{String => String}]
        @field_mappings = field_mappings
        # @type [Array<Hris::RemoteData>]
        @remote_data = remote_data
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Dependent
      #
      # @param json_object [JSON]
      # @return [Hris::Dependent]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        remote_id = struct.remote_id
        first_name = struct.first_name
        middle_name = struct.middle_name
        last_name = struct.last_name
        relationship = Hris::RELATIONSHIP_ENUM.key(parsed_json["relationship"]) || parsed_json["relationship"]
        employee = struct.employee
        date_of_birth = (DateTime.parse(parsed_json["date_of_birth"]) unless parsed_json["date_of_birth"].nil?)
        gender = Hris::GENDER_ENUM.key(parsed_json["gender"]) || parsed_json["gender"]
        phone_number = struct.phone_number
        home_location = struct.home_location
        is_student = struct.is_student
        ssn = struct.ssn
        remote_was_deleted = struct.remote_was_deleted
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        field_mappings = struct.field_mappings
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Hris::RemoteData.from_json(json_object: v)
        end
        new(id: id, remote_id: remote_id, first_name: first_name, middle_name: middle_name, last_name: last_name,
            relationship: relationship, employee: employee, date_of_birth: date_of_birth, gender: gender, phone_number: phone_number, home_location: home_location, is_student: is_student, ssn: ssn, remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end

      # Serialize an instance of Dependent to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "remote_id": @remote_id,
          "first_name": @first_name,
          "middle_name": @middle_name,
          "last_name": @last_name,
          "relationship": Hris::RELATIONSHIP_ENUM[@relationship] || @relationship,
          "employee": @employee,
          "date_of_birth": @date_of_birth,
          "gender": Hris::GENDER_ENUM[@gender] || @gender,
          "phone_number": @phone_number,
          "home_location": @home_location,
          "is_student": @is_student,
          "ssn": @ssn,
          "remote_was_deleted": @remote_was_deleted,
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
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
        obj.middle_name&.is_a?(String) != false || raise("Passed value for field obj.middle_name is not the expected type, validation failed.")
        obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
        obj.relationship&.is_a?(Hris::RELATIONSHIP_ENUM) != false || raise("Passed value for field obj.relationship is not the expected type, validation failed.")
        obj.employee&.is_a?(String) != false || raise("Passed value for field obj.employee is not the expected type, validation failed.")
        obj.date_of_birth&.is_a?(DateTime) != false || raise("Passed value for field obj.date_of_birth is not the expected type, validation failed.")
        obj.gender&.is_a?(Hris::GENDER_ENUM) != false || raise("Passed value for field obj.gender is not the expected type, validation failed.")
        obj.phone_number&.is_a?(String) != false || raise("Passed value for field obj.phone_number is not the expected type, validation failed.")
        obj.home_location&.is_a?(String) != false || raise("Passed value for field obj.home_location is not the expected type, validation failed.")
        obj.is_student&.is_a?(Boolean) != false || raise("Passed value for field obj.is_student is not the expected type, validation failed.")
        obj.ssn&.is_a?(String) != false || raise("Passed value for field obj.ssn is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
