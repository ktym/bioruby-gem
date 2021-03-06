require 'helper'
require 'fileutils'

class TestBiorubyGem < Test::Unit::TestCase
  TEST_DIR = 'test/int_test'
  def setup
    #check and create test directory
     FileUtils.rm_rf(TEST_DIR) if Dir.exist?(TEST_DIR)
     Dir.mkdir TEST_DIR
  end
  
  def teardown
    #check and remove tested directory
    FileUtils.rm_rf TEST_DIR if Dir.exist?(TEST_DIR)
  end
  

  def test_create_basic_project
    project_name = "integration"
    Dir.chdir(TEST_DIR) do
      application_exit = Bio::Gem::Generator::Application.run!(project_name)
      files_tested = %W(Gemfile lib lib/bio-#{project_name}.rb LICENSE.txt Rakefile README.rdoc test test/helper.rb test/test_bio-#{project_name}.rb).map do |file_name_to_test|
        File.exist?(File.join("bioruby-#{project_name}",file_name_to_test))
      end
      assert_equal [true, true, true, true, true, true, true, true, true], files_tested
    end

  end
  # should "probably rename this file and start testing for real" do
  #   flunk "hey buddy, you should probably rename this file and start testing for real"
  # end
end
