require "spec_helper"

describe Carel::Node::InsertStatement do

  context "#to_cql" do

    subject{ |example| example.description }

    let(:keyspace){ Carel::Node::Keyspace.new(:carel_development) }
    let(:users_table){ table(:users) }

    it "INSERT INTO users (id, name) VALUES (1, 'chris')" do
      id = users_table[:id]
      assert_cql users_table.insert(id, :name).values(1, "chris")
    end

    it "INSERT INTO carel_development.users (id) VALUES (1)" do
      users_table = keyspace[:users]
      assert_cql users_table.insert(:id).values(1)
    end

    it "INSERT INTO users (id) VALUES (1) USING TTL 86400" do
      assert_cql users_table.insert(:id).values(1).ttl(86400)
    end

    it "INSERT INTO users (id) VALUES (1) USING TTL 86400 AND TIMESTAMP 12345" do
      assert_cql users_table.insert(:id).values(1).ttl(86400).timestamp(12345)
    end

    it "INSERT INTO users (id, favorites) VALUES (1, {'color' : 'red', 'animal' : 'dog'})" do
      assert_cql users_table.insert(:id, :favorites).values(1, "color" => "red", "animal" => "dog")
    end

    it "INSERT INTO users (id, points) VALUES (1, {1, 2, 3})" do
      assert_cql users_table.insert(:id, :points).values(1, Set.new([1, 2, 3]))
    end

    it "INSERT INTO users (id, colors) VALUES (1, ['red', 'black'])" do
      assert_cql users_table.insert(:id, :colors).values(1, ["red", "black"])
    end

  end

end
