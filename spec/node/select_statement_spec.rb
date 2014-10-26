require "spec_helper"

describe Carel::Node::SelectStatement do


  context "#to_cql" do

    subject{ |example| example.description }
    def table(name); Carel::Node::Table.new(name); end
    def assert_cql(node); expect(node.to_cql).to eq(subject); end
    let(:users_table){ table(:users) }

    it "SELECT * FROM users" do
      assert_cql table(:users).select("*")
    end

    it "SELECT * FROM carel_development.users" do
      keyspace = Carel::Node::Keyspace.new(:carel_development)
      table = keyspace[:users]
      assert_cql table.select("*")
    end

    it "SELECT name FROM users" do
      assert_cql table(:users).select(:name)
    end

    it "SELECT name FROM users" do
      column = users_table[:name]
      assert_cql users_table.select(column)
    end

    it "SELECT DISTINCT name FROM users" do
      assert_cql users_table.select(:name).distinct
    end

    it "SELECT name AS login FROM users" do
      column = users_table[:name].as(:login)
      assert_cql users_table.select(column)
    end

    it "SELECT name, email FROM users" do
      assert_cql users_table.select(:name, :email)
    end

    it "SELECT name AS login, email FROM users" do
      login = users_table[:name].as(:login)
      assert_cql users_table.select(login, :email)
    end

    it "SELECT maxTimeuuid(created_at) FROM users" do
      created_at = users_table[:created_at]
      assert_cql users_table.select(created_at.function(:maxTimeuuid))
    end

    it "SELECT maxTimeuuid(created_at) AS created_timeuuid FROM users" do
      created_timeuuid = users_table[:created_at].function(:maxTimeuuid).as(:created_timeuuid)
      assert_cql users_table.select(created_timeuuid)
    end

    it "SELECT * FROM users WHERE name = 'chris'" do
      assert_cql users_table.select("*").where(users_table[:name].eq(:chris))
    end

    it "SELECT * FROM users WHERE id = 1" do
      assert_cql users_table.select("*").where(users_table[:id].eq(1))
    end

    it "SELECT * FROM users WHERE name = 'chris' AND id = 1" do
      name = users_table[:name]
      id = users_table[:id]
      assert_cql users_table.select("*").where(name.eq(:chris), id.eq(1))
    end

    it "SELECT * FROM users WHERE id > 1 ALLOW FILTERING" do
      id = users_table[:id]
      assert_cql users_table.select.where(id.gt(1)).allow_filtering
    end

    it "SELECT COUNT(*) FROM users" do
      assert_cql users_table.select(Carel::Node::Count.new)
    end

    it "SELECT COUNT(1) AS length FROM users" do
      assert_cql users_table.select(Carel::Node::Count.new(1).as(:length))
    end

    it "SELECT * FROM users ORDER BY name" do
      order = users_table[:name].order
      assert_cql users_table.select("*").order(order)
    end

    it "SELECT * FROM users ORDER BY name DESC" do
      order = users_table[:name].order.desc
      assert_cql users_table.select("*").order(order)
    end

    it "SELECT * FROM users ORDER BY name ASC, email DESC" do
      name_order = users_table[:name].order.asc
      email_order = Carel::Node::Order.new(:email).desc
      assert_cql users_table.select("*").order(name_order, email_order)
    end

    it "SELECT * FROM users LIMIT 10" do
      assert_cql users_table.select("*").limit(10)
    end



  end

end
