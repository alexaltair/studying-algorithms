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

    it "responds to branches" do
      @tree.should respond_to :branches
    end

    it "has no branches" do
      expect(@tree.branches).to be_empty
    end

    it "has one leaf" do
      pending "#leaves not implemented" do
        expect(@tree.leaves).to eq [nil]
      end
    end

    it "when converted to array is [nil]" do
      expect(@tree.to_a).to eq [nil]
    end

  end

  context "with one node" do
    before :each do
      @tree = Tree.new(5)
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

end
