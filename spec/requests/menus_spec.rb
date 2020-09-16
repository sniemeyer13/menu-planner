require 'rails_helper'

RSpec.describe 'Menus API', type: :request do
  let!(:menus) {create_list(:menu, 10) }
  let(:menu_id) { menus.first.id }

  describe 'GET /menus' do
    before { get '/menus' }

    it 'returns menus' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'Get /menus/:id' do
    before { get "/menus/#{menu_id}" }

    context 'when record exists' do
      it 'returns the menu' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(menu_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when record does not exist' do
      let(:menu_id) { 99 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Menu/)
      end
    end
  end

  describe 'POST /menus' do
    let(:valid_attributes) { { title: 'Chicken Parm', author: '1' } }

    context 'when request is valid' do
      before { post '/menus', params: valid_attributes }

      it 'creates a menu' do
        expect(json['title']).to eq ('Chicken Parm')
      end

      it 'returns a status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when request is invalid' do
      before { post '/menus', params: { title: 'No author on this one' } }

      it 'returns a status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Author can't be blank/)
      end
    end
  end

  describe 'PUT /menus/:id' do
    let(:valid_attributes) { { title: 'Eggplant Parm'} }

    context 'when the record exists' do
      it 'updates record and returns a 204' do
        get "/menus/#{menu_id}"
        expect(response).to have_http_status(200)
        expect(json['id']).to eq(menu_id)

        put "/menus/#{menu_id}", params: valid_attributes
        expect(json['id']).to eq(menu_id)
        expect(json['title']).to eq('Eggplant Parm')
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'DELETE /menus/:id' do
    it 'deletes record and returns status code 204' do
      get "/menus/#{menu_id}"
      expect(response).to have_http_status(200)

      delete "/menus/#{menu_id}"
      expect(response).to have_http_status(204)

      get "/menus/#{menu_id}"
      expect(response).to have_http_status(404)
    end

  end

end