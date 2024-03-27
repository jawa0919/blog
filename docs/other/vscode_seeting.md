# VSCode设置


## jawa0919.code-snippets

```json
{
	"todo": {
		"prefix": "todo",
		"body": [
			"$LINE_COMMENT TODO $CURRENT_YEAR-$CURRENT_MONTH-$CURRENT_DATE $CURRENT_HOUR:$CURRENT_MINUTE:$CURRENT_SECOND $1"
		],
		"description": "new TODO snippet"
	},
	"fixme": {
		"prefix": "fixme",
		"body": [
			"$LINE_COMMENT FIXME $CURRENT_YEAR-$CURRENT_MONTH-$CURRENT_DATE $CURRENT_HOUR:$CURRENT_MINUTE:$CURRENT_SECOND $1"
		],
		"description": "new FIXME snippet"
	}
}

```


## settings.json

```json
{
    "workbench.iconTheme": "vscode-icons",
    "editor.rulers": [
        80,
        120,
        160,
        180,
        200
    ],
    "editor.guides.bracketPairs": true,
    "editor.linkedEditing": true,
    "editor.minimap.maxColumn": 80,
    "explorer.fileNesting.enabled": true,
    "explorer.fileNesting.expand": false,
    "explorer.fileNesting.patterns": {
        "*.ts": "${capture}.js",
        "*.js": "${capture}.js.map, ${capture}.min.js, ${capture}.d.ts",
        "*.jsx": "${capture}.js",
        "*.tsx": "${capture}.ts",
        "*.dart": "$(capture).freezed.dart, $(capture).g.dart",
        "main.dart": "main_*.dart",
        "tsconfig.json": "tsconfig.*.json",
        "package.json": "package-lock.json, yarn.lock, pnpm-lock.yaml",
        ".env": "*.env, .env.*, .envrc, env.d.ts",
        ".gitignore": ".gitattributes, .gitmodules, .gitmessage, .mailmap, .git-blame*",
        "pubspec.yaml": ".metadata, .packages, all_lint_rules.yaml, analysis_options.yaml, build.yaml, pubspec.lock, .flutter-plugins, .flutter-plugins-dependencies",
        "vite.config.*": "*.env, .babelrc*, .codecov, .cssnanorc*, .env.*, .envrc, .htmlnanorc*, .lighthouserc.*, .mocha*, .postcssrc*, .terserrc*, api-extractor.json, ava.config.*, babel.config.*, cssnano.config.*, cypress.json, env.d.ts, htmlnanorc.*, jasmine.*, jest.config.*, jsconfig.*, karma*, lighthouserc.*, playwright.config.*, postcss.config.*, puppeteer.config.*, svgo.config.*, tailwind.config.*, tsconfig.*, tsdoc.*, unocss.config.*, vitest.config.*, webpack.config.*, windi.config.*",
        "vue.config.*": "*.env, .babelrc*, .codecov, .cssnanorc*, .env.*, .envrc, .htmlnanorc*, .lighthouserc.*, .mocha*, .postcssrc*, .terserrc*, api-extractor.json, ava.config.*, babel.config.*, cssnano.config.*, cypress.json, env.d.ts, htmlnanorc.*, jasmine.*, jest.config.*, jsconfig.*, karma*, lighthouserc.*, playwright.config.*, postcss.config.*, puppeteer.config.*, svgo.config.*, tailwind.config.*, tsconfig.*, tsdoc.*, unocss.config.*, vitest.config.*, webpack.config.*, windi.config.*"
    },
    "files.eol": "\n",
    "files.associations": {
        "*.arb": "json",
        "*.config.json": "jsonc",
        "*Config.json": "jsonc"
    },
    "[jsonc]": {
        "editor.defaultFormatter": "vscode.json-language-features"
    },
    "[json]": {
        "editor.defaultFormatter": "vscode.json-language-features"
    },
    "[markdown]": {
        "editor.defaultFormatter": "yzhang.markdown-all-in-one"
    },
    "[html]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "[javascript]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "[css]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "[scss]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "[less]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "[vue]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "[typescript]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "[typescriptreact]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "cSpell.userWords": [
        "ARGB",
        "Easc",
        "eruda",
        "flavorizr",
        "gitee",
        "jawa",
        "LTRB",
        "Pinia",
        "pnpm",
        "scrcpy",
        "vant",
        "vite",
        "windi",
        "windicss",
        "writeln"
    ],
    "[dart]": {
        "editor.formatOnSave": true,
        "editor.formatOnType": true,
        "editor.rulers": [
            80,
        ],
        "editor.selectionHighlight": false,
        "editor.suggest.snippetsPreventQuickSuggestions": false,
        "editor.suggestSelection": "first",
        "editor.tabCompletion": "onlySnippets",
        "editor.wordBasedSuggestions": false
    },
    "dart.devToolsLocation": "external",
    "dart.flutterCreatePlatforms": [
        "android",
        "ios",
    ],
    "git.autofetch": true,
    "commentTranslate.targetLanguage": "zh-CN",
    "github.gitProtocol": "ssh",
    "path-autocomplete.pathMappings": {
        "@": "${workspaceFolder}/src"
    },
    "todo-tree.general.showActivityBarBadge": false,
    "rest-client.previewOption": "exchange",
    "editor.unicodeHighlight.allowedLocales": {
        "zh-hans": true,
        "zh-hant": true
    },
}

```