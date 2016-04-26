require 'menu'

describe Menu do
  subject(:menu) {described_class.new}
  let(:menu_actual) { double(:dish, name: :chicken_foo_young, price: 4) }


  describe '#initialize' do
    it "has a hash of dishes names and prices at the start" do
      expect(menu.menu_list).to be_a Hash
    end
  end
  describe '#display_menu' do
    it "displays the name of the dishes" do
      expect(menu.display_menu).to include :chicken_foo_young
    end
  end
  describe '#add' do
    it "adds a new dish and it's price to the menu" do
      new_item = {:fish=> 2}
      menu.add(:fish, 2)
      expect(menu.menu_list).to include(:fish=> 2)
    end
  end
  describe '#delete' do
    it "deletes the item from the menu" do
      item_to_delete = {:fish=> 2}
      menu.delete(:fish)
      expect(menu.menu_list).to_not include(:fish=> 2)
    end
  end
end
