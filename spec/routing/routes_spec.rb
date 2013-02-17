require 'spec_helper'

describe 'Routing' do
  it { { get:  '/register' }.should route_to(controller: 'registration', action: 'new') }
  it { { post: '/register' }.should route_to(controller: 'registration', action: 'create') }
end
