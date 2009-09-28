module FreezeTime
  VERSION = '0.1'
  module FreezeTime
    # Within the block, time is frozen.
    #   t1 = nil
    #   freeze_time do |time|
    #     t1 = Time.now
    #     sleep 1
    #     t2 = Time.now
    #     t1 == t2 # => true
    #   end
    #   t1 == Time.now # => false
    #
    # The value of Time.now is captured before the block is run and then all
    # subsequent calls to Time.now will yield the same Time object. After the
    # block, Time.now returns to its previous functionality.
    def freeze_time(&block) # :yields: time
      old_time = Time
      new_time = old_time.clone
      now = old_time.now
      class << new_time
        attr_accessor :now
      end
      new_time.now = now
      Object.send(:remove_const, :Time)
      Object.send(:const_set, :Time, new_time)
      block.call(now)
    ensure
      Object.send(:remove_const, :Time)
      Object.send(:const_set, :Time, old_time)
    end
  end
end

class Object
  extend FreezeTime::FreezeTime
  include FreezeTime::FreezeTime
end
