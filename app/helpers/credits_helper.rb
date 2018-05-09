require 'rexml/document'
require 'open-uri'

#
# ニコニコAPIラッパー
#
module NicovideoAPIWrapper extend self
    def get_thumb_info_xml(id)
        open("https://ext.nicovideo.jp/api/getthumbinfo/#{id}") {|f|
            return REXML::Document.new(f)
        }
    end
end

module CreditsHelper
    def get_thumb(id)
      case id
        # 動画
        when /^(s|n)m[0-9]+/ then
          xmldoc = NicovideoAPIWrapper::get_thumb_info_xml(id)

          # 動画タイトルはニコニコから取得する
          unless xmldoc.elements['nicovideo_thumb_response/thumb/title'].nil?
            thnmb = <<-TAG
              <iframe width="312" height="176" src="https://ext.nicovideo.jp/thumb/#{id}" scrolling="no" style="border:solid 1px #CCC;" frameborder="0">
                <a href="#{xmldoc.elements['nicovideo_thumb_response/thumb/watch_url'].text}" target="_blank">#{xmldoc.elements['nicovideo_thumb_response/thumb/title'].text}</a>
              </iframe>
            TAG
          end

        # 静画
        when /^im[0-9]+/ then
          thnmb = <<-TAG
            <iframe width="312" height="176" src="https://ext.seiga.nicovideo.jp/thumb/#{id}" scrolling="no" style="border:solid 1px #888;" frameborder="0">
              <a href="https://seiga.nicovideo.jp/seiga/#{id}" target="_blank">#{id}</a>
            </iframe>
          TAG

        # 3D
        when /^td[0-9]+/ then
          thnmb = <<-TAG
            <iframe allowfullscreen="allowfullscreen" frameborder="0" scrolling="no" src="https://3d.nicovideo.jp/externals/widget?id=#{id}" style="width: 312px; height: 176px; border: 1px solid #ccc;">
              <a href="https//3d.nicovideo.jp/works/#{id}" target="_blank">#{id}</a>
            </iframe>
          TAG
        else
          return ""
      end
    end
end


