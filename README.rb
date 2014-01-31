cc_validation
=============

cut down on Customer Service typos by validating initial input  

class CreditCard
  def initialize(cardnum)
    @cardnum = cardnum.split("")
    raise ArgumentError unless @cardnum.length == 16
  end
  
  def card_total(cardnum)
    @cardnum.each_index do |index|
      @cardnum[index] = @cardnum[index].to_i
        @cardnum[index] *= 2 if index.even?
    end

    luhn = @cardnum.join.split("")
    total = 0
    luhn.each {|num| total += num.to_i }
    
    @total = total
  end

  def check_card
    @total % 10 == 0
  end
end

cc = CreditCard.new("4408041234567892")
p cc.card_total("4408041234567892")
p cc.check_card

cc = CreditCard.new("4408041234567893")
p cc.card_total("4408041234567893")
p cc.check_card

cc = CreditCard.new("5462130014560325")
p cc.card_total("5462130014560325")
p cc.check_card
