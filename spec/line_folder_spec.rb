require "threesmodel/line_folder"

describe LineFolder do

    before(:each) do
      @line_folder = LineFolder.new
    end

    it "can find wall in position zero" do
      expect([0,0,1,2].wall_index_of).to eq(0)
      expect([1,2,0,0].wall_index_of).to eq(0)
      expect([2,1,0,0].wall_index_of).to eq(0)
      expect([0,1,0,0].wall_index_of).to eq(0)
      expect([3,3,0,0].wall_index_of).to eq(0)
    end

    it "can find wall in position one" do
      expect([1,1,2,2].wall_index_of).to eq(1)
      expect([2,2,1,2].wall_index_of).to eq(1)
      expect([3,2,1,2].wall_index_of).to eq(1)
      expect([2,3,3,2].wall_index_of).to eq(1)
      expect([1,0,2,2].wall_index_of).to eq(1)
    end

    it "can find wall in position two" do
      expect([1,1,1,2].wall_index_of).to eq(2)
      expect([2,2,2,1].wall_index_of).to eq(2)
      expect([2,2,3,3].wall_index_of).to eq(2)
      expect([2,2,0,3].wall_index_of).to eq(2)
    end

    it "can fold when line has leading zeros" do
      expect(@line_folder.can_fold?([0,0,1,2])).to eq(true)
    end

    it "can not fold when line is all zeros" do
      expect(@line_folder.can_fold?([0,0,0,0])).to eq(false)
    end

    it "can not fold when line is all ones" do
      expect(@line_folder.can_fold?([1,1,1,1])).to eq(false)
    end

    it "can not fold when line is all twos" do
      expect(@line_folder.can_fold?([2,2,2,2])).to eq(false)
    end

    it "can fold when line has a one and a two adjacent" do
      expect(@line_folder.can_fold?([1,2,1,1])).to eq(true)
    end

    it "can fold when line has a two and a one adjacent" do
      expect(@line_folder.can_fold?([2,1,1,1])).to eq(true)
    end

    it "can fold over two equal numbers larger than 2" do
      expect(@line_folder.can_fold?([3,3,6,12])).to eq(true)
    end

    it "can not fold" do
      expect(@line_folder.can_fold?([2,0,0,0])).to eq(false)
      expect(@line_folder.can_fold?([24,3,6,0])).to eq(false)
      expect(@line_folder.can_fold?([1,6,2,0])).to eq(false)
      expect(@line_folder.can_fold?([24,12,2,3])).to eq(false)
    end

    it "can not even fold" do
      expect(@line_folder.can_fold?([6,2,0,0])).to eq(false)
      expect(@line_folder.can_fold?([12,6,0,0])).to eq(false)
      expect(@line_folder.can_fold?([1,1,3,0])).to eq(false)
      expect(@line_folder.can_fold?([6,1,12,2])).to eq(false)
    end

    it "folds undetectably when all zero line" do
      expect(@line_folder.fold([0,0,0,0])).to eq([0,0,0,0])
    end
    it "folds by shifting onto leading zeros" do
      expect(@line_folder.fold([0,0,1,2])).to eq([0,1,2,0])
    end

    it "folds by shifting onto zeros" do
      expect(@line_folder.fold([1,0,1,2])).to eq([1,1,2,0])
    end

    it "folds by adding one and two at a wall" do
      expect(@line_folder.fold([1,2,0,0])).to eq([3,0,0,0])
    end

    it "folds by adding one and two at a non foldable cell" do
      expect(@line_folder.fold([3,2,1,0])).to eq([3,3,0,0])
    end

    it "folds by adding equal numbers at a wall" do
      expect(@line_folder.fold([3,3,0,0])).to eq([6,0,0,0])
    end

    it "folds by adding equal numbers at a non foldable cell" do
      expect(@line_folder.fold([12,6,6,3])).to eq([12,12,3,0])
    end

    it "only folds first pair of equal numbers " do
      expect(@line_folder.fold([12,12,3,3])).to eq([24,3,3,0])
    end

    it "prioritizes leftwards folds" do
      expect(@line_folder.fold([1,2,0,3])).to eq([3,0,3,0])
    end

    it "considers to have the wall index at cell 3 for an all zero line" do
      expect([0,0,0,0].wall_index_of).to eq(3)
    end
    it "considers to have the wall index at cell 3 for an all ones line" do
      expect([1,1,1,1].wall_index_of).to eq(3)
    end
    it "considers to have the wall index at cell 3 for an all twos line" do
      expect([2,2,2,2].wall_index_of).to eq(3)
    end

    it "considers an line with trailing zeros to have wall index 3" do
      expect([2,0,0,0].wall_index_of).to eq(3)
    end

    it "considers an line with less trailing zeros to have wall index 3" do
      expect([2,2,0,0].wall_index_of).to eq(3)
    end

    it "considers an line with trailing ones to have wall index 3" do
      expect([3,1,1,1].wall_index_of).to eq(3)
    end

    it "considers an line with less trailing ones to have wall index 3" do
      expect([3,6,1,1].wall_index_of).to eq(3)
    end

    it "considers an line with trailing twos to have wall index 3" do
      expect([3,2,2,2].wall_index_of).to eq(3)
    end

    it "considers an line with less trailing twos to have wall index 3" do
      expect([3,6,2,2].wall_index_of).to eq(3)
    end
end
