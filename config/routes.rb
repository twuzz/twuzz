Twuzz::Application.routes.draw do
  controller :registration do
    get  '/register', action: 'new'
    post '/register', action: 'create'
  end
end
