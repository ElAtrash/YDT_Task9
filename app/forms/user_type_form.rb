class UserTypeForm
  include ActiveModel::Model

  TYPES = { friend: 1, neutrality: 2, enemy: 3 }.with_indifferent_access

  def initialize(old_type, new_type)
    @old_type = old_type
    @new_type = new_type
  end

  def self.cant_change_type?(old_type, new_type)
    (TYPES[old_type.downcase] - TYPES[new_type.downcase]).abs > 1 ? false : true
  end

  def self.select_tag_type_params
    [['Friend', 'Friend'], ['Neutrality', 'Neutrality'], ['Enemy', 'Enemy']]
  end
end