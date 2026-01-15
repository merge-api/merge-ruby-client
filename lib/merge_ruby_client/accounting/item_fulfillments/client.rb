# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/paginated_remote_field_class_list"
require "async"

module Merge
  module Accounting
    class ItemFulfillmentsClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Accounting::ItemFulfillmentsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `RemoteFieldClass` objects.{/*
      #  BEGIN_ACCOUNTING_ITEMFULFILLMENT_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  DnmmgSk1s4MgkOegnuL1Y3Z0YRtw/W3L/gbwZZhcl9Cll4Y5JdgIEeHphyK+5f7l7/l6o8gPAUAAA=="
      #  /></Footer>{/* END_ACCOUNTING_ITEMFULFILLMENT_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param cursor [String] The pagination cursor value.
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param is_common_model_field [Boolean] If provided, will only return remote field classes with this
      #  is_common_model_field value
      # @param is_custom [Boolean] If provided, will only return remote fields classes with this is_custom value
      # @param page_size [Integer] Number of results to return per page. The maximum limit is 100.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::PaginatedRemoteFieldClassList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.item_fulfillments.lines_remote_field_classes_list(cursor: "cD0yMDIxLTAxLTA2KzAzJTNBMjQlM0E1My40MzQzMjYlMkIwMCUzQTAw")
      def lines_remote_field_classes_list(cursor: nil, include_deleted_data: nil, include_remote_data: nil,
                                          include_shell_data: nil, is_common_model_field: nil, is_custom: nil, page_size: nil, request_options: nil)
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
            "cursor": cursor,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "include_shell_data": include_shell_data,
            "is_common_model_field": is_common_model_field,
            "is_custom": is_custom,
            "page_size": page_size
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/item-fulfillments/lines/remote-field-classes"
        end
        Merge::Accounting::PaginatedRemoteFieldClassList.from_json(json_object: response.body)
      end

      # Returns a list of `RemoteFieldClass` objects.{/*
      #  BEGIN_ACCOUNTING_ITEMFULFILLMENT_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  DnmmgSk1s4MgkOegnuL1Y3Z0YRtw/W3L/gbwZZhcl9Cll4Y5JdgIEeHphyK+5f7l7/l6o8gPAUAAA=="
      #  /></Footer>{/* END_ACCOUNTING_ITEMFULFILLMENT_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param cursor [String] The pagination cursor value.
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param is_common_model_field [Boolean] If provided, will only return remote field classes with this
      #  is_common_model_field value
      # @param is_custom [Boolean] If provided, will only return remote fields classes with this is_custom value
      # @param page_size [Integer] Number of results to return per page. The maximum limit is 100.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::PaginatedRemoteFieldClassList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.item_fulfillments.remote_field_classes_list(cursor: "cD0yMDIxLTAxLTA2KzAzJTNBMjQlM0E1My40MzQzMjYlMkIwMCUzQTAw")
      def remote_field_classes_list(cursor: nil, include_deleted_data: nil, include_remote_data: nil,
                                    include_shell_data: nil, is_common_model_field: nil, is_custom: nil, page_size: nil, request_options: nil)
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
            "cursor": cursor,
            "include_deleted_data": include_deleted_data,
            "include_remote_data": include_remote_data,
            "include_shell_data": include_shell_data,
            "is_common_model_field": is_common_model_field,
            "is_custom": is_custom,
            "page_size": page_size
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/item-fulfillments/remote-field-classes"
        end
        Merge::Accounting::PaginatedRemoteFieldClassList.from_json(json_object: response.body)
      end
    end

    class AsyncItemFulfillmentsClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Accounting::AsyncItemFulfillmentsClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns a list of `RemoteFieldClass` objects.{/*
      #  BEGIN_ACCOUNTING_ITEMFULFILLMENT_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  DnmmgSk1s4MgkOegnuL1Y3Z0YRtw/W3L/gbwZZhcl9Cll4Y5JdgIEeHphyK+5f7l7/l6o8gPAUAAA=="
      #  /></Footer>{/* END_ACCOUNTING_ITEMFULFILLMENT_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param cursor [String] The pagination cursor value.
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param is_common_model_field [Boolean] If provided, will only return remote field classes with this
      #  is_common_model_field value
      # @param is_custom [Boolean] If provided, will only return remote fields classes with this is_custom value
      # @param page_size [Integer] Number of results to return per page. The maximum limit is 100.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::PaginatedRemoteFieldClassList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.item_fulfillments.lines_remote_field_classes_list(cursor: "cD0yMDIxLTAxLTA2KzAzJTNBMjQlM0E1My40MzQzMjYlMkIwMCUzQTAw")
      def lines_remote_field_classes_list(cursor: nil, include_deleted_data: nil, include_remote_data: nil,
                                          include_shell_data: nil, is_common_model_field: nil, is_custom: nil, page_size: nil, request_options: nil)
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
              "cursor": cursor,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "include_shell_data": include_shell_data,
              "is_common_model_field": is_common_model_field,
              "is_custom": is_custom,
              "page_size": page_size
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/item-fulfillments/lines/remote-field-classes"
          end
          Merge::Accounting::PaginatedRemoteFieldClassList.from_json(json_object: response.body)
        end
      end

      # Returns a list of `RemoteFieldClass` objects.{/*
      #  BEGIN_ACCOUNTING_ITEMFULFILLMENT_FETCH_SUPPORTED_FIELDS *
      #  /}<Footer><MergeSupportedFieldsByIntegrationWidget requestType="GET"
      #  DnmmgSk1s4MgkOegnuL1Y3Z0YRtw/W3L/gbwZZhcl9Cll4Y5JdgIEeHphyK+5f7l7/l6o8gPAUAAA=="
      #  /></Footer>{/* END_ACCOUNTING_ITEMFULFILLMENT_FETCH_SUPPORTED_FIELDS * /}
      #
      # @param cursor [String] The pagination cursor value.
      # @param include_deleted_data [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param include_remote_data [Boolean] Whether to include the original data Merge fetched from the third-party to
      #  produce these models.
      # @param include_shell_data [Boolean] Whether to include shell records. Shell records are empty records (they may
      #  contain some metadata but all other fields are null).
      # @param is_common_model_field [Boolean] If provided, will only return remote field classes with this
      #  is_common_model_field value
      # @param is_custom [Boolean] If provided, will only return remote fields classes with this is_custom value
      # @param page_size [Integer] Number of results to return per page. The maximum limit is 100.
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::PaginatedRemoteFieldClassList]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.item_fulfillments.remote_field_classes_list(cursor: "cD0yMDIxLTAxLTA2KzAzJTNBMjQlM0E1My40MzQzMjYlMkIwMCUzQTAw")
      def remote_field_classes_list(cursor: nil, include_deleted_data: nil, include_remote_data: nil,
                                    include_shell_data: nil, is_common_model_field: nil, is_custom: nil, page_size: nil, request_options: nil)
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
              "cursor": cursor,
              "include_deleted_data": include_deleted_data,
              "include_remote_data": include_remote_data,
              "include_shell_data": include_shell_data,
              "is_common_model_field": is_common_model_field,
              "is_custom": is_custom,
              "page_size": page_size
            }.compact
            unless request_options.nil? || request_options&.additional_body_parameters.nil?
              req.body = { **(request_options&.additional_body_parameters || {}) }.compact
            end
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/item-fulfillments/remote-field-classes"
          end
          Merge::Accounting::PaginatedRemoteFieldClassList.from_json(json_object: response.body)
        end
      end
    end
  end
end
