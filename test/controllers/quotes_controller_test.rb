require "test_helper"

class QuotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @team = @user.team
    @quotes = @team.quotes
    login_as @user
  end

  test "should get index" do
    get quotes_url
    assert_response :success
  end

  test "should show quote" do
    get quote_url(@quotes.last)
    assert_response :success
  end

  test "should create quote" do
    assert_difference("Quote.count") do
      post quotes_url, params: { quote: { first_name: "fist_name", last_name: "last_name", email: "quote@quote.com", phone: "+33600000000", product_id: @team.products.last.id, qualification_id: @team.qualifications.last.id } }
    end
    assert_redirected_to quote_path(@quotes.last)
  end

  test "should update quote" do
    quote = @quotes.last
    patch quote_url(quote), params: { quote: { first_name: "Updated", last_name: "Updated", email: "updated@updated.com", phone: "+33700000000", product_id: @team.products.first.id, qualification_id: @team.qualifications.first.id } }
    assert_redirected_to quote_path(quote)
    quote.reload
    assert_equal "Updated", quote.first_name
    assert_equal "Updated", quote.last_name
    assert_equal "updated@updated.com", quote.email
    assert_equal "+33700000000", quote.phone
    assert_equal @team.qualifications.first, quote.qualification
    assert_equal @team.products.first, quote.product
  end
end
