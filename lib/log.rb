module Log
  class Services
    def self.info(class_name, key, data)
      logger.info("service: #{class_name} | #{key} | #{data}")
    end

    def self.exception(class_name, key, error)
      Bugsnag.notify(error)
      logger.error("service: #{class_name} | #{key} | #{error.message} #{error.backtrace.join("\n")}\n")
    end

    def self.error(class_name, key, data)
      Bugsnag.notify(data)
      logger.error("service: #{class_name} | #{key} | #{data}\n")
    end

    def self.logger
      @logger ||= Log.initialize_logger('services')
    end
  end

  def self.initialize_logger(file_name)
    logger = Logger.new(Rails.root.join('log', "#{file_name}.log"))
    logger.formatter = LoggerFormatter.new
    logger
  end
end
