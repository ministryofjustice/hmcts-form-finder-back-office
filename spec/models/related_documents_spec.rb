require 'spec_helper'

describe "Linked Documents relationship" do

  before(:all) do
    @kanye = FactoryGirl.create(:artist, :name => 'Kanye West')
    @jz = FactoryGirl.create(:artist, :name => 'Jay Z')
    @watch_the_throne = FactoryGirl.create(:release, :name => 'Watch the Throne')
    @dropout = FactoryGirl.create(:release, :name => 'The College Dropout')


  end

  it "should recognise when an artist has no releases" do
    @kanye.releases.count.should == 0
  end

  it "should handle an artist with a release" do
    @kanye.releases << @dropout
    @kanye.releases.count.should == 1
  end

  # (testing 2-way fixup)
  it "should automatically know a release's artist" do
    @kanye.releases << @dropout
    @dropout.artists.count.should == 1
  end

  it "should hanlde an artist collaboration" do
    @kanye.releases << @watch_the_throne
    @jz.releases << @watch_the_throne

    @watch_the_throne.artists.count.should == 2
  end

end