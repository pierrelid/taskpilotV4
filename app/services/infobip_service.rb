require "uri"
require "net/http"
require "json"
require "base64"

class InfobipService
  def initialize(params = {})
    @message = Message.find(params[:message_id])
    @quote = @message.quote
  end

  def send_sms
    url = URI("https://x4nw3.api.infobip.com/sms/2/text/single")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Post.new(url)
    request["authorization"] = "Basic " + "VEFTS1BJTE9UMTpvZGszMDkzKmVlaUU="
    request["content-type"] = "application/json"
    request["accept"] = "application/json"
    request.body = "{
        \"from\":\"MMA\",
        \"to\":\"#{@quote.phone}\",
        \"text\":\"#{@message.body}  STOP au 36173\"
      }"
    p response = http.request(request)
  end
end
