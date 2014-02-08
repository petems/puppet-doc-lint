require 'spec_helper'

def setup(file)
  run = PuppetDocLint::Runner.new
  manifests = [ file ]
  run.run(manifests)
end

describe PuppetDocLint::DocRunner do
  file = 'spec/manifests/define_rdoc.pp'  
  subject { setup(file) }

  it 'result should be an array of PuppetDocLint::Result' do
    subject.class.should be(Array)
    subject[0].class.should be(PuppetDocLint::Result)
  end

  it 'file name should be defined' do
    subject[0].file_name.should eql 'spec/manifests/define_rdoc.pp'
  end
  
  it 'class should be define_rdoc ' do
    subject[0].class_name.should eql 'define_rdoc'
  end

  it 'all parameters should be defined' do
    subject[0].parameters.should eql ["param_one", "param_two", "param_three", "param_four"]
  end

  it 'no documentation is nil' do
    subject[0].no_documentation.should be_nil
  end

  it 'documented parameters' do
    subject[0].documented_parameters.should eql ["param_one"]
  end

  it 'undocumented_parameters parameters' do
    subject[0].undocumented_parameters.should eql ["param_two", "param_three", "param_four"]
  end

end
