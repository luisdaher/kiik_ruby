module Kiik
  # Module created to mock http requests
  module TestMock
    def request(url, params = {}, method = :any)
      host = Kiik.host.gsub(%r{^https:\/\/}, '').gsub(%r{^http:\/\/}, '')
      puts host
      headers = { accept_version: Kiik.version,
                  content_type: 'application/json' }
      stub_request(method, "#{Kiik.api_key}:@#{host}/#{url}")
        .with(headers: headers)
        .with(body: params)
    end

    def post(request = {}, respond = nil, code = 200)
      respond = request.clone if respond.nil?
      request('customers', request, :post)
        .to_return(status: code, body: JSON.generate(respond), headers: {})
    end

    def put(id = 0, request = {}, respond = nil, code = 200)
      respond = request.clone if respond.nil?
      request("customers/#{id}", request, :put)
        .to_return(status: code, body: JSON.generate(respond), headers: {})
    end
  end
end
