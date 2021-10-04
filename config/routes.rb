Rails.application.routes.draw do
  mount_griddler('/email_proxy')
end
