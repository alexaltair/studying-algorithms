require "rspec"
require "./tree.rb"
require "./spec/test_trees.rb"

describe Traversal do

  find_block = Proc.new{|value, subtree| subtree.root == value }.curry

  context "which is empty" do
    before :each do
      @tree = Tree.new
    end

    it "when searched for root returns itself" do
      Tree::TRAVERSAL_ALGORITHMS.each do |algorithm|
        expect(@tree.send(algorithm).find(&find_block.call(@tree.root))).to eq @tree
      end
    end

    it "when searched for anything else returns nil" do
      Tree::TRAVERSAL_ALGORITHMS.each do |algorithm|
        expect(@tree.send(algorithm).find(&find_block.call(1))).to be_nil
      end

      Tree::TRAVERSAL_ALGORITHMS.each do |algorithm|
        expect(@tree.send(algorithm).find(&find_block.call("foobar"))).to be_nil
      end
    end

  end

  context "with one node" do
    before :each do
      @tree = Tree.new(5)
    end

    it "when searched for root returns itself" do
      Tree::TRAVERSAL_ALGORITHMS.each do |algorithm|
        expect(@tree.send(algorithm).find(&find_block.call(@tree.root))).to eq @tree
      end
    end

    it "when searched for anything else returns nil" do
      Tree::TRAVERSAL_ALGORITHMS.each do |algorithm|
        expect(@tree.send(algorithm).find(&find_block.call(1))).to be_nil
      end

      Tree::TRAVERSAL_ALGORITHMS.each do |algorithm|
        expect(@tree.send(algorithm).find(&find_block.call("foobar"))).to be_nil
      end
    end

  end

  context "including duplicate root values" do
    before :each do
      @tree = Tree::DUPLICATES
    end

    it "when searched with pre-order returns upper-left nodes" do
      expect(@tree.pre_order.find(&find_block.call(2))).to eq @tree[0][0]
    end

    it "when searched with post-order returns lower nodes" do
      expect(@tree.post_order.find(&find_block.call(2))).to eq @tree[0][0][0]
    end

    it "when searched bread-first returns upper-right nodes" do
      expect(@tree.breadth_first.find(&find_block.call(2))).to eq @tree[1]
    end
  end

  context "with lots of nodes" do
    context "all unique" do
      before :each do
        @tree = Tree::TAXONOMY
      end

      it "when searched for root returns itself" do
        Tree::TRAVERSAL_ALGORITHMS.each do |algorithm|
          expect(@tree.send(algorithm).find(&find_block.call(@tree.root))).to eq @tree
        end
      end

      it "returns the same value no matter the traversal algorithm" do
        Tree::TRAVERSAL_ALGORITHMS.each do |algorithm|
          expect(@tree.send(algorithm).find(&find_block.call(:mimotonidae))).to eq @tree[1][2][2][0][0][0][0][0][0][0][0][4][0][0]
        end
      end

    end

    context "with many duplicates" do
      before :each do
        @tree = Tree::RANDOM_NUMBERS
      end

      it "when searched with pre-order returns upper-left nodes" do
        expect(@tree.pre_order.find(&find_block.call(0))).to be_a Tree
      end

      it "when searched with post-order returns lower nodes" do
        expect(@tree.post_order.find(&find_block.call(1))).to be_a Tree
      end

      it "when searched bread-first returns upper-right nodes" do
        expect(@tree.breadth_first.find(&find_block.call(2))).to be_a Tree
      end
    end


  end

end
