require "../spec_helper"

# About Method Visibility
#
# Crystal has three visibility levels: public, protected, and private.
# By default, methods are public. Private methods can only be called
# without a receiver. Protected methods can be called by the same class
# or subclasses.

class Account
  property balance : Int32

  def initialize(@balance : Int32)
  end

  # Public method (default)
  def deposit(amount : Int32)
    @balance += validated_amount(amount)
  end

  def withdraw(amount : Int32)
    @balance -= validated_amount(amount)
  end

  def transfer_to(other : Account, amount : Int32)
    withdraw(amount)
    other.receive_transfer(amount)
  end

  # Protected - can be called by same class and subclasses
  protected def receive_transfer(amount : Int32)
    @balance += amount
  end

  # Private methods - can only be called without explicit receiver
  private def validated_amount(amount : Int32) : Int32
    amount < 0 ? 0 : amount
  end

  private def log_transaction(type : String)
    "#{type}: #{@balance}"
  end

  def get_log(type : String)
    log_transaction(type)  # OK - no receiver
  end
end

class SavingsAccount < Account
  @interest_rate : Float64

  def initialize(balance : Int32, @interest_rate : Float64)
    super(balance)
  end

  def apply_interest
    interest = (@balance * @interest_rate).to_i
    receive_transfer(interest)  # Can call protected method from subclass
  end
end

class VisibilityDemo
  def public_method
    "public"
  end

  protected def protected_method
    "protected"
  end

  private def private_method
    "private"
  end

  def call_private
    private_method  # OK - called without receiver
  end

  def call_protected
    protected_method  # OK - called within same class
  end

  def call_on_other(other : VisibilityDemo)
    other.protected_method  # OK - same class can call protected
  end
end

describe "About Method Visibility" do
  it "knows public methods can be called from anywhere" do
    account = Account.new(100)
    account.deposit(50)
    account.balance.should eq(__)
  end

  it "knows private methods are called without receiver" do
    demo = VisibilityDemo.new
    demo.call_private.should eq(__)
  end

  it "knows protected methods can be called within the class" do
    demo = VisibilityDemo.new
    demo.call_protected.should eq(__)
  end

  it "knows protected methods can be called on same class instances" do
    demo1 = VisibilityDemo.new
    demo2 = VisibilityDemo.new
    demo1.call_on_other(demo2).should eq(__)
  end

  it "knows protected methods enable transfer patterns" do
    account1 = Account.new(100)
    account2 = Account.new(50)

    account1.transfer_to(account2, 30)

    account1.balance.should eq(__)
    account2.balance.should eq(__)
  end

  it "knows subclasses can call protected methods" do
    savings = SavingsAccount.new(1000, 0.1)
    savings.apply_interest
    savings.balance.should eq(__)  # 1000 + 100
  end

  it "knows private validates internal operations" do
    account = Account.new(100)
    account.deposit(-50)  # Negative amount gets validated to 0
    account.balance.should eq(__)
  end

  it "knows private methods can be used for logging" do
    account = Account.new(100)
    account.get_log("deposit").should eq(__)
  end
end
