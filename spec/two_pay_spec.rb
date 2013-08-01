require 'spec_helper'
require 'two_pay'

describe TwoPay do

  context "with valid attributes" do

    #NOTE: Tests will FAIL without a working two_pay authorization key.
    let(:two_pay_key) { ""}

    it "should create a card on Two Pay" do

      token = TwoPay.CreateCard(two_pay_key, "Blah", "3400 0000 0000 009", "12", "2020", "0000")
      token.should_not be_nil
      token.length.should == 36 #Two Pay instant buy key length
    end

    it "should create a charge based on a pre-existing customer" do
      token = TwoPay.CreateCard(two_pay_key, "Blah", "3400 0000 0000 009", "12", "2020", "0000")

      charge_data = TwoPay.ChargeCard(two_pay_key, token, 10)

      charge_data["return_code"] == "0"
      charge_data["order_status"].should =="Paid"

    end

  end

end