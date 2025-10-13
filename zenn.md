## 第1章：なぜNeovimテーマを作るのか

### Hyprlandから始まったテーマづくり

このテーマづくりのきっかけは、実は**Neovim**ではなく**Hyprland**でした。

Hyprland 用に自作していた `YodaTheme`
深い緑を基調にした、静かで落ち着いたウィンドウテーマ。

「この雰囲気をNeovimにも持ち込みたい」

そう思った瞬間、Yoda.nvimの開発が始まりました。

自分だけの色を持つということ
毎日見る画面を、自分の感性で染め上げる。
それがテーマ開発の最大の魅力です。

### テーマ開発は難しくない

「でも、テーマ開発って難しそう...」
そう思うかもしれません。実際、私も最初はそう思っていました。
でも実は、Neovimテーマの基本は驚くほどシンプルです。必要なのは：

1. 色を決める
2. その色をどこに使うか指定する
3. ファイルとして保存する

たったこれだけ。

### この記事で学べること

この記事では、yoda.nvimの制作過程を追体験しながら、以下のことを学びます：

- **基礎知識**：Neovimテーマの仕組み
- **配色設計**：色に意味を持たせる方法
- **実装技術**：Luaでテーマを書く方法
- **プラグイン対応**：エコシステムとの調和
- **配布方法**：作ったテーマを世界と共有する

技術的な正確さを保ちながら、できるだけブレイクダウンして解説していきます。

最初は「Hello, Theme!」から。**たった3行のコード**で、あなただけのテーマが動き始めます。

<br/>

## 第2章：Neovimテーマの仕組みを理解する

### colorschemeコマンドの裏側

Neovimでテーマを変更するとき、こんなコマンドを使いますよね：

```vim
:colorscheme gruvbox
```

このとき、Neovimは何をしているのでしょうか？

実は、とてもシンプルな流れです：

1. `colors/gruvbox.lua`（または`.vim`）を探す
2. そのファイルを実行する
3. ファイル内の色設定が適用される

つまり、**テーマ = 色設定が書かれたLuaファイル**なんです。

### 「Hello, Theme!」- 最初の一歩

では、実際に最小限のテーマを作ってみましょう。

まず、Neovimの設定ディレクトリに`colors`フォルダを作ります：

```bash
mkdir -p ~/.config/nvim/colors
```

次に、`colors/mytheme.lua`を作成します：

```lua
-- ~/.config/nvim/colors/mytheme.lua
vim.cmd('highlight clear')
vim.o.background = 'dark'
vim.cmd('highlight Normal guibg=#1a1a1a guifg=#e0e0e0')
```

たった3行！これだけで、あなたの最初のテーマが完成です。

早速使ってみましょう：

```vim
:colorscheme mytheme
```

背景が暗いグレー、文字が明るいグレーに変わりましたか？

おめでとうございます！あなたは今、**Neovimテーマ開発者**の仲間入りをしました。

### highlightの基本概念

先ほどのコードで使った`highlight`コマンド。これがテーマ開発の核心です。

```lua
vim.cmd('highlight Normal guibg=#1a1a1a guifg=#e0e0e0')
--       ^^^^^^^^^ ^^^^^^ ^^^^^^^^^^^^^ ^^^^^^^^^^^^^
--          |        |         |             |
--          |        |         |             文字色
--          |        |         背景色
--          |        ハイライトグループ名
--          コマンド
```

**ハイライトグループ**とは、「どの部分の色を変えるか」を指定する名前です。

- `Normal`：通常のテキスト
- `Comment`：コメント
- `Keyword`：予約語（if、for など）
- `String`：文字列

他にも100以上のグループがありますが、心配しないでください。最初は10個程度覚えれば十分です。

### 少しずつ色を足していく

せっかくなので、もう少し色を追加してみましょう：

```lua
-- ~/.config/nvim/colors/mytheme.lua
vim.cmd('highlight clear')
vim.o.background = 'dark'

-- エディタの基本色
vim.cmd('highlight Normal guibg=#1a1a1a guifg=#e0e0e0')
vim.cmd('highlight Comment guifg=#608b4e')  -- 緑のコメント
vim.cmd('highlight LineNr guifg=#858585')   -- 行番号は控えめに

-- コードの色分け
vim.cmd('highlight String guifg=#ce9178')   -- 文字列はオレンジ
vim.cmd('highlight Keyword guifg=#c586c0')  -- キーワードは紫
vim.cmd('highlight Function guifg=#dcdcaa') -- 関数は黄色
```

