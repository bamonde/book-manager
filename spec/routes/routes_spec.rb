require 'rails_helper'

RSpec.describe 'Routes', type: :routing do
  context 'books' do
    context 'show' do; it { expect(get: '/books/123').to route_to(controller: 'books', action: 'show', id: '123') } end
    context 'index' do; it { expect(get: '/books').to route_to(controller: 'books', action: 'index') } end
    context 'new' do; it { expect(get: '/books/new').to route_to(controller: 'books', action: 'new') } end
    context 'edit' do; it { expect(get: '/books/123/edit').to route_to(controller: 'books', action: 'edit', id: '123') } end
    context 'create' do; it { expect(post: '/books').to route_to(controller: 'books', action: 'create') } end
    context 'update' do; it { expect(put: '/books/123').to route_to(controller: 'books', action: 'update', id: '123') } end
    context 'destroy' do; it { expect(delete: '/books/123').to route_to(controller: 'books', action: 'destroy', id: '123') } end
  end
end
