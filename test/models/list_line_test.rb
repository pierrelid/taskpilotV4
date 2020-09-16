require "test_helper"

class ListLineTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  setup do
    @team = teams(:one)
    VCR.insert_cassette(name)
  end

  teardown do
    VCR.eject_cassette
  end

  # step_execution

  test "step execution must execute email job is step is DelayStep" do
    delay_step = steps(:step_1_1_2)
    list = lists(:list_1_1)
    quote = quotes(:quote_1_1)
    list_line = ListLine.create(step: delay_step, quote: quote, list: list)
    perform_enqueued_jobs only: DelayJob do
      list_line.step_execution
      assert_performed_jobs 1
    end
  end

  test "step execution must execute email job is step is SmsStep" do
    sms_step = steps(:step_1_1_3)
    list = lists(:list_1_1)
    quote = quotes(:quote_1_1)
    list_line = ListLine.new(step: sms_step, quote: quote, list: list)
    perform_enqueued_jobs only: SendSmsJob do
      list_line.step_execution
      assert_performed_jobs 1
    end
  end

  test "step execution must execute email job is step is EmailStep" do
    email_step = steps(:step_1_1_1)
    list = lists(:list_1_1)
    quote = quotes(:quote_1_1)
    list_line = ListLine.new(step: email_step, quote: quote, list: list)
    perform_enqueued_jobs only: SendEmailJob do
      list_line.step_execution
      assert_performed_jobs 1
    end
  end

  test "step execution doesn't execute if list_line's step is not present" do
    list_line = ListLine.new
    assert_nil list_line.step_execution
  end

  # validation

  test "valid if step is not present" do
    list_line = ListLine.new
    list_line.valid?
    assert_empty list_line.errors[:step]
  end

  test "invalid if list_line alread exists" do
    list = @team.lists.last
    quote = Quote.find_by(team: @team, qualification: list.qualification, product: list.product)
    ListLine.create(list: list, quote: quote)
    list_line = ListLine.new(list: list, quote: quote)
    list_line.valid?
    assert_not list_line.errors[:list].empty?
  end

  test "valid if list_line, list scope quote doesn't exists" do
    list = @team.lists.last
    quote = Quote.find_by(team: @team, qualification: list.qualification, product: list.product)
    list_line = ListLine.new(list: list, quote: quote)
    list_line.valid?
    assert_empty list_line.errors[:list]
  end
end
