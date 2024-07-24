# frozen_string_literal: true

require "date"
require_relative "relationship_enum"
require_relative "gender_enum"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Hris
    # # The Dependent Object
    #  ### Description
    #  The `Dependent` object is used to represent a dependent (e.g. child, spouse,
    #  domestic partner, etc) of an `Employee`
    #  ### Usage Example
    #  Fetch from the `LIST Dependents` endpoint and filter by `ID` to show all
    #  dependents.
    class Dependent
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String] The dependents's first name.
      attr_reader :first_name
      # @return [String] The dependents's middle name.
      attr_reader :middle_name
      # @return [String] The dependents's last name.
      attr_reader :last_name
      # @return [Merge::Hris::RelationshipEnum] The dependent's relationship to the employee.
      #  - `CHILD` - CHILD
      #  - `SPOUSE` - SPOUSE
      #  - `DOMESTIC_PARTNER` - DOMESTIC_PARTNER
      attr_reader :relationship
      # @return [String] The employee this person is a dependent of.
      attr_reader :employee
      # @return [DateTime] The dependent's date of birth.
      attr_reader :date_of_birth
      # @return [Merge::Hris::GenderEnum] The dependent's gender.
      #  - `MALE` - MALE
      #  - `FEMALE` - FEMALE
      #  - `NON-BINARY` - NON-BINARY
      #  - `OTHER` - OTHER
      #  - `PREFER_NOT_TO_DISCLOSE` - PREFER_NOT_TO_DISCLOSE
      attr_reader :gender
      # @return [String] The dependent's phone number.
      attr_reader :phone_number
      # @return [String] The dependents's home address.
      attr_reader :home_location
      # @return [Boolean] Whether or not the dependent is a student
      attr_reader :is_student
      # @return [String] The dependents's social security number.
      attr_reader :ssn
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      attr_reader :remote_was_deleted
      # @return [Hash{String => Object}]
      attr_reader :field_mappings
      # @return [Array<Merge::Hris::RemoteData>]
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
      # @param first_name [String] The dependents's first name.
      # @param middle_name [String] The dependents's middle name.
      # @param last_name [String] The dependents's last name.
      # @param relationship [Merge::Hris::RelationshipEnum] The dependent's relationship to the employee.
      #  - `CHILD` - CHILD
      #  - `SPOUSE` - SPOUSE
      #  - `DOMESTIC_PARTNER` - DOMESTIC_PARTNER
      # @param employee [String] The employee this person is a dependent of.
      # @param date_of_birth [DateTime] The dependent's date of birth.
      # @param gender [Merge::Hris::GenderEnum] The dependent's gender.
      #  - `MALE` - MALE
      #  - `FEMALE` - FEMALE
      #  - `NON-BINARY` - NON-BINARY
      #  - `OTHER` - OTHER
      #  - `PREFER_NOT_TO_DISCLOSE` - PREFER_NOT_TO_DISCLOSE
      # @param phone_number [String] The dependent's phone number.
      # @param home_location [String] The dependents's home address.
      # @param is_student [Boolean] Whether or not the dependent is a student
      # @param ssn [String] The dependents's social security number.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Hris::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Hris::Dependent]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, first_name: OMIT,
                     middle_name: OMIT, last_name: OMIT, relationship: OMIT, employee: OMIT, date_of_birth: OMIT, gender: OMIT, phone_number: OMIT, home_location: OMIT, is_student: OMIT, ssn: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @first_name = first_name if first_name != OMIT
        @middle_name = middle_name if middle_name != OMIT
        @last_name = last_name if last_name != OMIT
        @relationship = relationship if relationship != OMIT
        @employee = employee if employee != OMIT
        @date_of_birth = date_of_birth if date_of_birth != OMIT
        @gender = gender if gender != OMIT
        @phone_number = phone_number if phone_number != OMIT
        @home_location = home_location if home_location != OMIT
        @is_student = is_student if is_student != OMIT
        @ssn = ssn if ssn != OMIT
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
          "middle_name": middle_name,
          "last_name": last_name,
          "relationship": relationship,
          "employee": employee,
          "date_of_birth": date_of_birth,
          "gender": gender,
          "phone_number": phone_number,
          "home_location": home_location,
          "is_student": is_student,
          "ssn": ssn,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Dependent
      #
      # @param json_object [String]
      # @return [Merge::Hris::Dependent]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        first_name = parsed_json["first_name"]
        middle_name = parsed_json["middle_name"]
        last_name = parsed_json["last_name"]
        relationship = parsed_json["relationship"]
        employee = parsed_json["employee"]
        date_of_birth = (DateTime.parse(parsed_json["date_of_birth"]) unless parsed_json["date_of_birth"].nil?)
        gender = parsed_json["gender"]
        phone_number = parsed_json["phone_number"]
        home_location = parsed_json["home_location"]
        is_student = parsed_json["is_student"]
        ssn = parsed_json["ssn"]
        remote_was_deleted = parsed_json["remote_was_deleted"]
        field_mappings = parsed_json["field_mappings"]
        remote_data = parsed_json["remote_data"]&.map do |item|
          item = item.to_json
          Merge::Hris::RemoteData.from_json(json_object: item)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          first_name: first_name,
          middle_name: middle_name,
          last_name: last_name,
          relationship: relationship,
          employee: employee,
          date_of_birth: date_of_birth,
          gender: gender,
          phone_number: phone_number,
          home_location: home_location,
          is_student: is_student,
          ssn: ssn,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of Dependent to a JSON object
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
        obj.middle_name&.is_a?(String) != false || raise("Passed value for field obj.middle_name is not the expected type, validation failed.")
        obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
        obj.relationship&.is_a?(Merge::Hris::RelationshipEnum) != false || raise("Passed value for field obj.relationship is not the expected type, validation failed.")
        obj.employee&.is_a?(String) != false || raise("Passed value for field obj.employee is not the expected type, validation failed.")
        obj.date_of_birth&.is_a?(DateTime) != false || raise("Passed value for field obj.date_of_birth is not the expected type, validation failed.")
        obj.gender&.is_a?(Merge::Hris::GenderEnum) != false || raise("Passed value for field obj.gender is not the expected type, validation failed.")
        obj.phone_number&.is_a?(String) != false || raise("Passed value for field obj.phone_number is not the expected type, validation failed.")
        obj.home_location&.is_a?(String) != false || raise("Passed value for field obj.home_location is not the expected type, validation failed.")
        obj.is_student&.is_a?(Boolean) != false || raise("Passed value for field obj.is_student is not the expected type, validation failed.")
        obj.ssn&.is_a?(String) != false || raise("Passed value for field obj.ssn is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
