# frozen_string_literal: true

require_relative "../../requests"
require_relative "integrations/client"

module Merge
  module Organizations
    class Client
      # @return [Merge::RequestClient]
      attr_reader :request_client
      # @return [Merge::Organizations::IntegrationsClient]
      attr_reader :integrations

      # @param request_client [Merge::RequestClient]
      # @return [Merge::Organizations::Client]
      def initialize(request_client:)
        @request_client = request_client
        @integrations = Merge::Organizations::IntegrationsClient.new(request_client: request_client)
      end
    end

    class AsyncClient
      # @return [Merge::AsyncRequestClient]
      attr_reader :request_client
      # @return [Merge::Organizations::AsyncIntegrationsClient]
      attr_reader :integrations

      # @param request_client [Merge::AsyncRequestClient]
      # @return [Merge::Organizations::AsyncClient]
      def initialize(request_client:)
        @request_client = request_client
        @integrations = Merge::Organizations::AsyncIntegrationsClient.new(request_client: request_client)
      end
    end
  end
end