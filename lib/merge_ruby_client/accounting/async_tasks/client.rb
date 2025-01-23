# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/async_post_task"
require "async"

module Merge
  module Accounting
    class AsyncTasksClient
      # @return [Merge::RequestClient]
      attr_reader :request_client

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Accounting::AsyncTasksClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns an `AsyncPostTask` object with the given `id`.
      #
      # @param id [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::AsyncPostTask]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.async_tasks.retrieve(id: "id")
      def retrieve(id:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/async-tasks/#{id}"
        end
        Merge::Accounting::AsyncPostTask.from_json(json_object: response.body)
      end
    end

    class AsyncAsyncTasksClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Accounting::AsyncAsyncTasksClient]
      def initialize(request_client:)
        @request_client = request_client
      end

      # Returns an `AsyncPostTask` object with the given `id`.
      #
      # @param id [String]
      # @param request_options [Merge::RequestOptions]
      # @return [Merge::Accounting::AsyncPostTask]
      # @example
      #  api = Merge::Client.new(
      #    base_url: "https://api.example.com",
      #    environment: Merge::Environment::PRODUCTION,
      #    api_key: "YOUR_AUTH_TOKEN"
      #  )
      #  api.accounting.async_tasks.retrieve(id: "id")
      def retrieve(id:, request_options: nil)
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
            req.url "#{@request_client.get_url(request_options: request_options)}/accounting/v1/async-tasks/#{id}"
          end
          Merge::Accounting::AsyncPostTask.from_json(json_object: response.body)
        end
      end
    end
  end
end
