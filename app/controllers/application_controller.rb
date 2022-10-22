class ApplicationController < ActionController::API
  rescue_from Exception, with: :handle_exception

  private

  def handle_exception(e)
    Rails.logger.error(e.inspect)
    Rails.logger.error(e.backtrace)

    render json: { message: 'エラーが発生しました。' }, status: :internal_server_error
  end
end
