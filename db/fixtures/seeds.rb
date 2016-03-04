# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:is_admin => true, :screen_name => "mikosu3",  :uid => "322435416", :provider => "twitter", :name => "みこす")

Must.create(:video => "sm2420025", :name => "MikuMikuDance", :author_name => "樋口優")
Must.create(:video => "sm12149815", :name => "MikuMikuEffect", :author_name => "舞力介入P")
Must.create(:video => "sm?", :name => "MMDクレジット", :author_name => "みこす")

Wanted.create!([
  {file_name: "sorairo1.52.x", folder_name: "空色町1.52", extension: "x", lock_version: 0},
  {file_name: "full_SimpleSoftShadow.fx", folder_name: "full_SimpleSoftShadow", extension: "fx", lock_version: 0},
  {file_name: "Fきゅん.pmx", folder_name: "モブFきゅん", extension: "pmx", lock_version: 0},
  {file_name: "モブ男D.pmx", folder_name: "モブD男", extension: "pmx", lock_version: 0},
  {file_name: "秦こころVer1.21IK.pmx", folder_name: "秦こころVer1.21", extension: "pmx", lock_version: 0},
  {file_name: "Yotsugi47_5-4IK.pmx", folder_name: "Yotsugi_ver0.3.4", extension: "pmx", lock_version: 0},
  {file_name: "柊りん Ver1.21semi.pmx", folder_name: "柊りん Ver1.21", extension: "pmx", lock_version: 0},
  {file_name: "ikzo_腕IK.pmx", folder_name: "いくぞーv1.0.3", extension: "pmx", lock_version: 0},
  {file_name: "親父1号sf701.pmd", folder_name: "モブ親父セット1", extension: "pmd", lock_version: 0},
  {file_name: "アンツィオモブ子さん戦闘服3.pmx", folder_name: "PMX_アンツィオモブ子さん3", extension: "pmx", lock_version: 0},
  {file_name: "哀音 ver2.1.pmx", folder_name: "哀音 ver.2.1", extension: "pmx", lock_version: 0},
  {file_name: "久伴才土 v1.06_semi_IK.pmx", folder_name: "久伴才土 v1.06", extension: "pmx", lock_version: 0},
  {file_name: "ムックHPModel_v100.pmd", folder_name: "gachapin_and_mukku_hp", extension: "pmd", lock_version: 0},
  {file_name: "マジP.pmx", folder_name: "3Pセット", extension: "pmx", lock_version: 0},
  {file_name: "キレネンコver1.02.pmx", folder_name: "キレネンコver1.02", extension: "pmx", lock_version: 0},
  {file_name: "プーチンver1.01.pmx", folder_name: "プーチンver1.01", extension: "pmx", lock_version: 0},
  {file_name: "親父1号mm604.pmd", folder_name: "モブ親父セット1", extension: "pmd", lock_version: 0},
  {file_name: "学ラン君v1.0.pmx", folder_name: "学ラン君v1.0a", extension: "pmx", lock_version: 0},
  {file_name: "本居小鈴.pmx", folder_name: "本居小鈴", extension: "pmx", lock_version: 0},
  {file_name: "稗田阿求.pmx", folder_name: "aQN", extension: "pmx", lock_version: 0},
  {file_name: "キャミ短パン.pmx", folder_name: "pmx", extension: "pmx", lock_version: 0},
  {file_name: "しまT.pmx", folder_name: "pmx", extension: "pmx", lock_version: 0},
  {file_name: "モブC子.pmx", folder_name: "モブC子", extension: "pmx", lock_version: 0},
  {file_name: "茜_制服.pmx", folder_name: "日野茜v2", extension: "pmx", lock_version: 0},
  {file_name: "陸凱水無月v2.04.pmx", folder_name: "水無月v2.04", extension: "pmx", lock_version: 0},
  {file_name: "モブB子.pmx", folder_name: "モブB子", extension: "pmx", lock_version: 0},
  {file_name: "フジイちゃん1.2semi.pmx", folder_name: "VESTA-f10_フジイ1.2", extension: "pmx", lock_version: 0},
  {file_name: "JUNO-d4カトウsemi.pmx", folder_name: "02_kato_data", extension: "pmx", lock_version: 0},
  {file_name: "VENUS-D_morisemi.pmx", folder_name: "VENUS-s27_モリ", extension: "pmx", lock_version: 0},
  {file_name: "有間都古.pmx", folder_name: "有間都古", extension: "pmx", lock_version: 0},
  {file_name: "うさうさ_106.pmd", folder_name: "うさうさ_物理演算_106", extension: "pmd", lock_version: 0},
  {file_name: "Karaage_Lemon.pmx", folder_name: "からあげ☆レモン", extension: "pmx", lock_version: 0},
  {file_name: "しゅう造Ｔ.pmd", folder_name: "しゅう造", extension: "pmd", lock_version: 0},
  {file_name: "ボリスver1.1武器なし.pmx", folder_name: "ボリスver1.1", extension: "pmx", lock_version: 0},
  {file_name: "コプチェフver1.0武器なし.pmx", folder_name: "コプチェフver1.0", extension: "pmx", lock_version: 0},
  {file_name: "重巡タカオ_type2_v102_軽.pmx", folder_name: "タカオ_v102", extension: "pmx", lock_version: 0},
  {file_name: "リサ(戦闘服)Ver2.1.pmx", folder_name: "リサ Ver2.1【MMDオリキャラ】", extension: "pmx", lock_version: 0},
  {file_name: "親父1号ms501.pmd", folder_name: "モブ親父セット1", extension: "pmd", lock_version: 0},
  {file_name: "親父1号mm402.pmd", folder_name: "モブ親父セット1", extension: "pmd", lock_version: 0},
  {file_name: "ネガ ver 2.02.pmx", folder_name: "ネガ ver.2.01", extension: "pmx", lock_version: 0},
  {file_name: "ユネ ver.2.0.pmx", folder_name: "ユネ ver.2.0", extension: "pmx", lock_version: 0},
  {file_name: "鈴谷(艤装なし)semi.pmx", folder_name: "重巡鈴谷", extension: "pmx", lock_version: 0},
  {file_name: "熊野(艤装なし).pmx", folder_name: "重巡熊野", extension: "pmx", lock_version: 0},
  {file_name: "アメノ-マスク_nigiIK.pmx", folder_name: "アメノ ver.2.0", extension: "pmx", lock_version: 0},
  {file_name: "射命丸文_風神録_1_81semiIK.pmx", folder_name: "フリック_射命丸文_改変_v1.81", extension: "pmx", lock_version: 0},
  {file_name: "フランドール・S2（全親あり版）semiIK.pmx", folder_name: "フランドール・S", extension: "pmx", lock_version: 0},
  {file_name: "洋傘レース桃.pmx", folder_name: "パラソル", extension: "pmx", lock_version: 0},
  {file_name: "Cleaner_v0_5a.pmd", folder_name: "Cleaner_v0_5a", extension: "pmd", lock_version: 0},
  {file_name: "セルシアナ.pmx", folder_name: "Celsiana", extension: "pmx", lock_version: 0},
  {file_name: "一期一振Ver1.0.pmx", folder_name: "一期一振Ver1.0", extension: "pmx", lock_version: 0},
  {file_name: "テストモデル_試1.36.pmx", folder_name: "テストモデル 試1.36", extension: "pmx", lock_version: 0},
  {file_name: "uksk式スレイヤー ver.0.21.pmx", folder_name: "配布用スレイヤー", extension: "pmx", lock_version: 0},
  {file_name: "にゃんちゅうver0.9.pmx", folder_name: "にゃんちゅう", extension: "pmx", lock_version: 0},
  {file_name: "眈.pmx", folder_name: "眈", extension: "pmx", lock_version: 0},
  {file_name: "セーラー.pmx", folder_name: "女性高生せいらver1.0", extension: "pmx", lock_version: 0},
  {file_name: "弓兵ソーマ.pmx", folder_name: "弓兵ソーマver.1.0", extension: "pmx", lock_version: 0},
  {file_name: "サイタマ先生(モドキ式)準標準.pmx", folder_name: "サイタマ先生", extension: "pmx", lock_version: 0},
  {file_name: "春子ニーソ.pmx", folder_name: "春子ver1.0.1", extension: "pmx", lock_version: 0},
  {file_name: "市JC-Sニーソ.pmx", folder_name: "夏服", extension: "pmx", lock_version: 0},
  {file_name: "ガチャピンHPModel_v100.pmx", folder_name: "gachapin_and_mukku_hp", extension: "pmx", lock_version: 0},
  {file_name: "ふなっしーver0.111.pmx", folder_name: "ふなっしーver0.111リドミ改定2", extension: "pmx", lock_version: 0},
  {file_name: "アンツィオモブ子さん戦闘服２(ヘルメット).pmx", folder_name: "PMX_アンツィオモブ子さん2", extension: "pmx", lock_version: 0},
  {file_name: "天龍1.02_体験版.pmx", folder_name: "tenryu_1.02_trial", extension: "pmx", lock_version: 0},
  {file_name: "龍田_1.1(体験版).pmx", folder_name: "data", extension: "pmx", lock_version: 0},
  {file_name: "コブラ.pmx", folder_name: "コブラ ver0.86", extension: "pmx", lock_version: 0},
  {file_name: "ニパ子ver.1.11.pmx", folder_name: "ニパ子ver.1.11", extension: "pmx", lock_version: 0},
  {file_name: "阿良々木暦.pmx", folder_name: "阿良々木君", extension: "pmx", lock_version: 0},
  {file_name: "親父1号ms601.pmd", folder_name: "モブ親父セット1", extension: "pmd", lock_version: 0},
  {file_name: "親父1号mm501.pmd", folder_name: "モブ親父セット1", extension: "pmd", lock_version: 0},
  {file_name: "親父1号ss702.pmd", folder_name: "モブ親父セット1", extension: "pmd", lock_version: 0},
  {file_name: "にゃんちゅうver0.9.fx", folder_name: "にゃんちゅう", extension: "fx", lock_version: 0}
])

Author.create!([
  {name: "ビームマンP", url: "http://www43.atwiki.jp/beamman/", twitter: "BeamManP", pixiv: "", email: "", lock_version: 0, nico: "421727", disp_name: "ビームマンP", updated_by: 1},
  {name: "そぼろ", url: "", twitter: "sovoro_mmd", pixiv: "", email: "", lock_version: 0, nico: "424150", disp_name: "そぼろ", updated_by: 1},
  {name: "針金P", url: "http://harigane.at.webry.info/", twitter: "HariganeP", pixiv: "", email: "", lock_version: 0, nico: "10092695", disp_name: "針金P", updated_by: 1},
  {name: "ikeno", url: "", twitter: "", pixiv: "", email: "", lock_version: 0, nico: "6848632", disp_name: "ikeno", updated_by: 1}
])
