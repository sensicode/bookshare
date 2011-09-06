require 'test_helper'

class BanTest < ActiveSupport::TestCase
  def setup
    @alice = users(:alice)
    @bob = users(:bob)
    @charlie = users(:charlie)
  end

  test "admin bans a user" do
    @ban = Ban.new
    @ban.user = @bob
    @ban.banner = @alice
    @ban.reason = "Whatever."
    assert @ban.save
    assert @bob.banned?
  end

  test "non-admin can't ban a user" do
    @ban = Ban.new
    @ban.user = @alice
    @ban.banner = @bob
    @ban.reason = "Whatever."
    assert !@ban.save
    assert !@alice.banned?
  end

  test "can't ban yourself" do
    @ban = Ban.new
    @ban.user = @alice
    @ban.banner = @alice
    @ban.reason = "Whatever."
    assert !@ban.save
    assert !@alice.banned?
  end

  test "can't ban someone who's already banned" do
    # Ban a user
    @ban = Ban.new
    @ban.user = @bob
    @ban.banner = @alice
    @ban.reason = "Whatever."
    assert @ban.save
    assert @bob.banned?
    
    # Try to ban the same user again
    @ban2 = Ban.new
    @ban2.user = @bob
    @ban2.banner = @alice
    @ban2.reason = "Whatever."
    assert !@ban2.save
    assert @bob.banned?
  end

  test "can't ban an admin" do
    @ban = Ban.new
    @ban.user = @alice
    @ban.banner = @charlie
    @ban.reason = "Whatever."
    assert !@ban.save
    assert !@alice.banned?
  end

  test "unban a banned user" do
    # Ban a user
    @ban = Ban.new
    @ban.user = @bob
    @ban.banner = @alice
    @ban.reason = "Whatever."
    assert @ban.save
    assert @bob.banned?
    
    # Now unban them
    assert @bob.unban(@alice)
    assert !@bob.banned?
  end

  test "can't unban a user who's not banned" do
    assert !@bob.banned?
    assert !@bob.unban(@alice)
    assert !@bob.banned?
  end

end
