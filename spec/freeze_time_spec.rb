require File.join(File.dirname(__FILE__), %w[spec_helper])
require 'freeze_time'

describe FreezeTime do
  it 'should be included in Object' do
    Object.ancestors.should include(FreezeTime::FreezeTime)
    Object.should respond_to(:freeze_time)
  end
  
  it 'should freeze Time.now within the block' do
    freeze_time do |time|
      t1 = Time.now
      t2 = Time.now
      t1.should == t2
    end
  end

  it 'should not freeze Time.now outside of the block' do
    t1 = nil
    freeze_time do |time|
      t1 = Time.now
    end
    t1.should_not == Time.now
  end
end
