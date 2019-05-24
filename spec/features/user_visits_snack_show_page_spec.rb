require 'rails_helper'

describe 'as a visitor' do
  describe 'when I visit the snack show page' do
    it 'shows info about the snacks' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      lodos  = owner.machines.create(location: "Lodos")
      snack_1 = Snack.create(name: 'White Castle Burger', price: 4, machine: [dons])
      snack_2 = Snack.create(name: 'Pop Rocks', price: 2, machine: [dons, lodos])
      snack_3 = Snack.create(name: 'Flaming Hot Cheetos', price: 1, machine: [dons, lodos])

      visit snack_path(snack)

      expect(page).to have_content(snack_1.name)
      expect(page).to have_content(snack_1.price)
      expect(page).to_not have_content(snack_2.name)
      expect(page).to_not have_content(snack_3.name)
      expect(page).to have_content(dons.location)
      expect(page).to have_content(lodos.location)
    end
  end
end
