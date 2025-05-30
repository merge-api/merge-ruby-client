# frozen_string_literal: true

require_relative "employee_request_company"
require_relative "employee_request_groups_item"
require_relative "employee_request_employments_item"
require_relative "employee_request_home_location"
require_relative "employee_request_work_location"
require_relative "employee_request_manager"
require_relative "employee_request_team"
require_relative "employee_request_pay_group"
require_relative "gender_enum"
require_relative "ethnicity_enum"
require_relative "marital_status_enum"
require "date"
require_relative "employment_status_enum"
require "ostruct"
require "json"

module Merge
  module Hris
    # # The Employee Object
    #  ### Description
    #  The `Employee` object is used to represent any person who has been employed by a
    #  company. By default, it returns all employees. To filter for only active
    #  employees, set the `employment_status` query parameter to `ACTIVE`.
    #  ### Usage Example
    #  Fetch from the `LIST Employee` endpoint and filter by `ID` to show all
    #  employees.
    class EmployeeRequest
      # @return [String] The employee's number that appears in the third-party integration's UI.
      attr_reader :employee_number
      # @return [Merge::Hris::EmployeeRequestCompany] The ID of the employee's company.
      attr_reader :company
      # @return [String] The employee's first name.
      attr_reader :first_name
      # @return [String] The employee's last name.
      attr_reader :last_name
      # @return [String] The employee's preferred first name.
      attr_reader :preferred_name
      # @return [String] The employee's full name, to use for display purposes. If a preferred first name
      #  is available, the full name will include the preferred first name.
      attr_reader :display_full_name
      # @return [String] The employee's username that appears in the remote UI.
      attr_reader :username
      # @return [Array<Merge::Hris::EmployeeRequestGroupsItem>]
      attr_reader :groups
      # @return [String] The employee's work email.
      attr_reader :work_email
      # @return [String] The employee's personal email.
      attr_reader :personal_email
      # @return [String] The employee's mobile phone number.
      attr_reader :mobile_phone_number
      # @return [Array<Merge::Hris::EmployeeRequestEmploymentsItem>] Array of `Employment` IDs for this Employee.
      attr_reader :employments
      # @return [Merge::Hris::EmployeeRequestHomeLocation] The employee's home address.
      attr_reader :home_location
      # @return [Merge::Hris::EmployeeRequestWorkLocation] The employee's work address.
      attr_reader :work_location
      # @return [Merge::Hris::EmployeeRequestManager] The employee ID of the employee's manager.
      attr_reader :manager
      # @return [Merge::Hris::EmployeeRequestTeam] The employee's team.
      attr_reader :team
      # @return [Merge::Hris::EmployeeRequestPayGroup] The employee's pay group
      attr_reader :pay_group
      # @return [String] The employee's social security number.
      attr_reader :ssn
      # @return [Merge::Hris::GenderEnum] The employee's gender.
      #  * `MALE` - MALE
      #  * `FEMALE` - FEMALE
      #  * `NON-BINARY` - NON-BINARY
      #  * `OTHER` - OTHER
      #  * `PREFER_NOT_TO_DISCLOSE` - PREFER_NOT_TO_DISCLOSE
      attr_reader :gender
      # @return [Merge::Hris::EthnicityEnum] The employee's ethnicity.
      #  * `AMERICAN_INDIAN_OR_ALASKA_NATIVE` - AMERICAN_INDIAN_OR_ALASKA_NATIVE
      #  * `ASIAN_OR_INDIAN_SUBCONTINENT` - ASIAN_OR_INDIAN_SUBCONTINENT
      #  * `BLACK_OR_AFRICAN_AMERICAN` - BLACK_OR_AFRICAN_AMERICAN
      #  * `HISPANIC_OR_LATINO` - HISPANIC_OR_LATINO
      #  * `NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER` -
      #  NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER
      #  * `TWO_OR_MORE_RACES` - TWO_OR_MORE_RACES
      #  * `WHITE` - WHITE
      #  * `PREFER_NOT_TO_DISCLOSE` - PREFER_NOT_TO_DISCLOSE
      attr_reader :ethnicity
      # @return [Merge::Hris::MaritalStatusEnum] The employee's filing status as related to marital status.
      #  * `SINGLE` - SINGLE
      #  * `MARRIED_FILING_JOINTLY` - MARRIED_FILING_JOINTLY
      #  * `MARRIED_FILING_SEPARATELY` - MARRIED_FILING_SEPARATELY
      #  * `HEAD_OF_HOUSEHOLD` - HEAD_OF_HOUSEHOLD
      #  * `QUALIFYING_WIDOW_OR_WIDOWER_WITH_DEPENDENT_CHILD` -
      #  QUALIFYING_WIDOW_OR_WIDOWER_WITH_DEPENDENT_CHILD
      attr_reader :marital_status
      # @return [DateTime] The employee's date of birth.
      attr_reader :date_of_birth
      # @return [DateTime] The date that the employee was hired, usually the day that an offer letter is
      #  signed. If an employee has multiple hire dates from previous employments, this
      #  represents the most recent hire date. Note: If you're looking for the employee's
      #  start date, refer to the start_date field.
      attr_reader :hire_date
      # @return [DateTime] The date that the employee started working. If an employee was rehired, the most
      #  recent start date will be returned.
      attr_reader :start_date
      # @return [Merge::Hris::EmploymentStatusEnum] The employment status of the employee.
      #  * `ACTIVE` - ACTIVE
      #  * `PENDING` - PENDING
      #  * `INACTIVE` - INACTIVE
      attr_reader :employment_status
      # @return [DateTime] The employee's termination date.
      attr_reader :termination_date
      # @return [String] The URL of the employee's avatar image.
      attr_reader :avatar
      # @return [Hash{String => Object}]
      attr_reader :integration_params
      # @return [Hash{String => Object}]
      attr_reader :linked_account_params
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param employee_number [String] The employee's number that appears in the third-party integration's UI.
      # @param company [Merge::Hris::EmployeeRequestCompany] The ID of the employee's company.
      # @param first_name [String] The employee's first name.
      # @param last_name [String] The employee's last name.
      # @param preferred_name [String] The employee's preferred first name.
      # @param display_full_name [String] The employee's full name, to use for display purposes. If a preferred first name
      #  is available, the full name will include the preferred first name.
      # @param username [String] The employee's username that appears in the remote UI.
      # @param groups [Array<Merge::Hris::EmployeeRequestGroupsItem>]
      # @param work_email [String] The employee's work email.
      # @param personal_email [String] The employee's personal email.
      # @param mobile_phone_number [String] The employee's mobile phone number.
      # @param employments [Array<Merge::Hris::EmployeeRequestEmploymentsItem>] Array of `Employment` IDs for this Employee.
      # @param home_location [Merge::Hris::EmployeeRequestHomeLocation] The employee's home address.
      # @param work_location [Merge::Hris::EmployeeRequestWorkLocation] The employee's work address.
      # @param manager [Merge::Hris::EmployeeRequestManager] The employee ID of the employee's manager.
      # @param team [Merge::Hris::EmployeeRequestTeam] The employee's team.
      # @param pay_group [Merge::Hris::EmployeeRequestPayGroup] The employee's pay group
      # @param ssn [String] The employee's social security number.
      # @param gender [Merge::Hris::GenderEnum] The employee's gender.
      #  * `MALE` - MALE
      #  * `FEMALE` - FEMALE
      #  * `NON-BINARY` - NON-BINARY
      #  * `OTHER` - OTHER
      #  * `PREFER_NOT_TO_DISCLOSE` - PREFER_NOT_TO_DISCLOSE
      # @param ethnicity [Merge::Hris::EthnicityEnum] The employee's ethnicity.
      #  * `AMERICAN_INDIAN_OR_ALASKA_NATIVE` - AMERICAN_INDIAN_OR_ALASKA_NATIVE
      #  * `ASIAN_OR_INDIAN_SUBCONTINENT` - ASIAN_OR_INDIAN_SUBCONTINENT
      #  * `BLACK_OR_AFRICAN_AMERICAN` - BLACK_OR_AFRICAN_AMERICAN
      #  * `HISPANIC_OR_LATINO` - HISPANIC_OR_LATINO
      #  * `NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER` -
      #  NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER
      #  * `TWO_OR_MORE_RACES` - TWO_OR_MORE_RACES
      #  * `WHITE` - WHITE
      #  * `PREFER_NOT_TO_DISCLOSE` - PREFER_NOT_TO_DISCLOSE
      # @param marital_status [Merge::Hris::MaritalStatusEnum] The employee's filing status as related to marital status.
      #  * `SINGLE` - SINGLE
      #  * `MARRIED_FILING_JOINTLY` - MARRIED_FILING_JOINTLY
      #  * `MARRIED_FILING_SEPARATELY` - MARRIED_FILING_SEPARATELY
      #  * `HEAD_OF_HOUSEHOLD` - HEAD_OF_HOUSEHOLD
      #  * `QUALIFYING_WIDOW_OR_WIDOWER_WITH_DEPENDENT_CHILD` -
      #  QUALIFYING_WIDOW_OR_WIDOWER_WITH_DEPENDENT_CHILD
      # @param date_of_birth [DateTime] The employee's date of birth.
      # @param hire_date [DateTime] The date that the employee was hired, usually the day that an offer letter is
      #  signed. If an employee has multiple hire dates from previous employments, this
      #  represents the most recent hire date. Note: If you're looking for the employee's
      #  start date, refer to the start_date field.
      # @param start_date [DateTime] The date that the employee started working. If an employee was rehired, the most
      #  recent start date will be returned.
      # @param employment_status [Merge::Hris::EmploymentStatusEnum] The employment status of the employee.
      #  * `ACTIVE` - ACTIVE
      #  * `PENDING` - PENDING
      #  * `INACTIVE` - INACTIVE
      # @param termination_date [DateTime] The employee's termination date.
      # @param avatar [String] The URL of the employee's avatar image.
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Hris::EmployeeRequest]
      def initialize(employee_number: OMIT, company: OMIT, first_name: OMIT, last_name: OMIT, preferred_name: OMIT,
                     display_full_name: OMIT, username: OMIT, groups: OMIT, work_email: OMIT, personal_email: OMIT, mobile_phone_number: OMIT, employments: OMIT, home_location: OMIT, work_location: OMIT, manager: OMIT, team: OMIT, pay_group: OMIT, ssn: OMIT, gender: OMIT, ethnicity: OMIT, marital_status: OMIT, date_of_birth: OMIT, hire_date: OMIT, start_date: OMIT, employment_status: OMIT, termination_date: OMIT, avatar: OMIT, integration_params: OMIT, linked_account_params: OMIT, additional_properties: nil)
        @employee_number = employee_number if employee_number != OMIT
        @company = company if company != OMIT
        @first_name = first_name if first_name != OMIT
        @last_name = last_name if last_name != OMIT
        @preferred_name = preferred_name if preferred_name != OMIT
        @display_full_name = display_full_name if display_full_name != OMIT
        @username = username if username != OMIT
        @groups = groups if groups != OMIT
        @work_email = work_email if work_email != OMIT
        @personal_email = personal_email if personal_email != OMIT
        @mobile_phone_number = mobile_phone_number if mobile_phone_number != OMIT
        @employments = employments if employments != OMIT
        @home_location = home_location if home_location != OMIT
        @work_location = work_location if work_location != OMIT
        @manager = manager if manager != OMIT
        @team = team if team != OMIT
        @pay_group = pay_group if pay_group != OMIT
        @ssn = ssn if ssn != OMIT
        @gender = gender if gender != OMIT
        @ethnicity = ethnicity if ethnicity != OMIT
        @marital_status = marital_status if marital_status != OMIT
        @date_of_birth = date_of_birth if date_of_birth != OMIT
        @hire_date = hire_date if hire_date != OMIT
        @start_date = start_date if start_date != OMIT
        @employment_status = employment_status if employment_status != OMIT
        @termination_date = termination_date if termination_date != OMIT
        @avatar = avatar if avatar != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "employee_number": employee_number,
          "company": company,
          "first_name": first_name,
          "last_name": last_name,
          "preferred_name": preferred_name,
          "display_full_name": display_full_name,
          "username": username,
          "groups": groups,
          "work_email": work_email,
          "personal_email": personal_email,
          "mobile_phone_number": mobile_phone_number,
          "employments": employments,
          "home_location": home_location,
          "work_location": work_location,
          "manager": manager,
          "team": team,
          "pay_group": pay_group,
          "ssn": ssn,
          "gender": gender,
          "ethnicity": ethnicity,
          "marital_status": marital_status,
          "date_of_birth": date_of_birth,
          "hire_date": hire_date,
          "start_date": start_date,
          "employment_status": employment_status,
          "termination_date": termination_date,
          "avatar": avatar,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of EmployeeRequest
      #
      # @param json_object [String]
      # @return [Merge::Hris::EmployeeRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        employee_number = parsed_json["employee_number"]
        if parsed_json["company"].nil?
          company = nil
        else
          company = parsed_json["company"].to_json
          company = Merge::Hris::EmployeeRequestCompany.from_json(json_object: company)
        end
        first_name = parsed_json["first_name"]
        last_name = parsed_json["last_name"]
        preferred_name = parsed_json["preferred_name"]
        display_full_name = parsed_json["display_full_name"]
        username = parsed_json["username"]
        groups = parsed_json["groups"]&.map do |item|
          item = item.to_json
          Merge::Hris::EmployeeRequestGroupsItem.from_json(json_object: item)
        end
        work_email = parsed_json["work_email"]
        personal_email = parsed_json["personal_email"]
        mobile_phone_number = parsed_json["mobile_phone_number"]
        employments = parsed_json["employments"]&.map do |item|
          item = item.to_json
          Merge::Hris::EmployeeRequestEmploymentsItem.from_json(json_object: item)
        end
        if parsed_json["home_location"].nil?
          home_location = nil
        else
          home_location = parsed_json["home_location"].to_json
          home_location = Merge::Hris::EmployeeRequestHomeLocation.from_json(json_object: home_location)
        end
        if parsed_json["work_location"].nil?
          work_location = nil
        else
          work_location = parsed_json["work_location"].to_json
          work_location = Merge::Hris::EmployeeRequestWorkLocation.from_json(json_object: work_location)
        end
        if parsed_json["manager"].nil?
          manager = nil
        else
          manager = parsed_json["manager"].to_json
          manager = Merge::Hris::EmployeeRequestManager.from_json(json_object: manager)
        end
        if parsed_json["team"].nil?
          team = nil
        else
          team = parsed_json["team"].to_json
          team = Merge::Hris::EmployeeRequestTeam.from_json(json_object: team)
        end
        if parsed_json["pay_group"].nil?
          pay_group = nil
        else
          pay_group = parsed_json["pay_group"].to_json
          pay_group = Merge::Hris::EmployeeRequestPayGroup.from_json(json_object: pay_group)
        end
        ssn = parsed_json["ssn"]
        gender = parsed_json["gender"]
        ethnicity = parsed_json["ethnicity"]
        marital_status = parsed_json["marital_status"]
        date_of_birth = (DateTime.parse(parsed_json["date_of_birth"]) unless parsed_json["date_of_birth"].nil?)
        hire_date = (DateTime.parse(parsed_json["hire_date"]) unless parsed_json["hire_date"].nil?)
        start_date = (DateTime.parse(parsed_json["start_date"]) unless parsed_json["start_date"].nil?)
        employment_status = parsed_json["employment_status"]
        termination_date = (DateTime.parse(parsed_json["termination_date"]) unless parsed_json["termination_date"].nil?)
        avatar = parsed_json["avatar"]
        integration_params = parsed_json["integration_params"]
        linked_account_params = parsed_json["linked_account_params"]
        new(
          employee_number: employee_number,
          company: company,
          first_name: first_name,
          last_name: last_name,
          preferred_name: preferred_name,
          display_full_name: display_full_name,
          username: username,
          groups: groups,
          work_email: work_email,
          personal_email: personal_email,
          mobile_phone_number: mobile_phone_number,
          employments: employments,
          home_location: home_location,
          work_location: work_location,
          manager: manager,
          team: team,
          pay_group: pay_group,
          ssn: ssn,
          gender: gender,
          ethnicity: ethnicity,
          marital_status: marital_status,
          date_of_birth: date_of_birth,
          hire_date: hire_date,
          start_date: start_date,
          employment_status: employment_status,
          termination_date: termination_date,
          avatar: avatar,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          additional_properties: struct
        )
      end

      # Serialize an instance of EmployeeRequest to a JSON object
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
        obj.employee_number&.is_a?(String) != false || raise("Passed value for field obj.employee_number is not the expected type, validation failed.")
        obj.company.nil? || Merge::Hris::EmployeeRequestCompany.validate_raw(obj: obj.company)
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
        obj.home_location.nil? || Merge::Hris::EmployeeRequestHomeLocation.validate_raw(obj: obj.home_location)
        obj.work_location.nil? || Merge::Hris::EmployeeRequestWorkLocation.validate_raw(obj: obj.work_location)
        obj.manager.nil? || Merge::Hris::EmployeeRequestManager.validate_raw(obj: obj.manager)
        obj.team.nil? || Merge::Hris::EmployeeRequestTeam.validate_raw(obj: obj.team)
        obj.pay_group.nil? || Merge::Hris::EmployeeRequestPayGroup.validate_raw(obj: obj.pay_group)
        obj.ssn&.is_a?(String) != false || raise("Passed value for field obj.ssn is not the expected type, validation failed.")
        obj.gender&.is_a?(Merge::Hris::GenderEnum) != false || raise("Passed value for field obj.gender is not the expected type, validation failed.")
        obj.ethnicity&.is_a?(Merge::Hris::EthnicityEnum) != false || raise("Passed value for field obj.ethnicity is not the expected type, validation failed.")
        obj.marital_status&.is_a?(Merge::Hris::MaritalStatusEnum) != false || raise("Passed value for field obj.marital_status is not the expected type, validation failed.")
        obj.date_of_birth&.is_a?(DateTime) != false || raise("Passed value for field obj.date_of_birth is not the expected type, validation failed.")
        obj.hire_date&.is_a?(DateTime) != false || raise("Passed value for field obj.hire_date is not the expected type, validation failed.")
        obj.start_date&.is_a?(DateTime) != false || raise("Passed value for field obj.start_date is not the expected type, validation failed.")
        obj.employment_status&.is_a?(Merge::Hris::EmploymentStatusEnum) != false || raise("Passed value for field obj.employment_status is not the expected type, validation failed.")
        obj.termination_date&.is_a?(DateTime) != false || raise("Passed value for field obj.termination_date is not the expected type, validation failed.")
        obj.avatar&.is_a?(String) != false || raise("Passed value for field obj.avatar is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
