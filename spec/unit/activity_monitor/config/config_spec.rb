
RSpec.describe ActivityMonitor::Config do

  let(:cfg) do
    ActivityMonitor::Config.new(path: (Pathname(__FILE__).dirname.join("../../../test-data/app-root/config/config.rb").realpath))
  end
  
  let(:cfg_modified) do
    ActivityMonitor::Config.new(renv: {"AM_ENV" => "test-env"})
  end

  it "can be instantiated" do
    expect(cfg).to be_a_kind_of(ActivityMonitor::Config::Merged)
  end
  
  it "can update the user defined file location" do
    expect(cfg.config[:user_config_file].to_s).to eq(Pathname(__FILE__).dirname.join("../../../test-data/app-root/config/config.rb").realpath.to_s)
  end

  it "user_config_file setting cannot be a string" do
    expect{cfg.user_config_file=("specular reflection")}.to raise_error(ActivityMonitor::Errors::TypeError)
  end
  
  # The order of the tests matters with finalising an instance 
  it "can be finalised" do
    expect(cfg.finalised?).to equal(true)
  end

  it "correctly uses a user defined config block file" do
    expect(cfg.config[:enabled_services][:bitbucket][:secret]).to eq("lunar wilderness")
    expect(cfg.config[:enabled_services][:codeberg][:secret]).to eq("astral body")
    expect(cfg.config[:enabled_services][:github][:secret]).to eq("extremophile elite")
    expect(cfg.config[:enabled_services][:gitlab][:secret]).to eq("mass generator")
  end

  it "can get environment from the shell environment variables" do

    expect(cfg_modified.config[:env]).to eq("test-env")
  end

end
