require 'spec_helper'

describe 'define_rdoc' do
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
    subject[0].no_documentation.should be_false
  end

  it 'documented parameters' do
    subject[0].documented_parameters.should eql ["param_one"]
  end

  it 'undocumented_parameters parameters' do
    subject[0].undocumented_parameters.should eql ["param_two", "param_three", "param_four"]
  end

end

describe 'elasticsearch' do
  file = 'spec/manifests/elasticsearch.pp'  
  subject { setup(file) }

  it 'result should be an array of PuppetDocLint::Result' do
    subject.class.should be(Array)
    subject[0].class.should be(PuppetDocLint::Result)
  end

  it 'file name should be defined' do
    subject[0].file_name.should eql 'spec/manifests/elasticsearch.pp'
  end
  
  it 'class should be define_rdoc ' do
    subject[0].class_name.should eql 'elasticsearch'
  end

  it 'all parameters should be defined' do
    subject[0].parameters.should eql ["ensure", "status", "restart_on_change",
      "autoupgrade", "version", "package_provider", "package_url", "package_dir",
     "purge_package_dir", "elasticsearch_user", "elasticsearch_group", 
     "purge_confdir", "service_provider", "init_defaults", "init_defaults_file", 
     "init_template", "confdir", "datadir", "plugindir", "plugintool", "java_install", 
     "java_package", "manage_repo", "repo_version"]
  end


  it 'documented parameters' do
    subject[0].documented_parameters.should eql ["ensure", "status", "restart_on_change",
      "autoupgrade", "version", "confdir", "plugindir", "plugintool"]
  end

  it 'undocumented_parameters parameters' do
    subject[0].undocumented_parameters.should eql ["package_provider", "package_url", 
      "package_dir", "purge_package_dir", "elasticsearch_user", 
      "elasticsearch_group", "purge_confdir", "service_provider", 
      "init_defaults", "init_defaults_file", "init_template", "datadir", 
      "java_install", "java_package", "manage_repo", "repo_version"]
  end

end
