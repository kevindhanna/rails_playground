Rails.application.routes.draw do
  post '/email_proxy' => 'griddler/emails#create'
end
