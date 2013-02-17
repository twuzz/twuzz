Twuzz::Application.routes.draw do
  controller :registration do
    get  '/register', action: 'new'
    post '/register', action: 'create'
  end

  controller :sessions do
    get  '/login',  action: 'new'
    post '/login',  action: 'create'
    post '/logout', action: 'destroy'
  end
end
