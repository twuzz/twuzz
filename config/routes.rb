Twuzz::Application.routes.draw do
  controller :registration do
    get  '/register', action: 'new'
    post '/register', action: 'create'
  end

  controller :sessions do
    get  '/login', action: 'new'
    post '/login', action: 'create'
  end
end
