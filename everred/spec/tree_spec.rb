require "rspec"
require "./tree.rb"

describe Tree do
  context "which is empty" do
    before :each do
      @tree = Tree.new
    end

    it "has size one" do
      pending "#size not implemented" do
        expect(@tree.size).to equal 1
      end
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
      pending "#size not implemented" do
        expect(@tree.size).to equal 1
      end
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
      @tree = Tree.new(:mammalia,
        {
          prototheria: {
            platypoda: :ornithorhynchidae,
            tachyglossa: :tachyglossidae,
          },
          theriiformes: {
            allotheria: {
              multituberculata: {}
            },
            triconodonta: {},
            holotheria: {},
          },
        }
      )
    end
  end

end
