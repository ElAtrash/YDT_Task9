class UserDecorator < Draper::Decorator
  delegate_all

  def type
     model.type 
  end

  def log_type
    @log = Log.where(user_id: model.id).pluck(:type, :date)
  end
end
