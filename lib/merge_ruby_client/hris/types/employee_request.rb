# frozen_string_literal: true

require_relative "employee_request_company"
require_relative "employee_request_groups_item"
require_relative "employee_request_employments_item"
require_relative "employee_request_home_location"
require_relative "employee_request_work_location"
require_relative "employee_request_manager"
require_relative "employee_request_team"
require_relative "employee_request_pay_group"
require_relative "employee_request_gender"
require_relative "employee_request_ethnicity"
require_relative "employee_request_marital_status"
require "date"
require_relative "employee_request_employment_status"
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
    class EmployeeRequest
      attr_reader :employee_number, :company, :first_name, :last_name, :preferred_name, :display_full_name, :username,
                  :groups, :work_email, :personal_email, :mobile_phone_number, :employments, :home_location, :work_location, :manager, :team, :pay_group, :ssn, :gender, :ethnicity, :marital_status, :date_of_birth, :hire_date, :start_date, :employment_status, :termination_date, :avatar, :integration_params, :linked_account_params, :additional_properties

      # @param employee_number [String] The employee's number that appears in the third-party integration's UI.
      # @param company [Hris::EmployeeRequestCompany] The ID of the employee's company.
      # @param first_name [String] The employee's first name.
      # @param last_name [String] The employee's last name.
      # @param preferred_name [String] The employee's preferred first name.
      # @param display_full_name [String] The employee's full name, to use for display purposes. If a preferred first name is available, the full name will include the preferred first name.
      # @param username [String] The employee's username that appears in the remote UI.
      # @param groups [Array<Hris::EmployeeRequestGroupsItem>]
      # @param work_email [String] The employee's work email.
      # @param personal_email [String] The employee's personal email.
      # @param mobile_phone_number [String] The employee's mobile phone number.
      # @param employments [Array<Hris::EmployeeRequestEmploymentsItem>] Array of `Employment` IDs for this Employee.
      # @param home_location [Hris::EmployeeRequestHomeLocation] The employee's home address.
      # @param work_location [Hris::EmployeeRequestWorkLocation] The employee's work address.
      # @param manager [Hris::EmployeeRequestManager] The employee ID of the employee's manager.
      # @param team [Hris::EmployeeRequestTeam] The employee's team.
      # @param pay_group [Hris::EmployeeRequestPayGroup] The employee's pay group
      # @param ssn [String] The employee's social security number.
      # @param gender [Hris::EmployeeRequestGender] The employee's gender.
      #   - `MALE` - MALE
      #   - `FEMALE` - FEMALE
      #   - `NON-BINARY` - NON-BINARY
      #   - `OTHER` - OTHER
      #   - `PREFER_NOT_TO_DISCLOSE` - PREFER_NOT_TO_DISCLOSE
      # @param ethnicity [Hris::EmployeeRequestEthnicity] The employee's ethnicity.
      #   - `AMERICAN_INDIAN_OR_ALASKA_NATIVE` - AMERICAN_INDIAN_OR_ALASKA_NATIVE
      #   - `ASIAN_OR_INDIAN_SUBCONTINENT` - ASIAN_OR_INDIAN_SUBCONTINENT
      #   - `BLACK_OR_AFRICAN_AMERICAN` - BLACK_OR_AFRICAN_AMERICAN
      #   - `HISPANIC_OR_LATINO` - HISPANIC_OR_LATINO
      #   - `NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER` - NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER
      #   - `TWO_OR_MORE_RACES` - TWO_OR_MORE_RACES
      #   - `WHITE` - WHITE
      #   - `PREFER_NOT_TO_DISCLOSE` - PREFER_NOT_TO_DISCLOSE
      # @param marital_status [Hris::EmployeeRequestMaritalStatus] The employee's filing status as related to marital status.
      #   - `SINGLE` - SINGLE
      #   - `MARRIED_FILING_JOINTLY` - MARRIED_FILING_JOINTLY
      #   - `MARRIED_FILING_SEPARATELY` - MARRIED_FILING_SEPARATELY
      #   - `HEAD_OF_HOUSEHOLD` - HEAD_OF_HOUSEHOLD
      #   - `QUALIFYING_WIDOW_OR_WIDOWER_WITH_DEPENDENT_CHILD` - QUALIFYING_WIDOW_OR_WIDOWER_WITH_DEPENDENT_CHILD
      # @param date_of_birth [DateTime] The employee's date of birth.
      # @param hire_date [DateTime] The date that the employee was hired, usually the day that an offer letter is signed. If an employee has multiple hire dates from previous employments, this represents the most recent hire date. Note: If you're looking for the employee's start date, refer to the start_date field.
      # @param start_date [DateTime] The date that the employee started working. If an employee was rehired, the most recent start date will be returned.
      # @param employment_status [Hris::EmployeeRequestEmploymentStatus] The employment status of the employee.
      #   - `ACTIVE` - ACTIVE
      #   - `PENDING` - PENDING
      #   - `INACTIVE` - INACTIVE
      # @param termination_date [DateTime] The employee's termination date.
      # @param avatar [String] The URL of the employee's avatar image.
      # @param integration_params [Hash{String => String}]
      # @param linked_account_params [Hash{String => String}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Hris::EmployeeRequest]
      def initialize(employee_number: nil, company: nil, first_name: nil, last_name: nil, preferred_name: nil,
                     display_full_name: nil, username: nil, groups: nil, work_email: nil, personal_email: nil, mobile_phone_number: nil, employments: nil, home_location: nil, work_location: nil, manager: nil, team: nil, pay_group: nil, ssn: nil, gender: nil, ethnicity: nil, marital_status: nil, date_of_birth: nil, hire_date: nil, start_date: nil, employment_status: nil, termination_date: nil, avatar: nil, integration_params: nil, linked_account_params: nil, additional_properties: nil)
        # @type [String] The employee's number that appears in the third-party integration's UI.
        @employee_number = employee_number
        # @type [Hris::EmployeeRequestCompany] The ID of the employee's company.
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
        # @type [Array<Hris::EmployeeRequestGroupsItem>]
        @groups = groups
        # @type [String] The employee's work email.
        @work_email = work_email
        # @type [String] The employee's personal email.
        @personal_email = personal_email
        # @type [String] The employee's mobile phone number.
        @mobile_phone_number = mobile_phone_number
        # @type [Array<Hris::EmployeeRequestEmploymentsItem>] Array of `Employment` IDs for this Employee.
        @employments = employments
        # @type [Hris::EmployeeRequestHomeLocation] The employee's home address.
        @home_location = home_location
        # @type [Hris::EmployeeRequestWorkLocation] The employee's work address.
        @work_location = work_location
        # @type [Hris::EmployeeRequestManager] The employee ID of the employee's manager.
        @manager = manager
        # @type [Hris::EmployeeRequestTeam] The employee's team.
        @team = team
        # @type [Hris::EmployeeRequestPayGroup] The employee's pay group
        @pay_group = pay_group
        # @type [String] The employee's social security number.
        @ssn = ssn
        # @type [Hris::EmployeeRequestGender] The employee's gender.
        #   - `MALE` - MALE
        #   - `FEMALE` - FEMALE
        #   - `NON-BINARY` - NON-BINARY
        #   - `OTHER` - OTHER
        #   - `PREFER_NOT_TO_DISCLOSE` - PREFER_NOT_TO_DISCLOSE
        @gender = gender
        # @type [Hris::EmployeeRequestEthnicity] The employee's ethnicity.
        #   - `AMERICAN_INDIAN_OR_ALASKA_NATIVE` - AMERICAN_INDIAN_OR_ALASKA_NATIVE
        #   - `ASIAN_OR_INDIAN_SUBCONTINENT` - ASIAN_OR_INDIAN_SUBCONTINENT
        #   - `BLACK_OR_AFRICAN_AMERICAN` - BLACK_OR_AFRICAN_AMERICAN
        #   - `HISPANIC_OR_LATINO` - HISPANIC_OR_LATINO
        #   - `NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER` - NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER
        #   - `TWO_OR_MORE_RACES` - TWO_OR_MORE_RACES
        #   - `WHITE` - WHITE
        #   - `PREFER_NOT_TO_DISCLOSE` - PREFER_NOT_TO_DISCLOSE
        @ethnicity = ethnicity
        # @type [Hris::EmployeeRequestMaritalStatus] The employee's filing status as related to marital status.
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
        # @type [Hris::EmployeeRequestEmploymentStatus] The employment status of the employee.
        #   - `ACTIVE` - ACTIVE
        #   - `PENDING` - PENDING
        #   - `INACTIVE` - INACTIVE
        @employment_status = employment_status
        # @type [DateTime] The employee's termination date.
        @termination_date = termination_date
        # @type [String] The URL of the employee's avatar image.
        @avatar = avatar
        # @type [Hash{String => String}]
        @integration_params = integration_params
        # @type [Hash{String => String}]
        @linked_account_params = linked_account_params
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of EmployeeRequest
      #
      # @param json_object [JSON]
      # @return [Hris::EmployeeRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        employee_number = struct.employee_number
        if parsed_json["company"].nil?
          company = nil
        else
          company = parsed_json["company"].to_json
          company = Hris::EmployeeRequestCompany.from_json(json_object: company)
        end
        first_name = struct.first_name
        last_name = struct.last_name
        preferred_name = struct.preferred_name
        display_full_name = struct.display_full_name
        username = struct.username
        groups = parsed_json["groups"]&.map do |v|
          v = v.to_json
          Hris::EmployeeRequestGroupsItem.from_json(json_object: v)
        end
        work_email = struct.work_email
        personal_email = struct.personal_email
        mobile_phone_number = struct.mobile_phone_number
        employments = parsed_json["employments"]&.map do |v|
          v = v.to_json
          Hris::EmployeeRequestEmploymentsItem.from_json(json_object: v)
        end
        if parsed_json["home_location"].nil?
          home_location = nil
        else
          home_location = parsed_json["home_location"].to_json
          home_location = Hris::EmployeeRequestHomeLocation.from_json(json_object: home_location)
        end
        if parsed_json["work_location"].nil?
          work_location = nil
        else
          work_location = parsed_json["work_location"].to_json
          work_location = Hris::EmployeeRequestWorkLocation.from_json(json_object: work_location)
        end
        if parsed_json["manager"].nil?
          manager = nil
        else
          manager = parsed_json["manager"].to_json
          manager = Hris::EmployeeRequestManager.from_json(json_object: manager)
        end
        if parsed_json["team"].nil?
          team = nil
        else
          team = parsed_json["team"].to_json
          team = Hris::EmployeeRequestTeam.from_json(json_object: team)
        end
        if parsed_json["pay_group"].nil?
          pay_group = nil
        else
          pay_group = parsed_json["pay_group"].to_json
          pay_group = Hris::EmployeeRequestPayGroup.from_json(json_object: pay_group)
        end
        ssn = struct.ssn
        if parsed_json["gender"].nil?
          gender = nil
        else
          gender = parsed_json["gender"].to_json
          gender = Hris::EmployeeRequestGender.from_json(json_object: gender)
        end
        if parsed_json["ethnicity"].nil?
          ethnicity = nil
        else
          ethnicity = parsed_json["ethnicity"].to_json
          ethnicity = Hris::EmployeeRequestEthnicity.from_json(json_object: ethnicity)
        end
        if parsed_json["marital_status"].nil?
          marital_status = nil
        else
          marital_status = parsed_json["marital_status"].to_json
          marital_status = Hris::EmployeeRequestMaritalStatus.from_json(json_object: marital_status)
        end
        date_of_birth = (DateTime.parse(parsed_json["date_of_birth"]) unless parsed_json["date_of_birth"].nil?)
        hire_date = (DateTime.parse(parsed_json["hire_date"]) unless parsed_json["hire_date"].nil?)
        start_date = (DateTime.parse(parsed_json["start_date"]) unless parsed_json["start_date"].nil?)
        if parsed_json["employment_status"].nil?
          employment_status = nil
        else
          employment_status = parsed_json["employment_status"].to_json
          employment_status = Hris::EmployeeRequestEmploymentStatus.from_json(json_object: employment_status)
        end
        termination_date = (DateTime.parse(parsed_json["termination_date"]) unless parsed_json["termination_date"].nil?)
        avatar = struct.avatar
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        new(employee_number: employee_number, company: company, first_name: first_name, last_name: last_name,
            preferred_name: preferred_name, display_full_name: display_full_name, username: username, groups: groups, work_email: work_email, personal_email: personal_email, mobile_phone_number: mobile_phone_number, employments: employments, home_location: home_location, work_location: work_location, manager: manager, team: team, pay_group: pay_group, ssn: ssn, gender: gender, ethnicity: ethnicity, marital_status: marital_status, date_of_birth: date_of_birth, hire_date: hire_date, start_date: start_date, employment_status: employment_status, termination_date: termination_date, avatar: avatar, integration_params: integration_params, linked_account_params: linked_account_params, additional_properties: struct)
      end

      # Serialize an instance of EmployeeRequest to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
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
          "gender": @gender,
          "ethnicity": @ethnicity,
          "marital_status": @marital_status,
          "date_of_birth": @date_of_birth,
          "hire_date": @hire_date,
          "start_date": @start_date,
          "employment_status": @employment_status,
          "termination_date": @termination_date,
          "avatar": @avatar,
          "integration_params": @integration_params,
          "linked_account_params": @linked_account_params
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.employee_number&.is_a?(String) != false || raise("Passed value for field obj.employee_number is not the expected type, validation failed.")
        obj.company.nil? || Hris::EmployeeRequestCompany.validate_raw(obj: obj.company)
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
        obj.home_location.nil? || Hris::EmployeeRequestHomeLocation.validate_raw(obj: obj.home_location)
        obj.work_location.nil? || Hris::EmployeeRequestWorkLocation.validate_raw(obj: obj.work_location)
        obj.manager.nil? || Hris::EmployeeRequestManager.validate_raw(obj: obj.manager)
        obj.team.nil? || Hris::EmployeeRequestTeam.validate_raw(obj: obj.team)
        obj.pay_group.nil? || Hris::EmployeeRequestPayGroup.validate_raw(obj: obj.pay_group)
        obj.ssn&.is_a?(String) != false || raise("Passed value for field obj.ssn is not the expected type, validation failed.")
        obj.gender.nil? || Hris::EmployeeRequestGender.validate_raw(obj: obj.gender)
        obj.ethnicity.nil? || Hris::EmployeeRequestEthnicity.validate_raw(obj: obj.ethnicity)
        obj.marital_status.nil? || Hris::EmployeeRequestMaritalStatus.validate_raw(obj: obj.marital_status)
        obj.date_of_birth&.is_a?(DateTime) != false || raise("Passed value for field obj.date_of_birth is not the expected type, validation failed.")
        obj.hire_date&.is_a?(DateTime) != false || raise("Passed value for field obj.hire_date is not the expected type, validation failed.")
        obj.start_date&.is_a?(DateTime) != false || raise("Passed value for field obj.start_date is not the expected type, validation failed.")
        obj.employment_status.nil? || Hris::EmployeeRequestEmploymentStatus.validate_raw(obj: obj.employment_status)
        obj.termination_date&.is_a?(DateTime) != false || raise("Passed value for field obj.termination_date is not the expected type, validation failed.")
        obj.avatar&.is_a?(String) != false || raise("Passed value for field obj.avatar is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
