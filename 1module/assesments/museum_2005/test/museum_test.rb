require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/museum'
require './lib/patron'
require './lib/exhibit'
require 'pry'


class MuseumTest < Minitest::Test
  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})
    @patron_1 = Patron.new("Bob", 10)
    @patron_2 = Patron.new("Sally", 20)
    @patron_3 = Patron.new("Johnny", 5)
  end

  def setup_museum
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    @patron_1.add_interest("Gems and Minerals")
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_2.add_interest("Dead Sea Scrolls")
    @patron_3.add_interest("Dead Sea Scrolls")
    @dmns.admit(@patron_1)
    @dmns.admit(@patron_2)
    @dmns.admit(@patron_3)
  end

  def test_it_exists
    assert_instance_of Museum, @dmns
  end

  def test_it_has_attributes
    assert_equal "Denver Museum of Nature and Science", @dmns.name
    assert_equal [], @dmns.exhibits
  end

  def test_it_adds_exhibit
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)

    assert_equal [@gems_and_minerals, @dead_sea_scrolls, @imax], @dmns.exhibits
  end

  def test_it_recommends_exhibits
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")
    @patron_2.add_interest("IMAX")

    assert_equal [@gems_and_minerals, @dead_sea_scrolls] , @dmns.recommend_exhibits(@patron_1)
    assert_equal [@imax], @dmns.recommend_exhibits(@patron_2)
  end

  def test_it_returns_patrons_by_exhibit_interest
    setup_museum

    assert_equal [@patron_1, @patron_2, @patron_3], @dmns.patrons
    expected = {
      @gems_and_minerals => [@patron_1],
      @dead_sea_scrolls => [@patron_1, @patron_2, @patron_3],
      @imax => []
    }
    assert_equal expected, @dmns.patrons_by_exhibit_interest
  end

  def test_it_returns_ticket_lottery_contestants
    setup_museum

    assert_equal [@patron_1, @patron_3], @dmns.ticket_lottery_contestants(@dead_sea_scrolls)
  end

  def test_it_draws_lottery_winner
    setup_museum

    assert_nil @dmns.draw_lottery_winner(@gems_and_minerals)
    @dmns.stubs(:draw_lottery_winner).returns("Johny")
    assert_equal "Johny", @dmns.draw_lottery_winner(@dead_sea_scrolls)
  end

  def test_it_announces_lottery_winner
    setup_museum
    assert_equal "No winners for this lottery", @dmns.announce_lottery_winner(@imax)
    @dmns.stubs(:draw_lottery_winner).returns("Bob")
    assert_equal "Bob has won the Dead Sea Scrolls exhibit lottery", @dmns.announce_lottery_winner(@dead_sea_scrolls)
  end

  def test_patrons_can_attend_exhibits
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@imax)
    @dmns.add_exhibit(@dead_sea_scrolls)
    tj = Patron.new("TJ", 7)
    tj.add_interest("IMAX")
    tj.add_interest("Dead Sea Scrolls")
    @dmns.admit(tj)
    assert_equal 7, tj.spending_money

    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("IMAX")
    @dmns.admit(@patron_1)
    assert_equal 0, @patron_1.spending_money

    @patron_2.add_interest("IMAX")
    @patron_2.add_interest("Dead Sea Scrolls")
    @dmns.admit(@patron_2)
    assert_equal 5, @patron_2.spending_money

    morgan = Patron.new("Morgan", 15)
    morgan.add_interest("Gems and Minerals")
    morgan.add_interest("Dead Sea Scrolls")
    @dmns.admit(morgan)
    assert_equal 5, morgan.spending_money
  end

  def test_it_returns_revenue
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@imax)
    @dmns.add_exhibit(@dead_sea_scrolls)
    tj = Patron.new("TJ", 7)
    tj.add_interest("IMAX")
    tj.add_interest("Dead Sea Scrolls")
    @dmns.admit(tj)
    assert_equal 7, tj.spending_money

    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("IMAX")
    @dmns.admit(@patron_1)
    assert_equal 0, @patron_1.spending_money

    @patron_2.add_interest("IMAX")
    @patron_2.add_interest("Dead Sea Scrolls")
    @dmns.admit(@patron_2)
    assert_equal 5, @patron_2.spending_money

    morgan = Patron.new("Morgan", 15)
    morgan.add_interest("Gems and Minerals")
    morgan.add_interest("Dead Sea Scrolls")
    @dmns.admit(morgan)
    assert_equal 5, morgan.spending_money

    assert_equal 35, @dmns.revenue
  end

  def test_it_returns_patrons_of_exhibits
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@imax)
    @dmns.add_exhibit(@dead_sea_scrolls)
    tj = Patron.new("TJ", 7)
    tj.add_interest("IMAX")
    tj.add_interest("Dead Sea Scrolls")
    @dmns.admit(tj)
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("IMAX")
    @dmns.admit(@patron_1)
    @patron_2.add_interest("IMAX")
    @patron_2.add_interest("Dead Sea Scrolls")
    @dmns.admit(@patron_2)
    morgan = Patron.new("Morgan", 15)
    morgan.add_interest("Gems and Minerals")
    morgan.add_interest("Dead Sea Scrolls")
    @dmns.admit(morgan)

    expected = {
      @gems_and_minerals => [morgan],
      @imax => [@patron_2],
      @dead_sea_scrolls => [@patron_1, morgan]
    }
   
    assert_equal expected, @dmns.patrons_of_exhibits
  end

end
