require './lib/atm.rb'
require 'date'



describe Atm do
    it 'has 1000$ on initialize' do
        expect(subject.funds).to eq 1000
    end

    it 'funds are reduced at withdraw' do
        subject.withdraw(50, '1234', account) 
        expect(subject.funds).to eq 950
    end


    let(:account) { instance_double('account', pin_code: '1234', exp_date: '09/20', account_status: :active) }

    before do
        allow(account).to receive(:balance).and_return(100)
        allow(account).to receive(:balance=)
    end

    it 'allow withdraw if the account has enough balance.' do
        expected_output = { 
            status: true,
            message: 'success',
            date: Date.today, amount: 45,
            bills: [20, 20, 5]
            }
        expect(subject.withdraw(45, '1234', account)).to eq expected_output
    end

    it 'rejects withdraw if account has insufficient funds in account' do
        expected_output = { status: false, message: 'insufficient funds in account', date: Date.today }
        expect(subject.withdraw(105, '1234', account)).to eq expected_output
    end
    it 'reject withdraw if ATM has insufficient funds' do
        subject.funds = 50
        expected_output = { status: false, message: 'insufficient funds in ATM', date: Date.today }
        expect(subject.withdraw(100, '1234', account)).to eq expected_output
    end
    it 'reject withdraw if pin_code is incorrect' do
        expected_output = { status: false, message: 'incorrect pin code', date: Date.today }
        expect(subject.withdraw(100, '1243', account)).to eq expected_output
    end

    it 'reject withdraw if account is disabled' do
        allow(account).to receive(:account_status).and_return(:disabled)
        expected_output = { status: false, message: 'account is disabled', date: Date.today }
        expect(subject.withdraw(7, '1234', account)).to eq expected_output
    end

    it 'reject withdraw if the card is expired' do
        allow(account).to receive(:exp_date).and_return('09/18')
        expected_output = { status: false, message: 'card expired', date: Date.today }
        expect(subject.withdraw(6, '1234', account)).to eq expected_output
    end

    
end