pn
==

入力された文章を感情分析する

入力した文章から感情を読み取るサンプル

入力した文書を形態素解析により形態素に分け、感情表現辞書を元に、文章の感情を推定する。
感情分析本体のpn.rbとCGIからの利用例がある。

■ 必要なもの
----
- ruby
- chasen
- 感情表現辞書

■ ファイル
----

- pn.rb: 感情分析の本体
- index.html, pn.cgi: CGIで使うときのサンプル
- pn_ja.txt: pn_ja.dicをUTF-8に変換したもの。本パッケージには含まない。
- a0002_004890_m.jpg, a0800_001016_m.jpg, a0800_001018_m.jpg: GCI用の画像。本パッケージには含まない。

■ 設定
----
必要ならpn.rb中のchasenおよび、chasendicの場所を環境に合わせて修正する

CGIで利用するなら、index.html, pn.cgiを環境に合わせて修正する

■ 辞書、素材など
----
感情辞書は以下のものを利用した。
- 単語感情極性対応表(pn_ja.dic) http://www.lr.pi.titech.ac.jp/~takamura/pndic_ja.html

写真は以下のものを利用した。
- 写真素材 足成【フリーフォト、無料写真素材サイト】 http://www.ashinari.com/

