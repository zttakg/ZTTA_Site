class LoggerFormatter
  def call(severity, time, _program_name, message)
    "#{time.utc.iso8601(3)} PID-#{::Process.pid} TID-#{CurrentThread.id} #{severity}: #{message}\n"
  end
end

class CurrentThread
  def self.id
    Thread.current.object_id.to_s(36)
  end
end
