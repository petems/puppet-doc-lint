require 'spec_helper'

describe PuppetDocLint::DocRunner do
  shared_examples "standard tests" do | file, klass |
    subject { setup(file) }

    it "result should be an array of PuppetDocLint::Result for #{file}" do
      subject.class.should be(Array)
      subject.first.class.should be(PuppetDocLint::Result)
    end

    it "file name should be defined for #{file}" do
      subject.first.file_name.should eql file
    end

    it "class should be define_rdoc for #{file}" do
      subject.first.class_name.should eql klass
    end

  end

  shared_examples "parameters" do |file, klass|
    subject { setup(file) }
    it "parameters should have 4 elements #{file}" do
      subject.first.parameters.count.should eql 4
    end
  end

  shared_examples "no parameters" do |file, klass|
    subject { setup(file) }
    it "parameters should have 0 elements #{file}" do
      subject.first.parameters.count.should eql 0
    end
  end

  shared_examples "rdoc" do |file, klass|
    subject { setup(file) }
    it "no_documentation should be false #{file}" do
      subject.first.no_documentation.should be_false
    end
  end

  shared_examples "no rdoc" do |file, klass|
    subject { setup(file) }
    it "no_documentation should be true #{file}" do
      subject.first.class_name.should eql klass
      subject.first.no_documentation.should be_true
    end
  end

  shared_examples "nothing undocumented" do |file, klass|
    subject { setup(file) }
    it "no_documentation should be true #{file}" do
      subject.first.class_name.should eql klass
      subject.first.documented_parameters.should_not eql []
    end
  end

  shared_examples "something undocumented" do |file, klass|
    subject { setup(file) }
    it "no_documentation should be true for #{file}" do
      subject.first.class_name.should eql klass
      subject.first.documented_parameters.should eql []
    end
  end

  describe "run on an directory" do
    puppet_files = Dir.glob('spec/manifests/**/*.pp')
    subject { setup_folder(puppet_files) }

    it "should return a multi-element array" do
      subject.class.should be(Array)
      subject.size.should eql(8)
    end

  end

  describe "manifest with parameters and rdoc" do
    file = 'spec/manifests/parameters_rdoc.pp'
    klass = 'parameters_rdoc'
    it_should_behave_like "standard tests", file, klass
    it_should_behave_like "parameters", file, klass
    it_should_behave_like "rdoc", file, klass
    it_should_behave_like "nothing undocumented", file, klass
  end

  describe "manifest with parameters and no rdoc" do
    file = 'spec/manifests/parameters_nordoc.pp'
    klass = 'parameters_nordoc'
    it_should_behave_like "standard tests", file, klass
    it_should_behave_like "parameters", file, klass
    it_should_behave_like "no rdoc", file, klass
    it_should_behave_like "something undocumented", file, klass
  end

  describe "manifest with no parameters and rdoc" do
    file = 'spec/manifests/noparameters_rdoc.pp'
    klass = 'noparameters_rdoc'
    it_should_behave_like "standard tests", file, klass
    it_should_behave_like "no parameters", file, klass
    it_should_behave_like "rdoc", file, klass
    it_should_behave_like "something undocumented", file, klass
  end

  describe "manifest with no parameters and no rdoc" do
    file = 'spec/manifests/noparameters_nordoc.pp'
    klass = 'noparameters_nordoc'
    it_should_behave_like "standard tests", file, klass
    it_should_behave_like "no parameters", file, klass
    it_should_behave_like "no rdoc", file, klass
    it_should_behave_like "something undocumented", file, klass
  end

  describe "define with rdoc" do
    file = 'spec/manifests/define_rdoc.pp'
    klass = 'define_rdoc'
    it_should_behave_like "standard tests", file, klass
    it_should_behave_like "rdoc", file, klass
    it_should_behave_like "nothing undocumented", file, klass
  end

  describe "define with no rdoc" do
    file = 'spec/manifests/define_nordoc.pp'
    klass = 'define_nordoc'
    it_should_behave_like "standard tests", file, klass
    it_should_behave_like "no rdoc", file, klass
    it_should_behave_like "something undocumented", file, klass
  end

end

