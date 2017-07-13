require "spec_helper"

describe CreateImage do
  describe "#exec" do
    it "returns a new pixel array if arguments are valid" do
      allow_any_instance_of(Bitmap).to receive(:rows).and_return(2)
      allow_any_instance_of(Bitmap).to receive(:columns).and_return(2)
      create_image = described_class.new(Bitmap.new, ["2", "2"])

      expect(create_image.exec).to match_array([["O", "O"], ["O", "O"]])
    end

    it "raises out of bounds exception if arguments are invalid" do
      create_image = described_class.new(Bitmap.new, [])

      expect{ create_image.exec }.to(
        raise_error(/out of bounds needs to be between 1 to 250/)
      )
    end
  end
end
