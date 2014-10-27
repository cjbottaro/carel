require "spec_helper"

describe Carel::Node::WhereClause do

  context "#to_cql" do

    subject{ |example| example.description }
    def assert_cql(node); expect(node.to_cql).to eq(subject); end
    def column(name); Carel::Node::Column.new(nil, name); end
    def where(*args); Carel::Node::WhereClause.new(*args); end

    it "id = 1 AND name = 'chris'" do
      id = column(:id)
      name = column(:name)
      assert_cql where(id.eq(1), name.eq(:chris))
    end

    it "id = 1 AND name = 'chris'" do
      id = column(:id)
      name = column(:name)
      assert_cql where(id => 1, name => :chris)
    end

    it "id = 1 AND name = 'chris'" do
      assert_cql where(id: 1, name: :chris)
    end

  end

end