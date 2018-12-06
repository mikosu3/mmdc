require 'rails_helper'

RSpec.describe CreditsController, type: :controller do
  render_views

  let(:current_user) {create(:user)}
  let(:wanted) {create(:wanted)}
  let(:credit) {create(:credit, author_names: ["作者1"])}
  let!(:delete_credit) {create(:credit, author_names: ["作者1"])}
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
      subject {get :new, params: {wanted_id: credit.wanted_id}}
      it "正しくページが表示されること" do
        expect(subject).to render_template :new
      end
    end

    describe 'GET #edit' do
      subject {get :edit, params: {id: credit.id}}
      it "正しくページが表示されること" do
        expect(subject).to render_template :edit
      end
    end

    describe 'POST #create' do
      subject {post :create, params: {credit: credit_params, author_names: ["1", "2"]}}

      context '正しい値を入力した場合' do
        let(:credit_params) {attributes_for(:credit, wanted_id: wanted.id)}
        it "データベースに1件登録されること" do
          expect {subject}.to change(Credit, :count).by(1)
        end
        it "指定のページへ遷移すること" do
          expect {response.to redirect_to credit_path credit}
        end
      end
    end

    describe 'PATCH #update' do
      subject {patch :update, params: {credit: credit_params, id: credit.id, author_names: ["1", "2"]}}

      context "正常な入力値のとき" do
        let(:credit_params) {attributes_for(:credit)}

        it "更新が行えること" do
          expect {subject}.to change(Credit, :count).by(1)
          expect(assigns(:credit)).to eq credit

          credit.reload
          expect(credit.name).to eq(credit_params[:name])
        end

        it "指定のページへ遷移すること" do
          expect {response.to redirect_to credits_path credit}
        end
      end
    end
  end

end
