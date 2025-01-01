import { defineConfig } from "vitepress";

// https://vitepress.dev/reference/site-config
export default defineConfig({
  base: "/blog/",
  title: "Blog",
  description: "Jawa0919 Blog",
  markdown: {
    lineNumbers: true,
  },
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: "Home", link: "/" },
      { text: "Note", link: "/note" },
      { text: "Examples", link: "/markdown-examples" },
    ],
    sidebar: [
      {
        text: "Note",
        items: [{ text: "Note笔记", link: "/note" }],
      },
      {
        text: "Android_Java_Kotlin",
        collapsed: false,
        items: [],
      },
      {
        text: "Web_Js_Ts",
        collapsed: false,
        items: [],
      },
      {
        text: "Flutter_Dart",
        collapsed: false,
        items: [
          { text: "学习Dart类的概念", link: "/flutter/learn_dart_class" },
        ],
      },
      {
        text: "Ios_Oc_Swift",
        collapsed: false,
        items: [{ text: "Mac电脑设置", link: "/ios/mac_settings" }],
      },
      {
        text: "Other",
        items: [
          { text: "VSCode设置", link: "/other/vscode_settings" },
          { text: "github的代理", link: "/other/github_proxy" },
          { text: "image资源", link: "/other/image_res" },
        ],
      },
      {
        text: "Examples",
        items: [
          { text: "Markdown Examples", link: "/markdown-examples" },
          { text: "Runtime API Examples", link: "/api-examples" },
        ],
      },
    ],
    socialLinks: [{ icon: "github", link: "https://github.com/jawa0919/blog" }],
  },
});
