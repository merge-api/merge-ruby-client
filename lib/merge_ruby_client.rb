# frozen_string_literal: true

require_relative "environment"
require_relative "types_export"
require_relative "requests"
require_relative "merge_ruby_client/ats/client"
require_relative "merge_ruby_client/crm/client"
require_relative "merge_ruby_client/filestorage/client"
require_relative "merge_ruby_client/hris/client"
require_relative "merge_ruby_client/ticketing/client"
require_relative "merge_ruby_client/accounting/client"

module Merge
  class Client
    attr_reader :ats, :crm, :filestorage, :hris, :ticketing, :accounting

    # @param environment [Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param api_key [String]
    # @param account_token [String] Token identifying the end user.
    # @return [Client]
    def initialize(api_key:, environment: Environment::PRODUCTION, max_retries: nil, timeout_in_seconds: nil,
                   account_token: nil)
      @request_client = RequestClient.new(environment: environment, max_retries: max_retries,
                                          timeout_in_seconds: timeout_in_seconds, api_key: api_key, account_token: account_token)
      @ats = Ats::Client.new(request_client: @request_client)
      @crm = Crm::Client.new(request_client: @request_client)
      @filestorage = Filestorage::Client.new(request_client: @request_client)
      @hris = Hris::Client.new(request_client: @request_client)
      @ticketing = Ticketing::Client.new(request_client: @request_client)
      @accounting = Accounting::Client.new(request_client: @request_client)
    end
  end

  class AsyncClient
    attr_reader :ats, :crm, :filestorage, :hris, :ticketing, :accounting

    # @param environment [Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param api_key [String]
    # @param account_token [String] Token identifying the end user.
    # @return [AsyncClient]
    def initialize(api_key:, environment: Environment::PRODUCTION, max_retries: nil, timeout_in_seconds: nil,
                   account_token: nil)
      @async_request_client = AsyncRequestClient.new(environment: environment, max_retries: max_retries,
                                                     timeout_in_seconds: timeout_in_seconds, api_key: api_key, account_token: account_token)
      @ats = Ats::AsyncClient.new(request_client: @async_request_client)
      @crm = Crm::AsyncClient.new(request_client: @async_request_client)
      @filestorage = Filestorage::AsyncClient.new(request_client: @async_request_client)
      @hris = Hris::AsyncClient.new(request_client: @async_request_client)
      @ticketing = Ticketing::AsyncClient.new(request_client: @async_request_client)
      @accounting = Accounting::AsyncClient.new(request_client: @async_request_client)
    end
  end
end
