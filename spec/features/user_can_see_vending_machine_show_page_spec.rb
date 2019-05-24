# frozen_string_literal: true

require 'rails_helper'

describe 'as a visitor' do
  describe 'when I visit the vending machine show page' do
    it 'displays the names and prices of all snacks in that machine' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      snack_1 = Snack.create(name: 'White Castle Burger', price: 4, machine: dons)
      snack_2 = Snack.create(name: 'Pop Rocks', price: 2, machine: dons)
      snack_3 = Snack.create(name: 'Flaming Hot Cheetos', price: 1, machine: dons)

      visit machine_path(dons)
      expect(page).to have_content(snack_1.name)
      expect(page).to have_content(snack_2.name)
      expect(page).to have_content(snack_3.name)
    end

    it 'displays average price of snacks in machine' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      snack_1 = Snack.create(name: 'White Castle Burger', price: 4, machine: dons)
      snack_2 = Snack.create(name: 'Pop Rocks', price: 2, machine: dons)
      snack_3 = Snack.create(name: 'Flaming Hot Cheetos', price: 1, machine: dons)

      visit machine_path(dons)

      expect(page).to have_content("Average price: #{dons.average_snack_price}")
    end
  end
end
