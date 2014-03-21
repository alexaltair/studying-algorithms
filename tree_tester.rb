require "rspec"
require "./tree.rb"

describe Tree do
  context "which is empty" do
    before :each do
      @tree = Tree.new
    end

    it "has no root" do
      expect(@tree.root).to be_nil
    end

    it "has no parent" do
      expect(@tree.parent).to be_nil
    end

    it "responds to branches" do
      @tree.should respond_to :branches
    end

    it "has no branches" do
      expect(@tree.branches).to be_empty
    end

    it "has no leaves" do
      pending "#leaves not implemented" do
        expect(@tree.leaves).to be_empty
      end
    end

    it "is its own highest ancestor" do
      pending "#ancestor not implemented" do
        expect(@tree.highest_ancestor).to equal @tree
      end
    end

    it "when converted to array is nil" do
      expect(@tree.to_a).to be_nil
    end

  end

  context "with one node" do
    before :each do
      @tree = Tree.new(5)
    end

    it "has a root" do
      @tree.root.should be_instance_of Node
    end

    it "has no branches" do
      expect(@tree.branches).to be_empty
    end

    it "has its root as the only leaf" do
      pending "#leaves not implemented" do
        expect(@tree.leaves).to equal @tree.root
      end
    end

    it "when converted to array is its root's data" do
      pending "#to_a not implemented" do
        expect(@tree.to_a).to equal [@tree.root.data]
      end
    end

  end

end
