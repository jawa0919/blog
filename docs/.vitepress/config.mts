import { defineConfig } from 'vitepress'

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
      { text: 'Home', link: '/' },
      { text: "Note", link: "/note" },
      { text: 'Examples', link: '/markdown-examples' }
    ],
    sidebar: [
      {
        text: "Note",
        items: [
          { text: "Note笔记", link: "/note" }
        ],
      },
      {
        text: "Android_Java_Kotlin",
        collapsed: false,
        items: [
          { text: "Gradle", link: "/android_java_kotlin/gradle" },
        ],
      },
      {
        text: "App_Profile_Setting",
        collapsed: false,
        items: [
          { text: "下载应用", link: "/app_profile_setting/download" },
        ],
      },
      {
        text: "Flutter_Dart",
        collapsed: false,
        items: [
          { text: "学习Dart类的概念", link: "/flutter_dart/learn_dart_class" },
        ],
      },
      {
        text: "Ios_Oc_Swift",
        collapsed: false,
        items: [
          { text: "Mac电脑设置", link: "/ios_oc_swift/mac_settings" }
        ],
      },
      {
        text: "Net_Proxy",
        collapsed: false,
        items: [
          { text: "github的代理", link: "/net_proxy/github_proxy" },
        ],
      },
      {
        text: "Other",
        collapsed: false,
        items: [
          { text: "image资源", link: "/other/image_res" },
          { text: "VSCode设置", link: "/other/vscode_settings" },
        ],
      },
      {
        text: "Web_Js_Ts",
        collapsed: false,
        items: [
          { text: "pnpm", link: "/web_js_ts/pnpm" },
        ],
      },
      {
        text: 'Examples',
        items: [
          { text: 'Markdown Examples', link: '/markdown-examples' },
          { text: 'Runtime API Examples', link: '/api-examples' }
        ]
      }
    ],
    socialLinks: [{ icon: "github", link: "https://github.com/jawa0919/blog" }],
  }
})
