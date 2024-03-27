import { defineConfig } from 'vitepress';

// https://vitepress.dev/reference/site-config
export default defineConfig({
  base: '/blog/',
  title: 'Blog',
  description: 'Blog Site',
  markdown: {
    lineNumbers: true,
  },
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Examples', link: '/markdown-examples' },
    ],
    sidebar: [
      {
        text: 'Android_Java_Kotlin',
        collapsed: false,
        items: [],
      },
      {
        text: 'Web_Js_Ts',
        collapsed: false,
        items: [],
      },
      {
        text: 'Flutter_Dart',
        collapsed: false,
        items: [
          { text: '学习Dart类的概念', link: '/flutter/learn_dart_class' },
        ],
      },
      {
        text: 'Ios_Oc_Swift',
        collapsed: false,
        items: [{ text: 'Mac电脑设置', link: '/ios/init' }],
      },
      {
        text: 'Other',
        collapsed: false,
        items: [
          { text: 'VSCode的个人设置', link: '/other/vscode_seeting' },
          { text: 'github的代理', link: '/other/github_proxy' },
        ],
      },
      {
        text: 'Examples',
        items: [
          { text: 'Markdown Examples', link: '/markdown-examples' },
          { text: 'Runtime API Examples', link: '/api-examples' },
        ],
      },
    ],
    socialLinks: [
      { icon: 'github', link: 'https://github.com/vuejs/vitepress' },
    ],
  },
});
