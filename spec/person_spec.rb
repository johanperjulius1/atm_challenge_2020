require './lib/person'
require './lib/atm'

describe Person do
  subject {described_class.new(name: 'emi')}

  it 'is expected to have :name on initialize' do
    expect(subject.name).not_to be nil
  end

  it 'is expected to raise an error if no name is set' do
    expect {described_class.new}.to raise error 'A name is required'
  end

  it 'is expected to have a :cash attribute with the value of 0 on initialize' do
    expect(subject.cash).to eq 0
  end

  it 'is expected to have a :account attribute' do
    expect(subject.account).to be nil
  end

  describe 'can create an Account' do
    before {subject.create_account }
    it 'of Account class' do
      expect(subject.account).to be_an_instance_of Account
    end

    it 'with himself as an owner' do
      expect(subject.account.owner).to be subject
    end
  end

  describe 'can manage funds if an account has been created' do
    let(:atm) { Atm.new }
    it 'can deposit funds' do
      expect(subject.deposit(100)).to.be_truthy
    end
  end

  describe 'can not manage funds if no account has been created' do
    it 'can not deposit funds' do
      expect(subject.deposit(100)).to raise_error(RuntimeError, 'No account prent')
    end
  end
end