保存して、`:colorscheme mytheme`を再実行すると...

おお！コードがカラフルになりましたね。これがテーマ開発の醍醐味です。

### 「あれ、この色どこに使われてるの？」

テーマを作っていると、必ずこんな疑問が湧きます：

「CursorLineって何？」
「StatusLineはどこの色？」

そんなときは、カーソル位置のハイライトグループを調べる魔法のコマンドがあります：

```vim
:Inspect
```

調べたい場所にカーソルを置いて実行すると、そこで使われているハイライトグループが表示されます。便利！

### Luaでもっとスマートに

ここまで`vim.cmd`を使ってきましたが、もっとLuaらしく書く方法があります：

```lua
-- より読みやすい書き方
local colors = {
  bg = '#1a1a1a',
  fg = '#e0e0e0',
  comment = '#608b4e',
  string = '#ce9178',
  keyword = '#c586c0',
  func = '#dcdcaa',
}

-- ハイライトを設定する関数
local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- 使いやすくなった！
hi('Normal', { bg = colors.bg, fg = colors.fg })
hi('Comment', { fg = colors.comment, italic = true })
hi('String', { fg = colors.string })
hi('Keyword', { fg = colors.keyword, bold = true })
hi('Function', { fg = colors.func })
```

見やすくなりましたね。さらに、`italic = true`や`bold = true`で、斜体や太字も設定できます。

### ファイル構造を整える

実際のテーマ開発では、もう少し構造化します：

```
mytheme/
├── colors/
│   └── mytheme.lua      # エントリーポイント
└── lua/
    └── mytheme/
        ├── init.lua     # メインのロジック
        └── palette.lua  # 色の定義
```

`colors/mytheme.lua`は、単に初期化を呼ぶだけ：

```lua
-- colors/mytheme.lua
require('mytheme').load()
```

実際の処理は`lua/mytheme/init.lua`に：

```lua
-- lua/mytheme/init.lua
local M = {}

function M.load()
  vim.cmd('highlight clear')
  vim.o.background = 'dark'

  -- 色の設定...
end

return M
```

この構造にすることで、後々の拡張が楽になります。

### 軽く触れる配色設計 — 色に意味を持たせる

テーマ開発の核心は「どの色を、どこに、なぜ使うか」にあります。
配色設計は深く掘り下げるとキリがないので、ここでは簡単に触れるだけにします。

**1. ベースカラーを決める**

背景と文字色の組み合わせをまず決めましょう。

```lua
local palette = {
  bg = '#050705',
  fg = '#d4d4d4',
}
```

暗すぎず、明るすぎず。
コントラスト比を意識して選ぶのがポイントです。

**2. テーマカラー（アクセント）を1つ決める**

```lua
local accent = "#00dd88"  -- ヨーダグリーン
```

あなたが落ち着く色をひとつ決めると、テーマ全体に統一感が生まれます。

**3. 色の組み合わせを考える**

