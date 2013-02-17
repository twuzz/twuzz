require 'spec_helper'

describe 'Routing' do
  it { { get:  '/register' }.should route_to(controller: 'registration', action: 'new') }
  it { { post: '/register' }.should route_to(controller: 'registration', action: 'create') }
  it { { get:  '/login'    }.should route_to(controller: 'sessions',     action: 'new') }
  it { { post: '/login'    }.should route_to(controller: 'sessions',     action: 'create') }
  it { { post: '/logout'   }.should route_to(controller: 'sessions',     action: 'destroy') }
end
