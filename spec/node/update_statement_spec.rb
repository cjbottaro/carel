require "spec_helper"

describe Carel::Node::UpdateStatement do

  context "#to_cql" do

    subject{ |example| example.description }
    let(:keyspace){ Carel::Node::Keyspace.new(:carel_development) }
    let(:users_table){ table(:users) }
    let(:favorites){ users_table[:favorites] }
    let(:colors){ users_table[:colors] }
    let(:items){ users_table[:items] }

    it "UPDATE users SET name = 'chris', age = 34 WHERE id = 1" do
      name = users_table[:name]
      age = users_table[:age]
      id = users_table[:id]

      assert_cql users_table.update(name => :chris, age => 34).where(id.eq(1))
    end

    it "UPDATE users SET name = 'chris', age = 34 WHERE id = 1" do
      assert_cql users_table.update(name: :chris, age: 34).where(id: 1)
    end

    # Maps

    it "UPDATE users SET favorites = {'color' : 'red'}" do
      assert_cql users_table.update(favorites => { color: :red })
    end

    it "UPDATE users SET favorites['color'] = 'red'" do
      assert_cql users_table.update(favorites.at(:color) => :red)
    end

    it "UPDATE users SET favorites = favorites + {'color' : 'blue'}" do
      assert_cql users_table.update(favorites.plus => { color: :blue })
    end

    # Sets

    it "UPDATE users SET colors = {'red', 'blue'}" do
      assert_cql users_table.update(colors => Set.new(%w[red blue]))
    end

    it "UPDATE users SET colors = colors + {'green', 'black'}" do
      assert_cql users_table.update(colors.plus => Set.new(%w[green black]))
    end

    it "UPDATE users SET colors = colors - {'red', 'blue'}" do
      assert_cql users_table.update(colors.minus => Set.new(%w[red blue]))
    end

    # Lists

    it "UPDATE users SET items = [1, 2, 3]" do
      assert_cql users_table.update(items => [1, 2, 3])
    end

    it "UPDATE users SET items[1] = 5" do
      assert_cql users_table.update(items.at(1) => 5)
    end

    it "UPDATE users SET items = items + [5, 6, 7]" do
      assert_cql users_table.update(items.plus => [5, 6, 7])
    end

    it "UPDATE users SET items = items - [5, 6, 7]" do
      assert_cql users_table.update(items.minus => [5, 6, 7])
    end

    it "UPDATE users SET items = [5, 6, 7] + items" do
      assert_cql users_table.update(items.prepend => [5, 6, 7])
    end

  end

end