複数の色を試すなら、[Coolors](https://coolors.co/)でパレットを作るのも、個人的にはオススメです。
配色を自動生成してくれるので、「どんな色が合うのか」直感的に理解できます。

## 第3章：コアハイライトを定義する - エディタに命を吹き込む

### Normalから始める理由

すべてのテーマ開発は`Normal`から始まります：

```lua
-- これがすべての基準になる
vim.api.nvim_set_hl(0, 'Normal', {
  bg = colors.bg,
  fg = colors.fg
})
```

なぜ`Normal`が重要なのか？それは、**他のすべての要素がNormalとの相対関係で見られるから**です。

背景が暗すぎる？文字が薄すぎる？すべては`Normal`次第です。

### エディタUIの階層構造

エディタのUIには視覚的な階層があります：

```lua
-- lua/mytheme/ui.lua
local colors = require('mytheme.palette').dark

-- レベル0: ベース
highlight('Normal', { bg = colors.bg, fg = colors.fg })

-- レベル1: わずかに浮いている
highlight('CursorLine', { bg = colors.bg_light })
highlight('ColorColumn', { bg = colors.bg_light })

-- レベル2: はっきり浮いている
highlight('Visual', { bg = colors.selection })
highlight('IncSearch', { bg = colors.accent, fg = colors.bg })

-- レベル3: フローティング
highlight('Pmenu', { bg = colors.bg_lighter, fg = colors.fg })
highlight('NormalFloat', { bg = colors.bg_lighter })

-- 特別: 注目を集める
highlight('CursorLineNr', { fg = colors.accent, bold = true })
highlight('MatchParen', { bg = colors.accent, fg = colors.bg })
```

この階層構造により、ユーザーの視線を自然に誘導できます。

### カーソル周りの演出

カーソルは、エディタで最も重要な要素の一つです：

```lua
-- カーソル行を優しく強調
highlight('CursorLine', {
  bg = colors.bg_light,  -- わずかに明るい背景
  -- fgは指定しない（テキストの色は変えない）
})

-- カーソル行の行番号は目立たせる
highlight('CursorLineNr', {
  fg = colors.accent,    -- アクセントカラー
  bg = colors.bg_light,  -- カーソル行と同じ背景
  bold = true            -- 太字で強調
})

-- カーソル列（あまり使われないけど）
highlight('CursorColumn', {
  bg = colors.bg_light
})

-- カーソル自体
highlight('Cursor', {
  bg = colors.fg,        -- 反転色
  fg = colors.bg
})
```

### 選択範囲を見やすくする

テキスト選択は頻繁に使う機能なので、見やすさが重要です：

```lua
-- ビジュアルモードの選択
highlight('Visual', {
  bg = colors.selection,
  -- fgは指定しない（テキストは読める必要がある）
})

-- ビジュアルモード時の非選択部分
highlight('VisualNOS', {
  bg = colors.selection,
  underline = true
})

-- 検索結果のハイライト
highlight('Search', {
  bg = colors.bg_search,
  fg = colors.fg_search
})

-- インクリメンタルサーチ（/を押した時）
highlight('IncSearch', {
  bg = colors.accent,
  fg = colors.bg,
  bold = true
})
```

### ステータスラインとタブライン

エディタの「枠」部分も大切です：

```lua
-- アクティブなステータスライン
highlight('StatusLine', {
  bg = colors.bg_statusline,
  fg = colors.fg_statusline,
  bold = true
})

-- 非アクティブなステータスライン
highlight('StatusLineNC', {
  bg = colors.bg_light,
  fg = colors.fg_dim
})

-- タブライン
highlight('TabLine', {
  bg = colors.bg_light,
  fg = colors.fg_dim
})

-- 選択中のタブ
highlight('TabLineSel', {
  bg = colors.bg,
  fg = colors.accent,
  bold = true
})

-- タブラインの空白部分
highlight('TabLineFill', {
  bg = colors.bg_lighter
})
```

### サイドバー要素

行番号やサインカラムなど、サイドバーの要素：

```lua
-- 行番号
highlight('LineNr', {
  fg = colors.fg_linenr,  -- 控えめな色
  bg = colors.bg_sidebar  -- わずかに違う背景（オプション）
})

-- サインカラム（gitの差分表示など）
highlight('SignColumn', {
  bg = colors.bg_sidebar
})

-- 折りたたみ
highlight('Folded', {
  bg = colors.bg_light,
  fg = colors.fg_dim
})

highlight('FoldColumn', {
  bg = colors.bg_sidebar,
  fg = colors.fg_dim
})

-- カラーカラム（80列目の線など）
highlight('ColorColumn', {
  bg = colors.bg_light
})
```

### エラーと警告の表現

診断情報は目立つ必要がありますが、うるさすぎてもいけません：

```lua
-- エラー
highlight('ErrorMsg', {
  fg = colors.error,
  bold = true
})

-- 警告
highlight('WarningMsg', {
  fg = colors.warning,
  bold = true
})

-- 情報
highlight('InfoMsg', {
  fg = colors.info
})

-- 質問
highlight('Question', {
  fg = colors.accent,
  bold = true
})

-- もっと多くのメッセージ表示
highlight('MoreMsg', {
  fg = colors.accent
})

-- タイトル
highlight('Title', {
  fg = colors.accent,
  bold = true
})
```

### 特殊な文字の表示

普段は見えない文字も、時には表示する必要があります：

```lua
-- 空白文字（:set list）
highlight('Whitespace', {
  fg = colors.fg_whitespace  -- かなり薄い色
})

-- 非テキスト（~で表される空行など）
highlight('NonText', {
  fg = colors.fg_whitespace
})

-- 特殊キー表示
highlight('SpecialKey', {
  fg = colors.fg_whitespace
})

-- 行末の空白
highlight('EndOfBuffer', {
  fg = colors.bg  -- 背景と同じにして見えなくする
})
```

### ポップアップメニュー

補完やコマンドラインのポップアップ：

```lua
-- ポップアップメニュー
highlight('Pmenu', {
  bg = colors.bg_popup,
  fg = colors.fg
})

-- 選択中の項目
highlight('PmenuSel', {
  bg = colors.bg_popup_sel,
  fg = colors.fg,
  bold = true
})

-- スクロールバー
highlight('PmenuSbar', {
  bg = colors.bg_lighter
})

-- スクロールバーのつまみ
highlight('PmenuThumb', {
  bg = colors.fg_dim
})
```

### 分割線とボーダー

ウィンドウの境界線：

```lua
-- 垂直分割線
highlight('VertSplit', {
  fg = colors.border,
  bg = colors.bg
})

-- Neovim 0.7以降
highlight('WinSeparator', {
  fg = colors.border,
  bg = colors.bg
})

-- フローティングウィンドウのボーダー
highlight('FloatBorder', {
  fg = colors.border,
  bg = colors.bg_float
})
```

### Diffモードの色

差分表示の色設定：

```lua
-- 追加行
highlight('DiffAdd', {
  bg = colors.diff_add,
  fg = colors.fg
})

-- 削除行
highlight('DiffDelete', {
  bg = colors.diff_delete,
  fg = colors.fg_dim
})

-- 変更行
highlight('DiffChange', {
  bg = colors.diff_change,
  fg = colors.fg
})

-- 変更部分のテキスト
highlight('DiffText', {
  bg = colors.diff_text,
  fg = colors.fg,
  bold = true
})
```

### すべてをまとめる

詳細なハイライトグループの設定は多岐にわたりますが、基本的なパターンは以下のようになります：

```lua
-- lua/mytheme/highlights/editor.lua
local M = {}

function M.setup(colors)
  local h = vim.api.nvim_set_hl

  -- Normal
  h(0, 'Normal', { bg = colors.bg, fg = colors.fg })

  -- Cursor
  h(0, 'CursorLine', { bg = colors.bg_light })
  h(0, 'CursorLineNr', { fg = colors.accent, bold = true })

  -- Visual
  h(0, 'Visual', { bg = colors.selection })

  -- Search
  h(0, 'Search', { bg = colors.bg_search })
  h(0, 'IncSearch', { bg = colors.accent, fg = colors.bg })

  -- などなど...
end

return M
```

### 実際に確認する

設定したハイライトが正しく動いているか確認：

```vim
" カーソル行の確認
:set cursorline

" 検索の確認
/test

" ビジュアルモードの確認
V

" ポップアップの確認
:Telescope find_files
```

<br />

## 第4章：シンタックスハイライト - コードを読みやすくする

### TreeSitterとの付き合い方

Neovimでは、シンタックスハイライトに**TreeSitter**を使うのが主流です：

```lua
-- 従来の正規表現ベース
vim.cmd('highlight String guifg=#ce9178')

-- TreeSitterベース（より正確）
vim.api.nvim_set_hl(0, '@string', { fg = colors.string })
```

`@`で始まるのがTreeSitterのハイライトグループです。より文脈を理解した正確な色付けができます。

### 基本的なシンタックスグループ

まず、ほぼすべての言語で使われる基本的なグループから：

```lua
-- lua/mytheme/highlights/syntax.lua
local function setup_syntax(colors)
  local h = vim.api.nvim_set_hl

  -- コメント（最重要！）
  h(0, 'Comment', { fg = colors.comment, italic = true })
  h(0, '@comment', { link = 'Comment' })

  -- 文字列
  h(0, 'String', { fg = colors.string })
  h(0, '@string', { link = 'String' })

  -- 数値
  h(0, 'Number', { fg = colors.number })
  h(0, '@number', { link = 'Number' })

  -- キーワード
  h(0, 'Keyword', { fg = colors.keyword })
  h(0, '@keyword', { link = 'Keyword' })

  -- 関数
  h(0, 'Function', { fg = colors.func })
  h(0, '@function', { link = 'Function' })

  -- などなど...
end
```

シンタックスハイライトの詳細設定（言語固有の調整、特殊なハイライトなど）については、[yoda.nvimのGitHub](https://github.com/kuri-sun/yoda.nvim/blob/main/lua/yoda/highlights.lua)で確認できます。

### 実際の使用例で確認

実際のコードで確認してみましょう：

```lua
-- このコードがどう色付けされるか
local function calculate_total(items)
  -- TODOコメントは目立つはず
  -- TODO: エラーハンドリングを追加

  local total = 0  -- 変数は標準色

  for i, item in ipairs(items) do  -- キーワードは強調
    if item.price > 0 then  -- 条件式も強調
      total = total + item.price  -- 演算子は別色
    end
  end

  return total  -- returnは特別な色
end

-- 文字列のエスケープ
local message = "価格は\n\"" .. total .. "\"円です"
```

### 読みやすさのバランス

色が多すぎても少なすぎても読みにくくなります：

```lua
-- ❌ 虹色（カラフルすぎる）
-- すべての要素を違う色にする
-- → 目がチカチカして読みにくい

-- ❌ モノトーン（地味すぎる）
-- すべてグレーの濃淡だけ
-- → 構造が把握しにくい

-- ✅ バランス型（yoda.nvimのアプローチ）
-- 基本は落ち着いた色
-- 重要な要素だけアクセントカラー
-- 関連する要素は同系色でまとめる
```

### デバッグとテスト

シンタックスハイライトの確認方法：

```vim
" 現在位置のハイライトグループを確認
:Inspect

" TreeSitterの状態を確認
:TSHighlightCapturesUnderCursor

" 特定のハイライトグループをテスト
:hi @function
```

<br />

# 第5章：プラグイン対応 - エコシステムとの調和

### なぜプラグイン対応が必要か

素晴らしいコアテーマを作っても、プラグインの配色がバラバラだと統一感が崩れます。

```lua
-- よくある問題
-- テーマ：落ち着いた緑系
-- Telescope：デフォルトの青系  → 違和感！
-- Neo-tree：デフォルトの紫系   → さらに違和感！
```

### モジュラー設計で拡張性を確保

`yoda.nvim` では、プラグインごとにファイルを分けて管理しています。

```lua
-- lua/yoda/plugins/init.lua
local M = {}

M.supported = {
  'telescope',
  'lualine',
  'gitsigns',
  'cmp',
  -- ...
}

function M.load(colors, config)
  for _, plugin in ipairs(M.supported) do
    if config.plugins[plugin] ~= false then
      local ok, mod = pcall(require, 'yoda.plugins.' .. plugin)
      if ok then mod.setup(colors) end
    end
  end
end

return M
```

この設計の利点：

- 必要なプラグインのみ読み込み
- メンテナンスが容易

### Telescope対応（代表例）

最も人気の高いファジーファインダー「Telescope」対応を例に見てみましょう。

```lua
-- lua/yoda/plugins/telescope.lua
local M = {}

function M.setup(colors)
  local h = vim.api.nvim_set_hl

  -- プロンプト
  h(0, 'TelescopePromptNormal', { bg = colors.bg_search, fg = colors.fg })
  h(0, 'TelescopePromptTitle',  { bg = colors.accent, fg = colors.bg })
  h(0, 'TelescopeSelection',    { bg = colors.bg_highlight, bold = true })
  h(0, 'TelescopeMatching',     { fg = colors.match, bold = true })
end

return M
```

### 他プラグイン対応（簡潔に紹介）

代表例以外の主要プラグインも、同じ構造で対応可能です。
それぞれの詳細コードは、[yoda.nvimのGitHubリポジトリ](https://github.com/kuri-sun/yoda.nvim)で確認できます。

| プラグイン                                                 | 機能             |
| :--------------------------------------------------------- | :--------------- |
| [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) | ファイルツリー   |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)            | 補完メニュー     |
| [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)     | Git差分          |
| LSP診断                                                    | 診断や警告表示   |
| indent-blankline                                           | インデントガイド |
| Treesitter Context                                         | コンテキスト表示 |
| Lualine                                                    | ステータスライン |

...

<br/>

# 第6章：設定可能にする - ユーザーフレンドリーなテーマ設計

### カスタマイズは「愛着」につながる

```lua
-- Aさん「背景は透明がいい」
-- Bさん「コメントは斜体じゃないと」
-- Cさん「関数名はもっと目立たせたい」
```

すべての好みに応えることは不可能。
だからこそ、**ユーザーが自分で調整できる余地**を設けます。

### `setup()`関数で設定を受け取る

```lua
-- lua/yoda/init.lua
local M = {}

M.defaults = {
  transparent_background = false,
  italic_comments = true,
  bold_keywords = true,
  style = 'dark',
  plugins = { telescope = true, lualine = true },
  colors = {},
  custom_highlights = {},
}

function M.setup(user_config)
  M.config = vim.tbl_deep_extend('force', M.defaults, user_config or {})
end
```

> 🎨 ユーザーは `.setup()` に設定を渡すだけ。
> シンプルなAPIが「使いやすさ」を作ります。

### 代表的なカスタマイズ例

#### 透明背景

```lua
require('yoda').setup({
  transparent_background = true,
})
```

#### カスタムカラー上書き

```lua
require('yoda').setup({
  colors = {
    accent = '#00ff99',
    bg = '#000000',
  }
})
```

#### カスタムハイライト追加

```lua
require('yoda').setup({
  custom_highlights = {
    Function = { fg = '#ff8800', bold = true },
    ['@string'] = { fg = '#99cc99' },
  }
})
```

#### スタイル切り替え

```lua
require('yoda').setup({ style = 'light' })
require('yoda').toggle()  -- 動的切り替え
```

### 設定のバリデーション

```lua
local function validate(config)
  if type(config.transparent_background) ~= 'boolean' then
    vim.notify('Invalid value: transparent_background', vim.log.levels.WARN)
    config.transparent_background = false
  end
  return config
end
```

ユーザーの入力に優しく、壊れにくい構成を目指します。

<br />

## 第7章：開発を効率化する - 作りながら確認する

### 開発モードの必要性

テーマ開発の最大の悩み：

```lua
-- 1. 色を変更
-- 2. ファイルを保存
-- 3. Neovimを再起動
-- 4. :colorscheme mytheme
-- 5. 「うーん、もうちょっと明るく...」
-- 6. 1に戻る（無限ループ）
```

この苦痛から解放される方法があります！

### 自動リロードの実装

ファイル保存時に自動でテーマをリロード：

```lua
-- lua/mytheme/dev.lua
local M = {}
local watch_group = nil

function M.enable()
  -- 既存の監視を解除
  if watch_group then
    vim.api.nvim_del_augroup_by_id(watch_group)
  end

  -- 新しい監視グループを作成
  watch_group = vim.api.nvim_create_augroup('MythemeDevMode', { clear = true })

  -- テーマ関連ファイルの監視
  vim.api.nvim_create_autocmd('BufWritePost', {
    group = watch_group,
    pattern = {
      '*/mytheme/*.lua',
      '*/mytheme/**/*.lua',
      '*/colors/mytheme.lua',
    },
    callback = function()
      -- キャッシュをクリア
      package.loaded['mytheme'] = nil
      package.loaded['mytheme.init'] = nil
      package.loaded['mytheme.palette'] = nil
      package.loaded['mytheme.highlights'] = nil
      -- 他のモジュールも...

      -- テーマを再読み込み
      vim.cmd('colorscheme mytheme')
      vim.notify('Theme reloaded!', vim.log.levels.INFO)
    end,
  })

  vim.notify('Development mode enabled', vim.log.levels.INFO)
end

function M.disable()
  if watch_group then
    vim.api.nvim_del_augroup_by_id(watch_group)
    watch_group = nil
    vim.notify('Development mode disabled', vim.log.levels.INFO)
  end
end

return M
```

使い方：

```lua
-- 開発開始時
require('mytheme.dev').enable()

-- 開発終了時
require('mytheme.dev').disable()
```

<br />

## 第6章：自分のテーマプラグインを共有する

### 公開してみよう

ここまでで、自分のテーマがひと通り動くようになりました。
せっかく作ったなら、**他のNeovimユーザーにも使ってもらいましょう。**

公開の方法は簡単です。
GitHubリポジトリを作成して、`README.md` にインストール例を記載します。

### Lazy.nvim対応例

多くのユーザーは [Lazy.nvim](https://github.com/folke/lazy.nvim) でプラグイン管理をしています。
以下のような設定例を書いておくと、導入がスムーズです。

```lua
-- lazy.nvim
{
  'username/mytheme.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('mytheme').setup({
      transparent_background = true,
      style = 'dark',
    })
  end
}
```

### おわりに

自作テーマを公開すると、**思いがけずStarやPRが届くことがあります。**
それが次の改善や別テーマづくりのモチベーションにもつながります。

めちゃ長くなりました。。。
最後まで、お付き合い頂き、本当にありがとうございました。

あなたのNvimテーマプラグインがGithubで見れるのを楽しみにしております！
では、また！

_kuri-sun_

