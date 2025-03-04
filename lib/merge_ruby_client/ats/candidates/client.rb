# frozen_string_literal: true

require_relative "../../../requests"
require "date"
require_relative "types/candidates_list_request_expand"
require_relative "../types/paginated_candidate_list"
require_relative "../types/candidate_request"
require_relative "../types/candidate_response"
require_relative "types/candidates_retrieve_request_expand"
require_relative "../types/candidate"
require_relative "../types/patched_candidate_request"
require_relative "../types/reason_enum"
require_relative "../types/meta_response"
require "async"

module Merge
  module Ats
    class CandidatesClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Ats::CandidatesClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `Candidate` objects.
      #
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param email_addresses [String] If provided, will only return candidates with these email addresses; multiple
      #  addresses can be separated by commas.
      # @param expand [Merge::Ats::Candidates::CandidatesListRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param first_name [String] If provided, will only return candidates with this first name.
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param last_name [String] If provided, will only return candidates with this last name.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param tags [String] If provided, will only return candidates with these tags; multiple tags can be
      #  separated by commas.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::PaginatedCandidateList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.candidates.list
      def list(created_after: nil, created_before: nil, cursor: nil, email_addresses: nil, expand: nil,
               first_name: nil, include_deleted_data: nil, include_remote_data: nil, include_shell_data: nil, last_name: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_id: nil, tags: nil, request_options: nil)
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
            "created_after": created_after,
            "created_before": created_before,
            "cursor": cursor,
            "email_addresses": email_addresses,
            "expand": expand,
            "first_name": first_name,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "include_shell_data": include_shell_data,
            "last_name": last_name,
            "modified_after": modified_after,
            "modified_before": modified_before,
            "page_size": page_size,
            "remote_id": remote_id,
            "tags": tags
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/candidates"
        end
        Merge::Ats::PaginatedCandidateList.from_json(json_object: response.body)
      end

      # Creates a `Candidate` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Ats::CandidateRequest, as a Hash
      #   * :first_name (String)
      #   * :last_name (String)
      #   * :company (String)
      #   * :title (String)
      #   * :last_interaction_at (DateTime)
      #   * :is_private (Boolean)
      #   * :can_email (Boolean)
      #   * :locations (Array<String>)
      #   * :phone_numbers (Array<Merge::Ats::PhoneNumberRequest>)
      #   * :email_addresses (Array<Merge::Ats::EmailAddressRequest>)
      #   * :urls (Array<Merge::Ats::UrlRequest>)
      #   * :tags (Array<String>)
      #   * :applications (Array<Merge::Ats::CandidateRequestApplicationsItem>)
      #   * :attachments (Array<Merge::Ats::CandidateRequestAttachmentsItem>)
      #   * :remote_template_id (String)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      # @param remote_user_id [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::CandidateResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.candidates.create(model: {  }, remote_user_id: "remote_user_id")
      def create(model:, remote_user_id:, is_debug_mode: nil, run_async: nil, request_options: nil)
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
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            model: model,
            remote_user_id: remote_user_id
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/candidates"
        end
        Merge::Ats::CandidateResponse.from_json(json_object: response.body)
      end

      # Returns a `Candidate` object with the given `id`.
      #
      # @param id [String]
      # @param expand [Merge::Ats::Candidates::CandidatesRetrieveRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::Candidate]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.candidates.retrieve(id: "id")
      def retrieve(id:, expand: nil, include_remote_data: nil, include_shell_data: nil, request_options: nil)
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
            "include_shell_data": include_shell_data
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/candidates/#{id}"
        end
        Merge::Ats::Candidate.from_json(json_object: response.body)
      end

      # Updates a `Candidate` object with the given `id`.
      #
      # @param id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Ats::PatchedCandidateRequest, as a Hash
      #   * :first_name (String)
      #   * :last_name (String)
      #   * :company (String)
      #   * :title (String)
      #   * :last_interaction_at (DateTime)
      #   * :is_private (Boolean)
      #   * :can_email (Boolean)
      #   * :locations (Array<String>)
      #   * :phone_numbers (Array<Merge::Ats::PhoneNumberRequest>)
      #   * :email_addresses (Array<Merge::Ats::EmailAddressRequest>)
      #   * :urls (Array<Merge::Ats::UrlRequest>)
      #   * :tags (Array<String>)
      #   * :applications (Array<String>)
      #   * :attachments (Array<String>)
      #   * :remote_template_id (String)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      # @param remote_user_id [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::CandidateResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.candidates.partial_update(
      #    id: "id",
      #    model: {  },
      #    remote_user_id: "remote_user_id"
      #  )
      def partial_update(id:, model:, remote_user_id:, is_debug_mode: nil, run_async: nil, request_options: nil)
        response = @request_client.conn.patch do |req|
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
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            model: model,
            remote_user_id: remote_user_id
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/candidates/#{id}"
        end
        Merge::Ats::CandidateResponse.from_json(json_object: response.body)
      end

      # Ignores a specific row based on the `model_id` in the url. These records will
      #  have their properties set to null, and will not be updated in future syncs. The
      #  "reason" and "message" fields in the request body will be stored for audit
      #  purposes.
      #
      # @param model_id [String]
      # @param reason [Merge::Ats::ReasonEnum]
      # @param message [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Void]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.candidates.ignore_create(model_id: "model_id", reason: GENERAL_CUSTOMER_REQUEST)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/candidates/ignore/#{model_id}"
        end
      end

      # Returns metadata for `Candidate` PATCHs.
      #
      # @param id [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.candidates.meta_patch_retrieve(id: "id")
      def meta_patch_retrieve(id:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/candidates/meta/patch/#{id}"
        end
        Merge::Ats::MetaResponse.from_json(json_object: response.body)
      end

      # Returns metadata for `Candidate` POSTs.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.candidates.meta_post_retrieve
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
          req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/candidates/meta/post"
        end
        Merge::Ats::MetaResponse.from_json(json_object: response.body)
      end
    end

    class AsyncCandidatesClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Ats::AsyncCandidatesClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `Candidate` objects.
      #
      # @param created_after [DateTime] If provided, will only return objects created after this datetime.
      # @param created_before [DateTime] If provided, will only return objects created before this datetime.
      # @param cursor [String] The pagination cursor value.
      # @param email_addresses [String] If provided, will only return candidates with these email addresses; multiple
      #  addresses can be separated by commas.
      # @param expand [Merge::Ats::Candidates::CandidatesListRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param first_name [String] If provided, will only return candidates with this first name.
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param last_name [String] If provided, will only return candidates with this last name.
      # @param modified_after [DateTime] If provided, only objects synced by Merge after this date time will be returned.
      # @param modified_before [DateTime] If provided, only objects synced by Merge before this date time will be
      #  returned.
      # @param page_size [Integer] Number of results to return per page.
      # @param remote_id [String] The API provider's ID for the given object.
      # @param tags [String] If provided, will only return candidates with these tags; multiple tags can be
      #  separated by commas.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::PaginatedCandidateList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.candidates.list
      def list(created_after: nil, created_before: nil, cursor: nil, email_addresses: nil, expand: nil,
               first_name: nil, include_deleted_data: nil, include_remote_data: nil, include_shell_data: nil, last_name: nil, modified_after: nil, modified_before: nil, page_size: nil, remote_id: nil, tags: nil, request_options: nil)
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
              "created_after": created_after,
              "created_before": created_before,
              "cursor": cursor,
              "email_addresses": email_addresses,
              "expand": expand,
              "first_name": first_name,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "include_shell_data": include_shell_data,
              "last_name": last_name,
              "modified_after": modified_after,
              "modified_before": modified_before,
              "page_size": page_size,
              "remote_id": remote_id,
              "tags": tags
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/candidates"
          end
          Merge::Ats::PaginatedCandidateList.from_json(json_object: response.body)
        end
      end

      # Creates a `Candidate` object with the given values.
      #
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Ats::CandidateRequest, as a Hash
      #   * :first_name (String)
      #   * :last_name (String)
      #   * :company (String)
      #   * :title (String)
      #   * :last_interaction_at (DateTime)
      #   * :is_private (Boolean)
      #   * :can_email (Boolean)
      #   * :locations (Array<String>)
      #   * :phone_numbers (Array<Merge::Ats::PhoneNumberRequest>)
      #   * :email_addresses (Array<Merge::Ats::EmailAddressRequest>)
      #   * :urls (Array<Merge::Ats::UrlRequest>)
      #   * :tags (Array<String>)
      #   * :applications (Array<Merge::Ats::CandidateRequestApplicationsItem>)
      #   * :attachments (Array<Merge::Ats::CandidateRequestAttachmentsItem>)
      #   * :remote_template_id (String)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      # @param remote_user_id [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::CandidateResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.candidates.create(model: {  }, remote_user_id: "remote_user_id")
      def create(model:, remote_user_id:, is_debug_mode: nil, run_async: nil, request_options: nil)
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
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              model: model,
              remote_user_id: remote_user_id
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/candidates"
          end
          Merge::Ats::CandidateResponse.from_json(json_object: response.body)
        end
      end

      # Returns a `Candidate` object with the given `id`.
      #
      # @param id [String]
      # @param expand [Merge::Ats::Candidates::CandidatesRetrieveRequestExpand] Which relations should be returned in expanded form. Multiple relation names
      #  should be comma separated without spaces.
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::Candidate]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.candidates.retrieve(id: "id")
      def retrieve(id:, expand: nil, include_remote_data: nil, include_shell_data: nil, request_options: nil)
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
              "include_shell_data": include_shell_data
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/candidates/#{id}"
          end
          Merge::Ats::Candidate.from_json(json_object: response.body)
        end
      end

      # Updates a `Candidate` object with the given `id`.
      #
      # @param id [String]
      # @param is_debug_mode [Boolean] Whether to include debug fields (such as log file links) in the response.
      # @param run_async [Boolean] Whether or not third-party updates should be run asynchronously.
      # @param model [Hash] Request of type Merge::Ats::PatchedCandidateRequest, as a Hash
      #   * :first_name (String)
      #   * :last_name (String)
      #   * :company (String)
      #   * :title (String)
      #   * :last_interaction_at (DateTime)
      #   * :is_private (Boolean)
      #   * :can_email (Boolean)
      #   * :locations (Array<String>)
      #   * :phone_numbers (Array<Merge::Ats::PhoneNumberRequest>)
      #   * :email_addresses (Array<Merge::Ats::EmailAddressRequest>)
      #   * :urls (Array<Merge::Ats::UrlRequest>)
      #   * :tags (Array<String>)
      #   * :applications (Array<String>)
      #   * :attachments (Array<String>)
      #   * :remote_template_id (String)
      #   * :integration_params (Hash{String => Object})
      #   * :linked_account_params (Hash{String => Object})
      # @param remote_user_id [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::CandidateResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.candidates.partial_update(
      #    id: "id",
      #    model: {  },
      #    remote_user_id: "remote_user_id"
      #  )
      def partial_update(id:, model:, remote_user_id:, is_debug_mode: nil, run_async: nil, request_options: nil)
        Async do
          response = @request_client.conn.patch do |req|
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
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              model: model,
              remote_user_id: remote_user_id
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/candidates/#{id}"
          end
          Merge::Ats::CandidateResponse.from_json(json_object: response.body)
        end
      end

      # Ignores a specific row based on the `model_id` in the url. These records will
      #  have their properties set to null, and will not be updated in future syncs. The
      #  "reason" and "message" fields in the request body will be stored for audit
      #  purposes.
      #
      # @param model_id [String]
      # @param reason [Merge::Ats::ReasonEnum]
      # @param message [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Void]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.candidates.ignore_create(model_id: "model_id", reason: GENERAL_CUSTOMER_REQUEST)
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
            req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/candidates/ignore/#{model_id}"
          end
        end
      end

      # Returns metadata for `Candidate` PATCHs.
      #
      # @param id [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.candidates.meta_patch_retrieve(id: "id")
      def meta_patch_retrieve(id:, request_options: nil)
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
            req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/candidates/meta/patch/#{id}"
          end
          Merge::Ats::MetaResponse.from_json(json_object: response.body)
        end
      end

      # Returns metadata for `Candidate` POSTs.
      #
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Ats::MetaResponse]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.ats.candidates.meta_post_retrieve
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
            req.url "#{@request_client.get_url(request_options: request_options)}/ats/v1/candidates/meta/post"
          end
          Merge::Ats::MetaResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end
