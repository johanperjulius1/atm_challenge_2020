require './lib/account.rb'
require 'date'

describe Account do
    it 'is expected to have :active status on initilization' do
        expect(subject.account_status).to eq :active
    end

    it 'deactivates account using the instance method' do
        subject.deactivate
        expect(subject.account_status).to eq :deactivated
    end

    it 'to check if pin code is 4 digits' do
        expect(subject.length_check(1000)).to eq 4
    end

    it 'expected to have an expiry date on initialize' do
        expected_date = Date.today.next_year(5).strftime("%m/%y")
        expect(subject.exp_date).to eq expected_date
    end

    let(:person) {instance_double('Person', name: 'connor')}
    subject { described_Class.new({owner: person}) }

    it 'is expected to have an owner' do
        expect(subject.owner).to eq person
    end
    
    it 'expected to raise error if no owner is set' do
        expect { describe_class.new }.to raise_error 'An account owner is required'
    end
end