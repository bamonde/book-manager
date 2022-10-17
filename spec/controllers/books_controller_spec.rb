require 'rails_helper'

RSpec.describe BooksController, :unit, type: :controller do
  context 'Not signed in' do
    describe '#index' do
      subject { get :index }

      it { is_expected.to have_http_status :redirect }
      it { is_expected.to redirect_to new_user_session_path }
    end

    describe '#show' do
      subject { get :show, params: { id: 'any' } }

      it { is_expected.to have_http_status :redirect }
      it { is_expected.to redirect_to new_user_session_path }
    end

    describe '#new' do
      subject { get :new }

      it { is_expected.to have_http_status :redirect }
      it { is_expected.to redirect_to new_user_session_path }
    end

    describe '#create' do
      subject { post :create, params: { book: { title: 'any' } } }

      it { is_expected.to have_http_status :redirect }
      it { is_expected.to redirect_to new_user_session_path }
    end

    describe '#edit' do
      subject { get :edit, params: { id: 'any' } }

      it { is_expected.to have_http_status :redirect }
      it { is_expected.to redirect_to new_user_session_path }
    end

    describe '#update' do
      subject { put :update, params: { id: 'any', book: { title: 'any' } } }

      it { is_expected.to have_http_status :redirect }
      it { is_expected.to redirect_to new_user_session_path }
    end

    describe '#destroy' do
      subject { delete :destroy, params: { id: 'any' } }

      it { is_expected.to have_http_status :redirect }
      it { is_expected.to redirect_to new_user_session_path }
    end
  end

  context 'Signed in' do
    let!(:user) { FactoryBot.create(:user) }

    before { sign_in(user) }

    context '#index' do
      let!(:books) { FactoryBot.create_list(:book, 5) }

      subject(:make_a_request) { get :index }

      it do
        make_a_request

        expect(assigns(:books)).to have(5).items
      end

      it { is_expected.to have_http_status(:ok) }
      it { is_expected.to render_template(:index) }
    end

    context '#new' do
      let!(:authors) { FactoryBot.create_list(:author, 2) }
      let!(:publishers) { FactoryBot.create_list(:publisher, 2) }

      subject(:make_a_request) { get :new }

      it do
        make_a_request

        expect(assigns(:book)).not_to be_persisted
        expect(assigns(:book)).to be_an_instance_of(Book)
        expect(assigns(:authors)).to have(2).items
        expect(assigns(:publishers)).to have(2).items
      end

      it { is_expected.to have_http_status(:ok) }
      it { is_expected.to render_template(:new) }
    end

    context '#create' do
      let!(:authors) { FactoryBot.create_list(:author, 2) }
      let!(:publishers) { FactoryBot.create_list(:publisher, 2) }

      subject(:make_a_request) { post :create, params: { book: book_params } }

      context 'success' do
        let(:book_params) do
          {
            title: 'Névoambar',
            release_date: 2.years.ago,
            edition: '1',
            genre: 'Ficção/Fantasia',
            isbn: '90932039383',
            iccn: '9987838',
            oclc: '2245',
            publisher_id: publishers.first.id,
            author_ids: [authors.first.id]
          }
        end

        context 'making a request' do
          before { make_a_request }

          it { expect(subject.request.flash[:notice]).to eq(I18n.t('actions.create.notice', scope: 'flash', resource_name: 'Livro')) }
        end

        it { expect { make_a_request }.to change(Book, :count).by(1) }
        it { is_expected.to have_http_status(:redirect) }
        it { is_expected.to redirect_to(books_path) }
      end

      context 'error' do
        let(:book_params) do
          {
            title: '',
            release_date: 2.days.from_now,
            edition: '1',
            genre: 'Ficção/Fantasia',
            isbn: '90932039383',
            iccn: '9987838',
            oclc: '2245',
            publisher_id: nil,
            author_ids: []
          }
        end

        context 'making a request' do
          before { make_a_request }

          it { expect(subject.request.flash[:alert]).to eq(I18n.t('actions.create.alert', scope: 'flash')) }
        end

        it { expect { make_a_request }.not_to change(Book, :count) }
        it { is_expected.to have_http_status(:ok) }
        it { is_expected.to render_template(:new) }
      end
    end

    context '#edit' do
      let!(:authors) { FactoryBot.create_list(:author, 3) }
      let!(:publishers) { FactoryBot.create_list(:publisher, 3) }

      context 'a found book' do
        let!(:book) { FactoryBot.create(:book, publisher_id: publishers.sample.id, author_ids: [authors.sample.id]) }

        subject(:make_a_request) { get :edit, params: { id: book.id } }

        it do
          make_a_request

          expect(assigns(:book)).to be_persisted
          expect(assigns(:book)).to be_an_instance_of(Book)
          expect(assigns(:authors)).to have(3).items
          expect(assigns(:publishers)).to have(3).items
        end

        it { is_expected.to have_http_status(:ok) }
        it { is_expected.to render_template(:edit) }
      end

      context 'a book NOT found' do
        subject(:make_a_request) { get :edit, params: { id: 99999 } }

        it do
          make_a_request

          expect(controller).to set_flash[:alert].to(I18n.t('flash.books.not_found'))
        end
        it { is_expected.to have_http_status(:redirect) }
        it { is_expected.to redirect_to(books_path) }
      end
    end

    context '#update' do
      let!(:authors) { FactoryBot.create_list(:author, 2) }
      let!(:publishers) { FactoryBot.create_list(:publisher, 2) }
      let!(:book) { FactoryBot.create(:book, publisher_id: publishers.first.id, author_ids: [authors.first.id]) }

      subject(:make_a_request) { put :update, params: { id: book_id, book: book_params } }

      context 'success' do
        let(:book_id) { book.id }
        let(:book_params) do
          {
            title: 'Névoambar',
            release_date: 2.years.ago,
            edition: '1',
            genre: 'Ficção/Fantasia',
            isbn: '90932039383',
            iccn: '9987838',
            oclc: '2245',
            publisher_id: publishers.first.id,
            author_ids: [authors.first.id]
          }
        end

        context 'making a request' do
          before { make_a_request }

          it { expect(subject.request.flash[:notice]).to eq(I18n.t('actions.update.notice', scope: 'flash', resource_name: 'Livro')) }
        end
        it { expect { make_a_request }.not_to change(Book, :count) }
        it { is_expected.to have_http_status(:redirect) }
        it { is_expected.to redirect_to(books_path) }
      end

      context 'error' do
        context 'not found' do
          let(:book_id) { 99999 }
          let(:book_params) { {} }

          it do
            make_a_request

            expect(controller).to set_flash[:alert].to(I18n.t('flash.books.not_found'))
          end
          it { is_expected.to have_http_status(:redirect) }
          it { is_expected.to redirect_to(books_path) }
        end

        context 'invalid data' do
          let(:book_id) { book.id }
          let(:book_params) do
            {
              title: '',
              release_date: 2.days.from_now,
              edition: '1',
              genre: 'Ficção/Fantasia',
              isbn: '90932039383',
              iccn: '9987838',
              oclc: '2245',
              publisher_id: nil,
              author_ids: []
            }
          end

          context 'making a request' do
            before { make_a_request }

            it { expect(subject.request.flash[:alert]).to eq(I18n.t('actions.update.alert', scope: 'flash')) }
          end

          it { expect { make_a_request }.not_to change(Book, :count) }
          it { is_expected.to have_http_status(:ok) }
          it { is_expected.to render_template(:edit) }
        end
      end
    end

    context '#show' do
      context 'a found book' do
        let!(:book) { FactoryBot.create(:book) }

        subject(:make_a_request) { get :show, params: { id: book.id } }

        it do
          make_a_request

          expect(assigns(:book)).to be_persisted
          expect(assigns(:book)).to be_an_instance_of(Book)
        end

        it { is_expected.to have_http_status(:ok) }
        it { is_expected.to render_template(:show) }
      end

      context 'a book NOT found' do
        subject(:make_a_request) { get :show, params: { id: 99999 } }

        it do
          make_a_request

          expect(controller).to set_flash[:alert].to(I18n.t('flash.books.not_found'))
        end
        it { is_expected.to have_http_status(:redirect) }
        it { is_expected.to redirect_to(books_path) }
      end
    end

    context '#destroy' do
      context 'a found book' do
        let!(:book) { FactoryBot.create(:book) }

        subject(:make_a_request) { get :destroy, params: { id: book.id } }

        it { expect { make_a_request }.to change(Book, :count).by(-1) }
        it { is_expected.to have_http_status(:redirect) }
        it { is_expected.to redirect_to(books_path) }

        context 'making a request' do
          before { make_a_request }

          it { expect(controller).to set_flash[:notice].to(I18n.t('flash.books.destroy.notice')) }
        end
      end

      context 'a book NOT found' do
        subject(:make_a_request) { get :destroy, params: { id: 99999 } }

        it { expect { make_a_request }.not_to change(Book, :count) }
        it { is_expected.to have_http_status(:redirect) }
        it { is_expected.to redirect_to(books_path) }

        context 'make a request' do
          before { make_a_request }

          it { expect(controller).to set_flash[:alert].to(I18n.t('flash.books.not_found')) }
        end
      end
    end
  end
end
