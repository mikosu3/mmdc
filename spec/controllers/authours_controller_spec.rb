require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do
  render_views

  let(:current_user) {create(:user)}
  let(:author) {create(:author)}
  let!(:delete_author) {create(:author)}

  context 'ログインしている場合' do
    before do
      sign_in(current_user)
    end

    describe 'GET #index' do
      subject {get :index}
      it "正しくページが表示されること" do
        expect(subject).to render_template :index
      end
    end

    describe 'GET #new' do
      subject {get :new}
      it "正しくページが表示されること" do
        expect(subject).to render_template :new
      end
    end

    describe 'GET #edit' do
      subject {get :edit, params: {id: author.id}}
      it "正しくページが表示されること" do
        expect(subject).to render_template :edit
      end
    end

    describe 'POST #create' do
      subject {post :create, params: {author: author_params}}

      context '正しい値を入力した場合' do
        let(:author_params) {attributes_for(:author)}
        it "データベースに1件登録されること" do
          expect {subject}.to change(Author, :count).by(1)
        end
        it "指定のページへ遷移すること" do
          expect {response.to redirect_to author_path author}
        end
      end

      context '異常な値を入力した場合' do
        let(:author_params) {attributes_for(:author, name: nil)}
        it "データベース登録されないこと" do
          expect {subject}.to change(Author, :count).by(0)
          expect(assigns(:author).errors.empty?).to_not be_truthy
        end
      end
    end

    describe 'Delete #destroy' do
      subject {delete :destroy, id: delete_author.id}

      context do
        it "削除が行えること" do
          expect {subject}.to change(Author, :count).by(-1)
        end
      end
    end

    describe 'PATCH #update' do
      subject {patch :update, params: {author: author_params, id: author.id}}

      context "正常な入力値のとき" do
        let(:author_params) {attributes_for(:author, name: 'hoge')}

        it "更新が行えること" do
          expect {subject}.to change(Author, :count).by(1)
          expect(assigns(:author)).to eq author

          author.reload
          expect(author.name).to eq(author_params[:name])
        end

        it "指定のページへ遷移すること" do
          expect {response.to redirect_to authors_path author}
        end
      end
    end


  end


end
