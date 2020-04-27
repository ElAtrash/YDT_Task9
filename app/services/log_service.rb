class LogService

  def initialize(klass_logger = Log)
    @klass_logger = klass_logger
  end

  def log_changes(record)
    record.changed?
    @klass_logger
        .create(record.attributes.except('id', 'email', 'encrypted_password', 'reset_password_token', 'reset_password_sent_at', 'remember_created_at', 'created_at', 'updated_at', 'provider', 'uid')
        .merge({date: DateTime.current, user_id: record.id}))
  end
end