# frozen_string_literal: true

require_relative "employee_company"
require_relative "employee_groups_item"
require_relative "employee_employments_item"
require_relative "employee_home_location"
require_relative "employee_work_location"
require_relative "employee_manager"
require_relative "employee_team"
require_relative "employee_pay_group"
require_relative "gender_enum"
require_relative "ethnicity_enum"
require_relative "marital_status_enum"
require "date"
require_relative "employment_status_enum"
require_relative "remote_data"
require "json"

module Merge
  module Hris
    # # The Employee Object
    #
    # ### Description
    #
    # The `Employee` object is used to represent any person who has been employed by a company.
    #
    # ### Usage Example
    #
    # Fetch from the `LIST Employee` endpoint and filter by `ID` to show all employees.
    class Employee
      attr_reader :id, :remote_id, :employee_number, :company, :first_name, :last_name, :preferred_name,
                  :display_full_name, :username, :groups, :work_email, :personal_email, :mobile_phone_number, :employments, :home_location, :work_location, :manager, :team, :pay_group, :ssn, :gender, :ethnicity, :marital_status, :date_of_birth, :hire_date, :start_date, :remote_created_at, :employment_status, :termination_date, :avatar, :custom_fields, :remote_was_deleted, :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param employee_number [String] The employee's number that appears in the third-party integration's UI.
      # @param company [Hris::EmployeeCompany] The ID of the employee's company.
      # @param first_name [String] The employee's first name.
      # @param last_name [String] The employee's last name.
      # @param preferred_name [String] The employee's preferred first name.
      # @param display_full_name [String] The employee's full name, to use for display purposes. If a preferred first name is available, the full name will include the preferred first name.
      # @param username [String] The employee's username that appears in the remote UI.
      # @param groups [Array<Hris::EmployeeGroupsItem>]
      # @param work_email [String] The employee's work email.
      # @param personal_email [String] The employee's personal email.
      # @param mobile_phone_number [String] The employee's mobile phone number.
      # @param employments [Array<Hris::EmployeeEmploymentsItem>] Array of `Employment` IDs for this Employee.
      # @param home_location [Hris::EmployeeHomeLocation] The employee's home address.
      # @param work_location [Hris::EmployeeWorkLocation] The employee's work address.
      # @param manager [Hris::EmployeeManager] The employee ID of the employee's manager.
      # @param team [Hris::EmployeeTeam] The employee's team.
      # @param pay_group [Hris::EmployeePayGroup] The employee's pay group
      # @param ssn [String] The employee's social security number.
      # @param gender [GENDER_ENUM] The employee's gender.
      #   - `MALE` - MALE
      #   - `FEMALE` - FEMALE
      #   - `NON-BINARY` - NON-BINARY
      #   - `OTHER` - OTHER
      #   - `PREFER_NOT_TO_DISCLOSE` - PREFER_NOT_TO_DISCLOSE
      # @param ethnicity [ETHNICITY_ENUM] The employee's ethnicity.
      #   - `AMERICAN_INDIAN_OR_ALASKA_NATIVE` - AMERICAN_INDIAN_OR_ALASKA_NATIVE
      #   - `ASIAN_OR_INDIAN_SUBCONTINENT` - ASIAN_OR_INDIAN_SUBCONTINENT
      #   - `BLACK_OR_AFRICAN_AMERICAN` - BLACK_OR_AFRICAN_AMERICAN
      #   - `HISPANIC_OR_LATINO` - HISPANIC_OR_LATINO
      #   - `NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER` - NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER
      #   - `TWO_OR_MORE_RACES` - TWO_OR_MORE_RACES
      #   - `WHITE` - WHITE
      #   - `PREFER_NOT_TO_DISCLOSE` - PREFER_NOT_TO_DISCLOSE
      # @param marital_status [MARITAL_STATUS_ENUM] The employee's filing status as related to marital status.
      #   - `SINGLE` - SINGLE
      #   - `MARRIED_FILING_JOINTLY` - MARRIED_FILING_JOINTLY
      #   - `MARRIED_FILING_SEPARATELY` - MARRIED_FILING_SEPARATELY
      #   - `HEAD_OF_HOUSEHOLD` - HEAD_OF_HOUSEHOLD
      #   - `QUALIFYING_WIDOW_OR_WIDOWER_WITH_DEPENDENT_CHILD` - QUALIFYING_WIDOW_OR_WIDOWER_WITH_DEPENDENT_CHILD
      # @param date_of_birth [DateTime] The employee's date of birth.
      # @param hire_date [DateTime] The date that the employee was hired, usually the day that an offer letter is signed. If an employee has multiple hire dates from previous employments, this represents the most recent hire date. Note: If you're looking for the employee's start date, refer to the start_date field.
      # @param start_date [DateTime] The date that the employee started working. If an employee was rehired, the most recent start date will be returned.
      # @param remote_created_at [DateTime] When the third party's employee was created.
      # @param employment_status [EMPLOYMENT_STATUS_ENUM] The employment status of the employee.
      #   - `ACTIVE` - ACTIVE
      #   - `PENDING` - PENDING
      #   - `INACTIVE` - INACTIVE
      # @param termination_date [DateTime] The employee's termination date.
      # @param avatar [String] The URL of the employee's avatar image.
      # @param custom_fields [Hash{String => String}] Custom fields configured for a given model.
      # @param remote_was_deleted [Boolean]
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Hris::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Hris::Employee]
      def initialize(id: nil, remote_id: nil, employee_number: nil, company: nil, first_name: nil, last_name: nil,
                     preferred_name: nil, display_full_name: nil, username: nil, groups: nil, work_email: nil, personal_email: nil, mobile_phone_number: nil, employments: nil, home_location: nil, work_location: nil, manager: nil, team: nil, pay_group: nil, ssn: nil, gender: nil, ethnicity: nil, marital_status: nil, date_of_birth: nil, hire_date: nil, start_date: nil, remote_created_at: nil, employment_status: nil, termination_date: nil, avatar: nil, custom_fields: nil, remote_was_deleted: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [String] The employee's number that appears in the third-party integration's UI.
        @employee_number = employee_number
        # @type [Hris::EmployeeCompany] The ID of the employee's company.
        @company = company
        # @type [String] The employee's first name.
        @first_name = first_name
        # @type [String] The employee's last name.
        @last_name = last_name
        # @type [String] The employee's preferred first name.
        @preferred_name = preferred_name
        # @type [String] The employee's full name, to use for display purposes. If a preferred first name is available, the full name will include the preferred first name.
        @display_full_name = display_full_name
        # @type [String] The employee's username that appears in the remote UI.
        @username = username
        # @type [Array<Hris::EmployeeGroupsItem>]
        @groups = groups
        # @type [String] The employee's work email.
        @work_email = work_email
        # @type [String] The employee's personal email.
        @personal_email = personal_email
        # @type [String] The employee's mobile phone number.
        @mobile_phone_number = mobile_phone_number
        # @type [Array<Hris::EmployeeEmploymentsItem>] Array of `Employment` IDs for this Employee.
        @employments = employments
        # @type [Hris::EmployeeHomeLocation] The employee's home address.
        @home_location = home_location
        # @type [Hris::EmployeeWorkLocation] The employee's work address.
        @work_location = work_location
        # @type [Hris::EmployeeManager] The employee ID of the employee's manager.
        @manager = manager
        # @type [Hris::EmployeeTeam] The employee's team.
        @team = team
        # @type [Hris::EmployeePayGroup] The employee's pay group
        @pay_group = pay_group
        # @type [String] The employee's social security number.
        @ssn = ssn
        # @type [GENDER_ENUM] The employee's gender.
        #   - `MALE` - MALE
        #   - `FEMALE` - FEMALE
        #   - `NON-BINARY` - NON-BINARY
        #   - `OTHER` - OTHER
        #   - `PREFER_NOT_TO_DISCLOSE` - PREFER_NOT_TO_DISCLOSE
        @gender = gender
        # @type [ETHNICITY_ENUM] The employee's ethnicity.
        #   - `AMERICAN_INDIAN_OR_ALASKA_NATIVE` - AMERICAN_INDIAN_OR_ALASKA_NATIVE
        #   - `ASIAN_OR_INDIAN_SUBCONTINENT` - ASIAN_OR_INDIAN_SUBCONTINENT
        #   - `BLACK_OR_AFRICAN_AMERICAN` - BLACK_OR_AFRICAN_AMERICAN
        #   - `HISPANIC_OR_LATINO` - HISPANIC_OR_LATINO
        #   - `NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER` - NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER
        #   - `TWO_OR_MORE_RACES` - TWO_OR_MORE_RACES
        #   - `WHITE` - WHITE
        #   - `PREFER_NOT_TO_DISCLOSE` - PREFER_NOT_TO_DISCLOSE
        @ethnicity = ethnicity
        # @type [MARITAL_STATUS_ENUM] The employee's filing status as related to marital status.
        #   - `SINGLE` - SINGLE
        #   - `MARRIED_FILING_JOINTLY` - MARRIED_FILING_JOINTLY
        #   - `MARRIED_FILING_SEPARATELY` - MARRIED_FILING_SEPARATELY
        #   - `HEAD_OF_HOUSEHOLD` - HEAD_OF_HOUSEHOLD
        #   - `QUALIFYING_WIDOW_OR_WIDOWER_WITH_DEPENDENT_CHILD` - QUALIFYING_WIDOW_OR_WIDOWER_WITH_DEPENDENT_CHILD
        @marital_status = marital_status
        # @type [DateTime] The employee's date of birth.
        @date_of_birth = date_of_birth
        # @type [DateTime] The date that the employee was hired, usually the day that an offer letter is signed. If an employee has multiple hire dates from previous employments, this represents the most recent hire date. Note: If you're looking for the employee's start date, refer to the start_date field.
        @hire_date = hire_date
        # @type [DateTime] The date that the employee started working. If an employee was rehired, the most recent start date will be returned.
        @start_date = start_date
        # @type [DateTime] When the third party's employee was created.
        @remote_created_at = remote_created_at
        # @type [EMPLOYMENT_STATUS_ENUM] The employment status of the employee.
        #   - `ACTIVE` - ACTIVE
        #   - `PENDING` - PENDING
        #   - `INACTIVE` - INACTIVE
        @employment_status = employment_status
        # @type [DateTime] The employee's termination date.
        @termination_date = termination_date
        # @type [String] The URL of the employee's avatar image.
        @avatar = avatar
        # @type [Hash{String => String}] Custom fields configured for a given model.
        @custom_fields = custom_fields
        # @type [Boolean]
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

      # Deserialize a JSON object to an instance of Employee
      #
      # @param json_object [JSON]
      # @return [Hris::Employee]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        remote_id = struct.remote_id
        employee_number = struct.employee_number
        if parsed_json["company"].nil?
          company = nil
        else
          company = parsed_json["company"].to_json
          company = Hris::EmployeeCompany.from_json(json_object: company)
        end
        first_name = struct.first_name
        last_name = struct.last_name
        preferred_name = struct.preferred_name
        display_full_name = struct.display_full_name
        username = struct.username
        groups = parsed_json["groups"]&.map do |v|
          v = v.to_json
          Hris::EmployeeGroupsItem.from_json(json_object: v)
        end
        work_email = struct.work_email
        personal_email = struct.personal_email
        mobile_phone_number = struct.mobile_phone_number
        employments = parsed_json["employments"]&.map do |v|
          v = v.to_json
          Hris::EmployeeEmploymentsItem.from_json(json_object: v)
        end
        if parsed_json["home_location"].nil?
          home_location = nil
        else
          home_location = parsed_json["home_location"].to_json
          home_location = Hris::EmployeeHomeLocation.from_json(json_object: home_location)
        end
        if parsed_json["work_location"].nil?
          work_location = nil
        else
          work_location = parsed_json["work_location"].to_json
          work_location = Hris::EmployeeWorkLocation.from_json(json_object: work_location)
        end
        if parsed_json["manager"].nil?
          manager = nil
        else
          manager = parsed_json["manager"].to_json
          manager = Hris::EmployeeManager.from_json(json_object: manager)
        end
        if parsed_json["team"].nil?
          team = nil
        else
          team = parsed_json["team"].to_json
          team = Hris::EmployeeTeam.from_json(json_object: team)
        end
        if parsed_json["pay_group"].nil?
          pay_group = nil
        else
          pay_group = parsed_json["pay_group"].to_json
          pay_group = Hris::EmployeePayGroup.from_json(json_object: pay_group)
        end
        ssn = struct.ssn
        gender = Hris::GENDER_ENUM.key(parsed_json["gender"]) || parsed_json["gender"]
        ethnicity = Hris::ETHNICITY_ENUM.key(parsed_json["ethnicity"]) || parsed_json["ethnicity"]
        marital_status = Hris::MARITAL_STATUS_ENUM.key(parsed_json["marital_status"]) || parsed_json["marital_status"]
        date_of_birth = (DateTime.parse(parsed_json["date_of_birth"]) unless parsed_json["date_of_birth"].nil?)
        hire_date = (DateTime.parse(parsed_json["hire_date"]) unless parsed_json["hire_date"].nil?)
        start_date = (DateTime.parse(parsed_json["start_date"]) unless parsed_json["start_date"].nil?)
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        employment_status = Hris::EMPLOYMENT_STATUS_ENUM.key(parsed_json["employment_status"]) || parsed_json["employment_status"]
        termination_date = (DateTime.parse(parsed_json["termination_date"]) unless parsed_json["termination_date"].nil?)
        avatar = struct.avatar
        custom_fields = struct.custom_fields
        remote_was_deleted = struct.remote_was_deleted
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        field_mappings = struct.field_mappings
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Hris::RemoteData.from_json(json_object: v)
        end
        new(id: id, remote_id: remote_id, employee_number: employee_number, company: company, first_name: first_name,
            last_name: last_name, preferred_name: preferred_name, display_full_name: display_full_name, username: username, groups: groups, work_email: work_email, personal_email: personal_email, mobile_phone_number: mobile_phone_number, employments: employments, home_location: home_location, work_location: work_location, manager: manager, team: team, pay_group: pay_group, ssn: ssn, gender: gender, ethnicity: ethnicity, marital_status: marital_status, date_of_birth: date_of_birth, hire_date: hire_date, start_date: start_date, remote_created_at: remote_created_at, employment_status: employment_status, termination_date: termination_date, avatar: avatar, custom_fields: custom_fields, remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end

      # Serialize an instance of Employee to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "remote_id": @remote_id,
          "employee_number": @employee_number,
          "company": @company,
          "first_name": @first_name,
          "last_name": @last_name,
          "preferred_name": @preferred_name,
          "display_full_name": @display_full_name,
          "username": @username,
          "groups": @groups,
          "work_email": @work_email,
          "personal_email": @personal_email,
          "mobile_phone_number": @mobile_phone_number,
          "employments": @employments,
          "home_location": @home_location,
          "work_location": @work_location,
          "manager": @manager,
          "team": @team,
          "pay_group": @pay_group,
          "ssn": @ssn,
          "gender": Hris::GENDER_ENUM[@gender] || @gender,
          "ethnicity": Hris::ETHNICITY_ENUM[@ethnicity] || @ethnicity,
          "marital_status": Hris::MARITAL_STATUS_ENUM[@marital_status] || @marital_status,
          "date_of_birth": @date_of_birth,
          "hire_date": @hire_date,
          "start_date": @start_date,
          "remote_created_at": @remote_created_at,
          "employment_status": Hris::EMPLOYMENT_STATUS_ENUM[@employment_status] || @employment_status,
          "termination_date": @termination_date,
          "avatar": @avatar,
          "custom_fields": @custom_fields,
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
        obj.employee_number&.is_a?(String) != false || raise("Passed value for field obj.employee_number is not the expected type, validation failed.")
        obj.company.nil? || Hris::EmployeeCompany.validate_raw(obj: obj.company)
        obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
        obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
        obj.preferred_name&.is_a?(String) != false || raise("Passed value for field obj.preferred_name is not the expected type, validation failed.")
        obj.display_full_name&.is_a?(String) != false || raise("Passed value for field obj.display_full_name is not the expected type, validation failed.")
        obj.username&.is_a?(String) != false || raise("Passed value for field obj.username is not the expected type, validation failed.")
        obj.groups&.is_a?(Array) != false || raise("Passed value for field obj.groups is not the expected type, validation failed.")
        obj.work_email&.is_a?(String) != false || raise("Passed value for field obj.work_email is not the expected type, validation failed.")
        obj.personal_email&.is_a?(String) != false || raise("Passed value for field obj.personal_email is not the expected type, validation failed.")
        obj.mobile_phone_number&.is_a?(String) != false || raise("Passed value for field obj.mobile_phone_number is not the expected type, validation failed.")
        obj.employments&.is_a?(Array) != false || raise("Passed value for field obj.employments is not the expected type, validation failed.")
        obj.home_location.nil? || Hris::EmployeeHomeLocation.validate_raw(obj: obj.home_location)
        obj.work_location.nil? || Hris::EmployeeWorkLocation.validate_raw(obj: obj.work_location)
        obj.manager.nil? || Hris::EmployeeManager.validate_raw(obj: obj.manager)
        obj.team.nil? || Hris::EmployeeTeam.validate_raw(obj: obj.team)
        obj.pay_group.nil? || Hris::EmployeePayGroup.validate_raw(obj: obj.pay_group)
        obj.ssn&.is_a?(String) != false || raise("Passed value for field obj.ssn is not the expected type, validation failed.")
        obj.gender&.is_a?(Hris::GENDER_ENUM) != false || raise("Passed value for field obj.gender is not the expected type, validation failed.")
        obj.ethnicity&.is_a?(Hris::ETHNICITY_ENUM) != false || raise("Passed value for field obj.ethnicity is not the expected type, validation failed.")
        obj.marital_status&.is_a?(Hris::MARITAL_STATUS_ENUM) != false || raise("Passed value for field obj.marital_status is not the expected type, validation failed.")
        obj.date_of_birth&.is_a?(DateTime) != false || raise("Passed value for field obj.date_of_birth is not the expected type, validation failed.")
        obj.hire_date&.is_a?(DateTime) != false || raise("Passed value for field obj.hire_date is not the expected type, validation failed.")
        obj.start_date&.is_a?(DateTime) != false || raise("Passed value for field obj.start_date is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.employment_status&.is_a?(Hris::EMPLOYMENT_STATUS_ENUM) != false || raise("Passed value for field obj.employment_status is not the expected type, validation failed.")
        obj.termination_date&.is_a?(DateTime) != false || raise("Passed value for field obj.termination_date is not the expected type, validation failed.")
        obj.avatar&.is_a?(String) != false || raise("Passed value for field obj.avatar is not the expected type, validation failed.")
        obj.custom_fields&.is_a?(Hash) != false || raise("Passed value for field obj.custom_fields is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
