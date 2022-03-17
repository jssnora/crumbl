module Rails
    class << self
      def pipe_env
        @_pipe_env = ActiveSupport::StringInquirer.new(ENV["PIPE_ENV"].presence || Rails.env)
      end
    end
  end