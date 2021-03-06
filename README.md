# FlixelRL (1Rogue)
1画面ローグライク、1Rogueのプロジェクトページ

■YouTubeにアップした紹介動画  

[![](http://img.youtube.com/vi/9YV_Hd1YQ6A/0.jpg)](https://www.youtube.com/watch?v=9YV_Hd1YQ6A)

## ゲーム情報

[http://2dgames.jp/flash/1rogue/](http://2dgames.jp/flash/1rogue/)

* ゲームタイトル: 1Rogue
* ジャンル: 1画面ローグライク
* バージョン: v1.00
* 公開日付: 2015/8/29
* 更新日付: -

### ストーリー
ネコたちに囲まれて、女の子は幸せな暮らしを送っていました。しかしある日、ネコたちがダンジョンに入り込んでしまいます。
女の子はネコたちを連れ戻すために、危険なダンジョンに入ることになりました。

### 操作方法
* カーソルキー: 移動
* Zキー / Enterキー: 攻撃。項目の決定。その場で足踏み
* Xキー / Shiftキー: キャンセル。インベントリを開く
* Cキー / Spaceキー: 振り向く。インベントリのソート
* Vキー: 高速移動。階段を下りる

## 著作権情報
開発：[2dgames.jp](http://2dgames.jp) (しゅん)

### ライセンス
本プロジェクトは「クリエイティブ・コモンズ・ライセンス（CC-by SA　表示-継承）」となります。

![CC-by SA 表示-継承](/docs/license/88x31.png)

なお、このライセンスが適用されるのは、DENZI様の作られたモンスター画像と、ぴぽや様の作られたマップチップ画像となります。
それ以外（プログラムコードやサウンドなど）はライセンスの表記なく、自由に使っていただいて構いません。

### 謝辞
/docs/monster フォルダ以下のモンスター画像は、「DENZI」様よりお借りしています。

* [ＤＥＮＺＩ部屋](http://www3.wind.ne.jp/DENZI/diary/)

/assets/events フォルダにあるマップチップ画像は、「ぴぽや」様よりお借りしています。

* [ぴぽや](http://piposozai.blog76.fc2.com/)

フォントにはPixelMplus(ピクセル・エムプラス)を使わせていただきました

* [PixelMplus](http://itouhiro.hatenablog.com/entry/20130602/font)

PixelMplusのライセンスは「M+ FONT LICENSE」となります。

```
これらのフォントはフリー（自由な）ソフトウエアです。 
あらゆる改変の有無に関わらず、また商業的な利用であっても、
自由にご利用、複製、再配布することができますが、
全て無保証とさせていただきます。
```

開発環境にはクロスプラットフォームのゲームライブラリ「HaxeFlixel」を使用させていただきました。

![HaxeFlixel](/docs/license/haxeflixel.png)

* [http://haxeflixel.com/](http://haxeflixel.com/)

#### 手伝ってくれた方々
多くの助けでこのゲームは完成しました。ありがとうございました！

* 炎堂たつや先生：リザルト画像、ダンジョンマップチップ、シナリオ原案を作ってもらいました。テストプレイもしてもらいました
* MAKIさん：キャラクタードット絵を描いてくれました
* ANDOさん：かなりやり込みプレイをしてもらいました。おかげでかなりゲームを良くすることができました
* TAKIさん：テストプレイや改善案を指摘してくれました

## 更新情報
* 2015/8/29 Ver 1.00 公開開始

## その他
技術的な情報はQiitaにアップしています

* [ローグライクを作ったので開発手順をまとめてみた](http://qiita.com/2dgames_jp/items/1730e7c4822091c3c320)

### 開発環境
|分類|名称|説明|
|:---|:---|:---|
|開発環境|Haxe(v3.2.94)|プログラム言語|
|       |OpenFL(v3.0.6)|マルチプラットフォーム開発環境|
|       |HaxeFlixel(v3.3.8)|ゲームライブラリ|
|テキストエディタ・IDE|Intellij IDEA 13 CE|IDE|
|                  |Sublime Text 2|テキストエディタ|
|                  |CotEditor|テキストエディタ|
|レベルエディタ|TiledMapEditor|マップエディタ|
|ゲームパラメータ管理|Numbers|表計算ソフト。<br>運用にはExcelに変換して、それをさらにPythonでCSVに変換|
|画像作成|Pixelmator|画像編集|
|       |Aseprite  |ドット絵作成|
|       |CLIP STUDIO PAINT PRO|画像作成|
|       |ImageMagick|画像変換|
|サウンド|FL Studio|BGM作成|
|       |as3sfxr  |効果音作成|
|       |ffmpeg   |フォーマット変換|
|サーバー|MySQL|データベース|
|       |PHP|サーバーサイドのスクリプト言語|
|       |JavaScript|正確にはサーバーじゃないけど、FlashとPHPの橋渡しとして使用|


