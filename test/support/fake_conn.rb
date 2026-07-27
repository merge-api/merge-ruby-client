# frozen_string_literal: true

require "ostruct"

module TestSupport
  class FakeRequest
    attr_accessor :headers, :params, :body
    attr_reader :options, :requested_url

    def initialize(headers = {})
      @headers = headers
      @params = {}
      @body = nil
      @options = OpenStruct.new
      @requested_url = nil
    end

    def url(value)
      @requested_url = value
    end

    def header(name)
      @headers[name] || @headers[name.to_sym] || @headers[name.to_s]
    end
  end

  class FakeResponse
    attr_reader :body, :status

    def initialize(body, status)
      @body = body
      @status = status
    end
  end

  class FakeConn
    attr_reader :requests

    def initialize(default_headers: {}, body: "{}", status: 200)
      @default_headers = default_headers
      @body = body
      @status = status
      @requests = []
    end

    def get(&block)
      dispatch(&block)
    end

    def post(&block)
      dispatch(&block)
    end

    def patch(&block)
      dispatch(&block)
    end

    def put(&block)
      dispatch(&block)
    end

    def delete(&block)
      dispatch(&block)
    end

    def last_request
      @requests.last
    end

    private

    def dispatch
      request = FakeRequest.new(@default_headers.dup)
      yield request if block_given?
      @requests << request
      FakeResponse.new(@body, @status)
    end
  end

  def stub_request_client(body: "{}", **client_options)
    request_client = Merge::RequestClient.new(**client_options)
    conn = FakeConn.new(default_headers: request_client.conn.headers.to_h, body: body)
    request_client.instance_variable_set(:@conn, conn)
    [request_client, conn]
  end
end
