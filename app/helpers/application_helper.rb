module ApplicationHelper
  def usd(cents)
    dollars = cents.to_f / 100
    number_to_currency(dollars, precision: 2)
  end
end
