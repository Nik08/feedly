require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @status = statuses("Example status")
    @comment = @status.comments.build(body: "Example comment")
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "status id should be present" do
    @comment.status_id = nil
    assert_not @comment.valid?
  end

  test "content should be present" do
    @status.body = "   "
    assert_not @status.valid?
  end

  test "content should be at most 140 characters" do
    @status.body = "a" * 141
    assert_not @status.valid?
  end
end
