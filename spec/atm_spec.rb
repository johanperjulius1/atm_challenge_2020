require './lib/atm.rb'

describe Atm do
    it 'has 1000$ on initialize' do
        expect(subject.funds).to eq 1000
    end

    it 'funds are reduced at withdraw' do
        subject.withdraw 50
        expect(subject.funds).to eq 950
    end

    let(:account)   {
        instance_double('Account')
    }

    before do
        #Before each test we need to add an attribute of 'balance'
        #to the 'account' object and set the value to '100'.
        allow(account).to receive(:balance).and_return(100)
        #We also need to aloow account to receive the new balance
        #using the setter method 'balance='
        allow(account).to recieve(:balance=)
    end
end