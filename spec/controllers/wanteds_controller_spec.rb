require 'rails_helper'

RSpec.describe WantedsController, type: :controller do
  render_views

  let(:current_user) {create(:user)}
  let(:wanted) {create(:wanted)}
  let!(:delete_wanted) {create(:wanted)}

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

    describe 'GET #edit' do
      subject {get :edit, params: {id: wanted.id}}
      it "正しくページが表示されること" do
        expect(subject).to render_template :edit
      end
    end

    describe 'PATCH #update' do
      subject {patch :update, params: {wanted: wanted_params, id: wanted.id}}

      context "正常な入力値のとき" do
        let(:wanted_params) {attributes_for(:wanted, file_name: 'hoge')}

        it "更新が行えること" do
          expect {subject}.to change(Wanted, :count).by(1)
          expect(assigns(:wanted)).to eq wanted

          wanted.reload
          expect(wanted.file_name).to eq(wanted_params[:file_name])
        end

        it "指定のページへ遷移すること" do
          expect {response.to redirect_to wanteds_path wanted}
        end
      end
    end
  end

end
