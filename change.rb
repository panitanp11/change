require 'bigdecimal'

THAI_MONEY_SYSTEM = [
                      BigDecimal.new("1000"),
                      BigDecimal.new("500"),
                      BigDecimal.new("100"),
                      BigDecimal.new("50"),
                      BigDecimal.new("20"),
                      BigDecimal.new("10"),
                      BigDecimal.new("5"),
                      BigDecimal.new("2"),
                      BigDecimal.new("1"),
                      BigDecimal.new("0.5"),
                      BigDecimal.new("0.25")
                    ]

class Change

  attr_accessor :initial_amount

  def initialize(initial_amount)
    @initial_amount = BigDecimal.new(initial_amount.to_s)
  end

  def report
    remaining = @initial_amount
    count = 0

    THAI_MONEY_SYSTEM.each do |tm|
      while remaining >= tm
        count += 1
        remaining -= tm
      end

      type = tm >= 20 ? "note" : "coin"
      type = type + "s" unless count == 1

      puts "%5s of THB %8s %5s ; %8s remaining" % [count, tm.to_s("F"), type, remaining.to_s("F")]
      count = 0
    end
  end
end

c = Change.new(2688.75)
puts c.initial_amount
#puts THAI_MONEY_SYSTEM
c.report
