require "rails_helper"

RSpec.describe CabinetController, type: :routing do
  describe 'routing' do
    it 'routes to main' do
      expect(get: '/').to route_to('cabinet#index')
    end

    it 'routes to #user_cabinet' do
      expect(get: '/user/1').to route_to('cabinet#show', id: '1')
    end
  end
end
