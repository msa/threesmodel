require_relative "../lib/line_folder"

describe LineFolder do

    before(:each) do
      @line_folder = LineFolder.new
    end

    it "can fold when line has leading zeros" do
      @line_folder.can_fold?([0,0,1,2]).should eq(true)
    end

    it "can not fold when line is all ones" do
      @line_folder.can_fold?([1,1,1,1]).should eq(false)
    end

    it "can fold when line has a one and a two adjacent" do
      @line_folder.can_fold?([1,2,1,1]).should eq(true)
    end

    it "can fold when line has a two and a one adjacent" do
      @line_folder.can_fold?([2,1,1,1]).should eq(true)
    end

    it "can fold over two equal numbers larger than 2" do
      @line_folder.can_fold?([3,3,6,12]).should eq(true)
    end

    it "folds undetectably when all zero line" do
      @line_folder.fold([0,0,0,0]).should eq([0,0,0,0])
    end
    it "folds by shifting onto leading zeros" do
      @line_folder.fold([0,0,1,2]).should eq([0,1,2,0])
    end

    it "folds by shifting onto zeros" do
      @line_folder.fold([1,0,1,2]).should eq([1,1,2,0])
    end

    it "folds by adding one and two at a wall" do
      @line_folder.fold([1,2,0,0]).should eq([3,0,0,0])
    end

    it "folds by adding one and two at a non foldable cell" do
      @line_folder.fold([3,2,1,0]).should eq([3,3,0,0])
    end

    it "folds by adding equal numbers at a wall" do
      @line_folder.fold([3,3,0,0]).should eq([6,0,0,0])
    end

    it "folds by adding equal numbers at a non foldable cell" do
      @line_folder.fold([12,6,6,3]).should eq([12,12,3,0])
    end

    it "only folds first pair of equal numbers " do
      @line_folder.fold([12,12,3,3]).should eq([24,3,3,0])
    end

end
