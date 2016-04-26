require_relative 'menu'
require_relative 'message'

class Takeaway
  attr_reader :menu
  attr_reader  :current_order   # - needs to be headen
  def initialize(menu: Menu)
    @menu = menu.new
    @current_order = []
    @cost = []
  end

  def see_menu
    @menu.menu_list
  end

  def order(item)
    fail "No such dish here!" unless see_menu.include?(item)
    @menu.menu_list.select do |k , v |
    @current_order <<  {k => v} if k == item
    @cost << v if k == item
    total_pay
    end
    @current_order
  end
  def remove(item)
    @current_order.delete_at(@current_order.find_index({item => @menu.menu_list[item]}))
    total_pay
    @current_order
  end

  def total
    total_pay
  end

  def checkout(total)
    fail "the total is not correct" if total != total_pay
    Message.new.send_sms "Thank you for the order! It will be de delivered by #{Time.new.hour + 1}:#{Time.new.min}"
  end

  private
  def total_pay
    @cost.inject(0){|sum,x| sum + x }
  end
end
