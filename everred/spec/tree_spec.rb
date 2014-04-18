require "rspec"
require "./tree.rb"
require "./spec/test_trees.rb"

describe Tree do
  context "which is empty" do
    before :each do
      @tree = Tree.new
    end

    it "has size one" do
      expect(@tree.size).to equal 1
    end

    it "has no root" do
      expect(@tree.root).to be_nil
    end

    it "responds to parent" do
      expect(@tree).to respond_to :parent
    end

    it "responds to branches" do
      expect(@tree).to respond_to :branches
    end

    it "has no branches" do
      expect(@tree.branches).to be_empty
    end

    it "is empty" do
      expect(@tree).to be_empty
    end

    it "indexed anywhere returns nil" do
      expect(@tree[0]).to be_nil
      expect(@tree[1]).to be_nil
      expect(@tree[5]).to be_nil
      expect(@tree[-1]).to be_nil
    end

    it "has one leaf" do
      pending "#leaves not implemented" do
        expect(@tree.leaves).to contain_exactly nil
      end
    end

    it "when converted to array is [nil]" do
      expect(@tree.to_a).to match_array [nil]
    end

  end

  context "with one node" do
    before :each do
      @tree = Tree.new(5)
    end

    it "has size one" do
      expect(@tree.size).to equal 1
    end

    it "has a root" do
      expect(@tree.root).not_to be_nil
    end

    it "has no branches" do
      expect(@tree.branches).to be_empty
    end

    it "has its root as the only leaf" do
      pending "#leaves not implemented" do
        expect(@tree.leaves).to eq [@tree.root]
      end
    end

    it "when converted to array is its root" do
      expect(@tree.to_a).to eq [@tree.root]
    end

  end

  context "with lots of nodes" do
    before :each do
      @tree = Tree::TAXONOMY
    end

    it "has the correct size" do
      expect(@tree.size).to eq 49
    end

    it "has the correct root" do
      expect(@tree.root).to eq :mammalia
    end

    it "has the correct branches" do
      expect(@tree.branches).not_to be_empty
      expect(@tree.branches).to include @tree[1]
      expect(@tree.branches.size).to eq 2
    end

    it "can be indexed deeply" do
      expect(@tree[1][2][2][0][0][0][0][0][0][0][0][4][0][0]).to be_a Tree
    end

    it "fails when indexed too deeply" do
      expect(@tree[1][2][2][0][0][0][0][0][0][0][0][4][0][0][0]).to be_nil
      expect(@tree[2]).to be_nil
      expect {@tree[1][2][2][0][0][0][0][0][0][0][0][4][0][0][0][0]}.to raise_error NoMethodError
      expect {@tree[2][0]}.to raise_error NoMethodError
    end
  end

end
