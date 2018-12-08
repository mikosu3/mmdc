require 'rails_helper'

RSpec.describe VideosController, type: :controller do
  render_views

  let(:current_user) {create(:user)}
  let(:video) {create(:video)}

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

  end

end
