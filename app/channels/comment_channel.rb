class CommentChannel < ApplicationCable::Channel
  def subscribed
    @question = Item.find(params[:question_id]) # 追記
    stream_for @question # 追記

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
