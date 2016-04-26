class Menu
attr_reader :menu_list
  def initialize
    @menu_list = {chicken_foo_young: 4,
    chilli_spicy_chicken: 3,
    crispy_lamb: 5,
    kung_po_lamb: 6,
    stir_fried_scallops: 8 }
  end

  def display_menu
    @menu_list.dup
  end
  def add(dish, price)
  @menu_list[dish]=price
end

def delete(dish)
  @menu_list.reject!{ |k| k == dish}
end
end
