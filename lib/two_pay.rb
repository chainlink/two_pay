require 'json'
require 'rest-client'

module TwoPay

  @@remote_storage = "two_pay"
  @@url = "https://api.2pay.us/api/v1/orders/"

  # Creates a card on the two pay server and returns a code which can be used to make further purchases on that card.
  def self.CreateCard(two_pay_token, card_holder_name, card_number, exp_month, exp_year, cvc)
    response = RestClient.post @@url,
                               :token => two_pay_token,
                               "amount" => "1",
                               "card[holdername]" => card_holder_name,
                               "card[number]" => card_number,
                               "card[exp_month]" => exp_month,
                               "card[exp_year]" => exp_year,
                               "card[cvc]" => cvc,
                               "paymentmethodcode" => 1, #Makes it a test transaction, but saves the customer data
                               :accept => :json
    parsedResponse = JSON.parse(response.body)
    parsedResponse = parsedResponse[0] #Unwrap Response

    if parsedResponse["return_code"] == "0"
      return parsedResponse["instant_buy_key"]
    else
      return nil
    end
  end

  #Charges a credit card given a previously issues payment token.
  def self.ChargeCard(two_pay_token, payment_token, amount)
    response = RestClient.post @@url,
                               :token => two_pay_token,
                               "card[token]" => payment_token,
                               "amount" => amount,
                               "paymentmethodcode" => 1, #Makes it a test transaction, Remove for Production.
                               :accept => :json
    parsedResponse = JSON.parse(response.body)
    parsedResponse = parsedResponse[0]

    return parsedResponse
  end
end