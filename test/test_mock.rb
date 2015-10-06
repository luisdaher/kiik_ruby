module Kiik
  module TestMock

    def request(url, params = {}, method = :any)
      host = Kiik.host.gsub(/^https:\/\//, "").gsub(/^http:\/\//, "")
      headers = {:accept_version => Kiik.version, :content_type => 'application/json'}
      stub_request(method, "#{Kiik.api_key}:@#{host}/#{url}").
        with(:headers => headers).
        with(:body => params)
    end

    def make_customer(params = {}, error = nil)
      code = error.nil? ? 200 : 422
      respond = error.nil? ? params.clone : {error: error}
      respond[:cards] = [params[:card]] unless params[:card].nil?
      request("customers", params, :post).
        to_return(:status => code, :body => JSON.generate(respond), :headers => {})
    end
  end
end
