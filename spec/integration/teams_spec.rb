require 'swagger_helper'

describe 'Teams API' do

  path '/teams' do

    post 'Creates a team' do
      tags 'Teams'
      consumes 'application/json'
      parameter name: :team, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          region: { type: :string }
        },
        required: [ 'name', 'region' ]
      }

      response '201', 'team created' do
        let(:team) { { name: 'foo', region: 'bar' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:team) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/teams/{id}' do

    get 'Retrieves a team' do
      tags 'Teams'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'team found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            region: { type: :string }
          },
          required: [ 'id', 'name', 'region' ]

        let(:id) { Team.create(name: 'foo', region: 'bar').id }
        run_test!
      end

      response '404', 'team not found' do
        let(:id) { -1 }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
  end

  path '/teams/{id}' do
    delete 'Delete a team.' do
      tags 'Teams'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      produces 'application/json'
 
      response '200', 'Destroy the team' do
        let(:id) { Team.create(name: 'test', region: 'region').id }
 
        run_test!
      end
    end
  end

end