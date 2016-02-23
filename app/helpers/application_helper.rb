module ApplicationHelper
  def  bootstrap_class_for(flash_type)
    klass = { success: 'alert-success', error: 'alert-danger',
              alert: 'alert-warning', notice: 'alert-info' }[flash_type]
    klass || flash_type.to_s
  end
end
