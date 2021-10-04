Rails.application.routes.draw do
  post '/email_proxy' => 'mail#create'
end
