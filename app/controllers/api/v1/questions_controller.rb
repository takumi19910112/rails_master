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

       def upload
        @file = params[:file]
        compress_image # 画像を加工する
        file_name = "#{SecureRandom.hex(20)}.webp"
        upload_file = @file.tempfile

        s3 = Aws::S3::Resource.new(
          region: ENV.fetch('AWS_REGION', nil),
          access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID', nil),
          secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY', nil)
        )

        obj = s3.bucket(ENV.fetch('AWS_S3_BUCKET', nil)).object(file_name)
        obj.upload_file(upload_file, { acl: 'public-read' })

        render json: { filename: obj.public_url }, status: :ok
      end

      private

      def compress_image
        image = Magick::Image.from_blob(@file.read).first

        # もし画像の長さは1024px以上だったらリサイズする
        image.resize_to_fit!(1024) if image.columns > 1024
        image.format = 'webp' # webpならページの読み込み時間が短縮するらしい
        image.write(@file.path)
      rescue StandardError
        nil # 万が一加工が失敗したら元々の画像をアップロードする
      end
    end
  end
end
  