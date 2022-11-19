module Api
  module V1
    class QuestionsController < ApplicationController
      include MarkdownHelper # 先ほど作成したヘルパー
      protect_from_forgery

      # POST /api/v1/articles/preview
      def preview
        content = markdown(params[:content])
        render json: { content: content }
      end
    end
  end
end