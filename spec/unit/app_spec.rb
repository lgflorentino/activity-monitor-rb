# frozen_string_literal: true

require "open3"
require "activity_monitor"

RSpec.describe "exe/am" do
  let(:root) do
    Pathname(__dir__).join("../..").realpath
  end

  def output
    Open3.capture3("exe/am #{args.join(" ")}", chdir: root)
  end

  context "no args" do
    let(:args) { [] }
    it "prints out usage" do
      expect(output[1].to_s).to include("generate")
    end
  end
end
