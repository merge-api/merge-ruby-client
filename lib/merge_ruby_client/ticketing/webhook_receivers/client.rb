# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../types/webhook_receiver"
require "async"

module Merge
  module Ticketing
    class WebhookReceiversClient
      attr_reader :request_client

      # @param request_client [RequestClient]
      # @return [Ticketing::WebhookReceiversClient]
      def initialize(request_client:)
        # @type [RequestClient]
        @request_client = request_client
      end

      # Returns a list of `WebhookReceiver` objects.
      #
      # @param request_options [RequestOptions]
      # @return [Array<Ticketing::WebhookReceiver>]
      def list(request_options: nil)
        response = @request_client.conn.get("/api/ticketing/v1/webhook-receivers") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        end
        return if response.body.nil?

        response.body.map do |v|
          v = v.to_json
          Ticketing::WebhookReceiver.from_json(json_object: v)
        end
      end

      # Creates a `WebhookReceiver` object with the given values.
      #
      # @param event [String]
      # @param is_active [Boolean]
      # @param key [String]
      # @param request_options [RequestOptions]
      # @return [Ticketing::WebhookReceiver]
      def create(event:, is_active:, key: nil, request_options: nil)
        response = @request_client.conn.post("/api/ticketing/v1/webhook-receivers") do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            event: event,
            is_active: is_active,
            key: key
          }.compact
        end
        Ticketing::WebhookReceiver.from_json(json_object: response.body)
      end
    end

    class AsyncWebhookReceiversClient
      attr_reader :request_client

      # @param request_client [AsyncRequestClient]
      # @return [Ticketing::AsyncWebhookReceiversClient]
      def initialize(request_client:)
        # @type [AsyncRequestClient]
        @request_client = request_client
      end

      # Returns a list of `WebhookReceiver` objects.
      #
      # @param request_options [RequestOptions]
      # @return [Array<Ticketing::WebhookReceiver>]
      def list(request_options: nil)
        Async do
          response = @request_client.conn.get("/api/ticketing/v1/webhook-receivers") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          response.body&.map do |v|
            v = v.to_json
            Ticketing::WebhookReceiver.from_json(json_object: v)
          end
        end
      end

      # Creates a `WebhookReceiver` object with the given values.
      #
      # @param event [String]
      # @param is_active [Boolean]
      # @param key [String]
      # @param request_options [RequestOptions]
      # @return [Ticketing::WebhookReceiver]
      def create(event:, is_active:, key: nil, request_options: nil)
        Async do
          response = @request_client.conn.post("/api/ticketing/v1/webhook-receivers") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.api_key unless request_options&.api_key.nil?
            req.headers["X-Account-Token"] = request_options.account_token unless request_options&.account_token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              event: event,
              is_active: is_active,
              key: key
            }.compact
          end
          Ticketing::WebhookReceiver.from_json(json_object: response.body)
        end
      end
    end
  end
end
