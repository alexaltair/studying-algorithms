require "rspec"
require "./tree.rb"
require "./spec/test_trees.rb"

describe Traversal do
  context "which is empty" do
    before :each do
      @tree = Tree.new
    end

    it "when searched for root returns itself" do
      Tree::TRAVERSAL_ALGORITHMS.each do |algorithm|
        expect(@tree.search_for(@tree.root, algorithm)).to eq @tree
      end
    end

    it "when searched for anything else returns nil" do
      Tree::TRAVERSAL_ALGORITHMS.each do |algorithm|
        expect(@tree.search_for(1, algorithm)).to be_nil
      end

      Tree::TRAVERSAL_ALGORITHMS.each do |algorithm|
        expect(@tree.search_for("foobar", algorithm)).to be_nil
      end
    end

  end

  context "with one node" do
    before :each do
      @tree = Tree.new(5)
    end

    it "when searched for root returns itself" do
      Tree::TRAVERSAL_ALGORITHMS.each do |algorithm|
        expect(@tree.search_for(@tree.root, algorithm)).to eq @tree
      end
    end

    it "when searched for anything else returns nil" do
      Tree::TRAVERSAL_ALGORITHMS.each do |algorithm|
        expect(@tree.search_for(1, algorithm)).to be_nil
      end

      Tree::TRAVERSAL_ALGORITHMS.each do |algorithm|
        expect(@tree.search_for("foobar", algorithm)).to be_nil
      end
    end

  end

  context "including duplicate root values" do
    before :each do
      @tree = Tree::DUPLICATES
    end

    it "when searched with pre-order returns upper-left nodes" do
      expect(@tree.search_for(2, :pre_order)).to eq @tree[0][0]
    end

    it "when searched with post-order returns lower nodes" do
      expect(@tree.search_for(2, :post_order)).to eq @tree[0][0][0]
    end

    it "when searched bread-first returns upper-right nodes" do
      expect(@tree.search_for(2, :breadth_first)).to eq @tree[1]
    end
  end

  context "with lots of nodes" do
    context "all unique" do
      before :each do
        @tree = Tree::TAXONOMY
      end

      it "when searched for root returns itself" do
        Tree::TRAVERSAL_ALGORITHMS.each do |algorithm|
          expect(@tree.search_for(@tree.root, algorithm)).to eq @tree
        end
      end

      it "returns the same value no matter the traversal algorithm" do
        Tree::TRAVERSAL_ALGORITHMS.each do |algorithm|
          expect(@tree.search_for(:mimotonidae, algorithm)).to eq @tree[1][2][2][0][0][0][0][0][0][0][0][4][0][0]
        end
      end

    end

    context "with many duplicates" do
      before :each do
        @tree = Tree::RANDOM_NUMBERS
      end

      it "when searched with pre-order returns upper-left nodes" do
        expect(@tree.search_for(0, :pre_order)).to be_a Tree
      end

      it "when searched with post-order returns lower nodes" do
        expect(@tree.search_for(1, :post_order)).to be_a Tree
      end

      it "when searched bread-first returns upper-right nodes" do
        expect(@tree.search_for(2, :breadth_first)).to be_a Tree
      end
    end


  end

end
