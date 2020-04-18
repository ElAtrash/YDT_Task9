class LogService

  def initialize(klass_logger = Log)
    @klass_logger = klass_logger
  end

  def log_changes(record)
    record.changed?
    @klass_logger
        .create(record.attributes.except('id', 'email', 'created_at', 'updated_at')
        .merge({date: DateTime.current, user_id: record.id}))
  end
end