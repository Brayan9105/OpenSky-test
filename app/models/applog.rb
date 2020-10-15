class Applog < ApplicationRecord
  def self.save_log controller, action, obj_id
    create(controller: controller, action: action, object_id: obj_id)
  end
end
