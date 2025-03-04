# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/employees_list_request_employment_status"
require_relative "types/employees_list_request_expand"
require_relative "types/employees_list_request_remote_fields"
require_relative "types/employees_list_request_show_enum_origins"
require_relative "../types/paginated_employee_list"
require_relative "../types/employee_request"
require_relative "../types/employee_response"
require_relative "types/employees_retrieve_request_expand"
require_relative "types/employees_retrieve_request_remote_fields"
require_relative "types/employees_retrieve_request_show_enum_origins"
require_relative "../types/employee"
require_relative "../types/reason_enum"
require_relative "../types/meta_response"
require "async"

module Merge
  module Hris
    class EmployeesClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Hris::EmployeesClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `Employee` objects.
      #
      # @param company_id [String] If provided, will only return employees for this company.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param display_full_name [String] If provided, will only return employees with this display name.
      # @param employment_status [Merge::Hris::Employees::EmployeesListRequestEmploymentStatus] If provided, will only return employees with this employment status.
      #  - `ACTIVE` - ACTIVE
      #  - `PENDING` - PENDING
      #  - `INACTIVE` - INACTIVE
      # @param employment_type [String] If provided, will only return employees that have an employment of the specified
      #  employment_type.
      # @param expand [Merge::Hris::Employees::EmployeesListRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param first_name [String] If provided, will only return employees with this first name.
      # @param groups [String] If provided, will only return employees matching the group ids; multiple groups
      #  can be separated by commas.
      # @param home_location_id [String] If provided, will only return employees for this home location.
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_sensitive_fields [Boolean] Whether to include sensitive fields (such as social security numbers) in the
      #  response.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param job_title [String] If provided, will only return employees that have an employment of the specified
      #  job_title.
      # @param last_name [String] If provided, will only return employees with this last name.
      # @param manager_id [String] If provided, will only return employees for this manager.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param pay_group_id [String] If provided, will only return employees for this pay group
      # @param personal_email [String] If provided, will only return Employees with this personal email
      # @param remote_fields [Merge::Hris::Employees::EmployeesListRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param show_enum_origins [Merge::Hris::Employees::EmployeesListRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param started_after [DateTime] If provided, will only return employees that started after this datetime.
      # @param started_before [DateTime] If provided, will only return employees that started before this datetime.
      # @param team_id [String] If provided, will only return employees for this team.
      # @param terminated_after [DateTime] If provided, will only return employees that were terminated after this
      #  datetime.
      # @param terminated_before [DateTime] If provided, will only return employees that were terminated before this
      #  datetime.
      # @param work_email [String] If provided, will only return Employees with this work email
      # @param work_location_id [String] If provided, will only return employees for this location.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Hris::PaginatedEmployeeList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.hris.employees.list
      def list(company_id: nil, created_after: nil, created_before: nil, cursor: nil, display_full_name: nil,
               employment_status: nil, employment_type: nil, expand: nil, first_name: nil, groups: nil, home_location_id: nil, include_deleted_data: nil, include_remote_data: nil, include_sensitive_fields: nil, include_shell_data: nil, job_title: nil, last_name: nil, manager_id: nil, modified_after: nil, modified_before: nil, page_size: nil, pay_group_id: nil, personal_email: nil, remote_fields: nil, remote_id: nil, show_enum_origins: nil, started_after: nil, started_before: nil, team_id: nil, terminated_after: nil, terminated_before: nil, work_email: nil, work_location_id: nil, request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "company_id": company_id,
            "created_after": created_after,
            "created_before": created_before,
            "cursor": cursor,
            "display_full_name": display_full_name,
            "employment_status": employment_status,
            "employment_type": employment_type,
            "expand": expand,
            "first_name": first_name,
            "groups": groups,
            "home_location_id": home_location_id,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "include_sensitive_fields": include_sensitive_fields,
            "include_shell_data": include_shell_data,
            "job_title": job_title,
            "last_name": last_name,
            "manager_id": manager_id,
            "modified_after": modified_after,
            "modified_before": modified_before,
            "page_size": page_size,
            "pay_group_id": pay_group_id,
            "personal_email": personal_email,
            "remote_fields": remote_fields,
            "remote_id": remote_id,
            "show_enum_origins": show_enum_origins,
            "started_after": started_after,
            "started_before": started_before,
            "team_id": team_id,
            "terminated_after": terminated_after,
            "terminated_before": terminated_before,
            "work_email": work_email,
            "work_location_id": work_location_id
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/hris/v1/employees"
        end
        Merge::Hris::PaginatedEmployeeList.from_json(json_object: response.body)
      end

      # Creates an `Employee` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Hris::EmployeeRequest, as a Hash
      #   * :employee_number (String)
      #   * :company (Hash)
      #   * :first_name (String)
      #   * :last_name (String)
      #   * :preferred_name (String)
      #   * :display_full_name (String)
      #   * :username (String)
      #   * :groups (Array<Merge::Hris::EmployeeRequestGroupsItem>)
      #   * :work_email (String)
      #   * :personal_email (String)
      #   * :mobile_phone_number (String)
      #   * :employments (Array<Merge::Hris::EmployeeRequestEmploymentsItem>)
      #   * :home_location (Hash)
      #   * :work_location (Hash)
      #   * :manager (Hash)
      #   * :team (Hash)
      #   * :pay_group (Hash)
      #   * :ssn (String)
      #   * :gender (Merge::Hris::GenderEnum)
      #   * :ethnicity (Merge::Hris::EthnicityEnum)
      #   * :marital_status (Merge::Hris::MaritalStatusEnum)
      #   * :date_of_birth (DateTime)
      #   * :hire_date (DateTime)
      #   * :start_date (DateTime)
      #   * :employment_status (Merge::Hris::EmploymentStatusEnum)
      #   * :termination_date (DateTime)
      #   * :avatar (String)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Hris::EmployeeResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.hris.employees.create(model: {  })
      def create(model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "is_debug_mode": is_debug_mode,
            "run_async": run_async
          }.compact
          req.body = { **(request_options&.additional_body_parameters || {}), model: model }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/hris/v1/employees"
        end
        Merge::Hris::EmployeeResponse.from_json(json_object: response.body)
      end

      # Returns an `Employee` object with the given `id`.
      #
      # @param id [String]
      # @param expand [Merge::Hris::Employees::EmployeesRetrieveRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_sensitive_fields [Boolean] Whether to include sensitive fields (such as social security numbers) in the
      #  response.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param remote_fields [Merge::Hris::Employees::EmployeesRetrieveRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [Merge::Hris::Employees::EmployeesRetrieveRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Hris::Employee]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.hris.employees.retrieve(id: "id")
      def retrieve(id:, expand: nil, include_remote_data: nil, include_sensitive_fields: nil, include_shell_data: nil,
                   remote_fields: nil, show_enum_origins: nil, request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "expand": expand,
            "include_remote_data": include_remote_data,
            "include_sensitive_fields": include_sensitive_fields,
            "include_shell_data": include_shell_data,
            "remote_fields": remote_fields,
            "show_enum_origins": show_enum_origins
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/hris/v1/employees/#{id}"
        end
        Merge::Hris::Employee.from_json(json_object: response.body)
      end

      # Ignores a specific row based on the `model_id` in the url. These records will
      #  have their properties set to null, and will not be updated in future syncs. The
      #  "reason" and "message" fields in the request body will be stored for audit
      #  purposes.
      #
      # @param model_id [String]
      # @param reason [Merge::Hris::ReasonEnum]
      # @param message [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Void]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.hris.employees.ignore_create(model_id: "model_id", reason: GENERAL_CUSTOMER_REQUEST)
      def ignore_create(model_id:, reason:, message: nil, request_options: nil)
        @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          req.body = { **(request_options&.additional_body_parameters || {}), reason: reason, message: message }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/hris/v1/employees/ignore/#{model_id}"
        end
      end

      # Returns metadata for `Employee` POSTs.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Hris::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.hris.employees.meta_post_retrieve
      def meta_post_retrieve(request_options: nil)
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/hris/v1/employees/meta/post"
        end
        Merge::Hris::MetaResponse.from_json(json_object: response.body)
      end
    end

    class AsyncEmployeesClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Hris::AsyncEmployeesClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `Employee` objects.
      #
      # @param company_id [String] If provided, will only return employees for this company.
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param display_full_name [String] If provided, will only return employees with this display name.
      # @param employment_status [Merge::Hris::Employees::EmployeesListRequestEmploymentStatus] If provided, will only return employees with this employment status.
      #  - `ACTIVE` - ACTIVE
      #  - `PENDING` - PENDING
      #  - `INACTIVE` - INACTIVE
      # @param employment_type [String] If provided, will only return employees that have an employment of the specified
      #  employment_type.
      # @param expand [Merge::Hris::Employees::EmployeesListRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param first_name [String] If provided, will only return employees with this first name.
      # @param groups [String] If provided, will only return employees matching the group ids; multiple groups
      #  can be separated by commas.
      # @param home_location_id [String] If provided, will only return employees for this home location.
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_sensitive_fields [Boolean] Whether to include sensitive fields (such as social security numbers) in the
      #  response.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param job_title [String] If provided, will only return employees that have an employment of the specified
      #  job_title.
      # @param last_name [String] If provided, will only return employees with this last name.
      # @param manager_id [String] If provided, will only return employees for this manager.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param pay_group_id [String] If provided, will only return employees for this pay group
      # @param personal_email [String] If provided, will only return Employees with this personal email
      # @param remote_fields [Merge::Hris::Employees::EmployeesListRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param show_enum_origins [Merge::Hris::Employees::EmployeesListRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param started_after [DateTime] If provided, will only return employees that started after this datetime.
      # @param started_before [DateTime] If provided, will only return employees that started before this datetime.
      # @param team_id [String] If provided, will only return employees for this team.
      # @param terminated_after [DateTime] If provided, will only return employees that were terminated after this
      #  datetime.
      # @param terminated_before [DateTime] If provided, will only return employees that were terminated before this
      #  datetime.
      # @param work_email [String] If provided, will only return Employees with this work email
      # @param work_location_id [String] If provided, will only return employees for this location.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Hris::PaginatedEmployeeList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.hris.employees.list
      def list(company_id: nil, created_after: nil, created_before: nil, cursor: nil, display_full_name: nil,
               employment_status: nil, employment_type: nil, expand: nil, first_name: nil, groups: nil, home_location_id: nil, include_deleted_data: nil, include_remote_data: nil, include_sensitive_fields: nil, include_shell_data: nil, job_title: nil, last_name: nil, manager_id: nil, modified_after: nil, modified_before: nil, page_size: nil, pay_group_id: nil, personal_email: nil, remote_fields: nil, remote_id: nil, show_enum_origins: nil, started_after: nil, started_before: nil, team_id: nil, terminated_after: nil, terminated_before: nil, work_email: nil, work_location_id: nil, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "company_id": company_id,
              "created_after": created_after,
              "created_before": created_before,
              "cursor": cursor,
              "display_full_name": display_full_name,
              "employment_status": employment_status,
              "employment_type": employment_type,
              "expand": expand,
              "first_name": first_name,
              "groups": groups,
              "home_location_id": home_location_id,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "include_sensitive_fields": include_sensitive_fields,
              "include_shell_data": include_shell_data,
              "job_title": job_title,
              "last_name": last_name,
              "manager_id": manager_id,
              "modified_after": modified_after,
              "modified_before": modified_before,
              "page_size": page_size,
              "pay_group_id": pay_group_id,
              "personal_email": personal_email,
              "remote_fields": remote_fields,
              "remote_id": remote_id,
              "show_enum_origins": show_enum_origins,
              "started_after": started_after,
              "started_before": started_before,
              "team_id": team_id,
              "terminated_after": terminated_after,
              "terminated_before": terminated_before,
              "work_email": work_email,
              "work_location_id": work_location_id
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/hris/v1/employees"
          end
          Merge::Hris::PaginatedEmployeeList.from_json(json_object: response.body)
        end
      end

      # Creates an `Employee` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Hris::EmployeeRequest, as a Hash
      #   * :employee_number (String)
      #   * :company (Hash)
      #   * :first_name (String)
      #   * :last_name (String)
      #   * :preferred_name (String)
      #   * :display_full_name (String)
      #   * :username (String)
      #   * :groups (Array<Merge::Hris::EmployeeRequestGroupsItem>)
      #   * :work_email (String)
      #   * :personal_email (String)
      #   * :mobile_phone_number (String)
      #   * :employments (Array<Merge::Hris::EmployeeRequestEmploymentsItem>)
      #   * :home_location (Hash)
      #   * :work_location (Hash)
      #   * :manager (Hash)
      #   * :team (Hash)
      #   * :pay_group (Hash)
      #   * :ssn (String)
      #   * :gender (Merge::Hris::GenderEnum)
      #   * :ethnicity (Merge::Hris::EthnicityEnum)
      #   * :marital_status (Merge::Hris::MaritalStatusEnum)
      #   * :date_of_birth (DateTime)
      #   * :hire_date (DateTime)
      #   * :start_date (DateTime)
      #   * :employment_status (Merge::Hris::EmploymentStatusEnum)
      #   * :termination_date (DateTime)
      #   * :avatar (String)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Hris::EmployeeResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.hris.employees.create(model: {  })
      def create(model:, is_debug_mode: nil, run_async: nil, request_options: nil)
        Async do
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "is_debug_mode": is_debug_mode,
              "run_async": run_async
            }.compact
            req.body = { **(request_options&.additional_body_parameters || {}), model: model }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/hris/v1/employees"
          end
          Merge::Hris::EmployeeResponse.from_json(json_object: response.body)
        end
      end

      # Returns an `Employee` object with the given `id`.
      #
      # @param id [String]
      # @param expand [Merge::Hris::Employees::EmployeesRetrieveRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_sensitive_fields [Boolean] Whether to include sensitive fields (such as social security numbers) in the
      #  response.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param remote_fields [Merge::Hris::Employees::EmployeesRetrieveRequestRemoteFields] Deprecated. Use show_enum_origins.
      # @param show_enum_origins [Merge::Hris::Employees::EmployeesRetrieveRequestShowEnumOrigins] A comma separated list of enum field names for which you'd like the original
      #  values to be returned, instead of Merge's normalized enum values. [Learn
      #  e](https://help.merge.dev/en/articles/8950958-show_enum_origins-query-parameter)
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Hris::Employee]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.hris.employees.retrieve(id: "id")
      def retrieve(id:, expand: nil, include_remote_data: nil, include_sensitive_fields: nil, include_shell_data: nil,
                   remote_fields: nil, show_enum_origins: nil, request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "expand": expand,
              "include_remote_data": include_remote_data,
              "include_sensitive_fields": include_sensitive_fields,
              "include_shell_data": include_shell_data,
              "remote_fields": remote_fields,
              "show_enum_origins": show_enum_origins
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/hris/v1/employees/#{id}"
          end
          Merge::Hris::Employee.from_json(json_object: response.body)
        end
      end

      # Ignores a specific row based on the `model_id` in the url. These records will
      #  have their properties set to null, and will not be updated in future syncs. The
      #  "reason" and "message" fields in the request body will be stored for audit
      #  purposes.
      #
      # @param model_id [String]
      # @param reason [Merge::Hris::ReasonEnum]
      # @param message [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Void]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.hris.employees.ignore_create(model_id: "model_id", reason: GENERAL_CUSTOMER_REQUEST)
      def ignore_create(model_id:, reason:, message: nil, request_options: nil)
        Async do
          @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            unless request_options.nil? || request_options&.additional_query_parameters.nil?
              req.params = { **(request_options&.additional_query_parameters || {}) }.compact
            end
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              reason: reason,
              message: message
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/hris/v1/employees/ignore/#{model_id}"
          end
        end
      end

      # Returns metadata for `Employee` POSTs.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Hris::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.hris.employees.meta_post_retrieve
      def meta_post_retrieve(request_options: nil)
        Async do
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            unless request_options.nil? || request_options&.additional_query_parameters.nil?
              req.params = { **(request_options&.additional_query_parameters || {}) }.compact
            end
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/hris/v1/employees/meta/post"
          end
          Merge::Hris::MetaResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
