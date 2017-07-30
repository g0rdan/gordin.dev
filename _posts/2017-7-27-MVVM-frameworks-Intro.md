---
layout: post
title: Let's compare some MVVM frameworks
---

Every time when you want to start a new project with Xamarin, on one hand you want to try a new libraries and frameworks, but in other hand you are scared about "what if I will spend pretty much time to learn some framework/libraries/etc, it will not fit in my requirements".

I'm familiar only with MvvmCross and it happens with me every time when I want to try a new MVVM framework for some new projects.

So, let's take a look to a most popular Xamarin MVVM frameworks (by alphabet):

- [FreshMvvm](https://github.com/rid00z/FreshMvvm)
- [MvvmCross](https://github.com/MvvmCross/MvvmCross)
- [MvvmLight](http://www.mvvmlight.net/)
- [Prism](https://github.com/PrismLibrary/Prism)
- [ReactiveUI](https://github.com/reactiveui/ReactiveUI)

In this series of articles I want to dive deep into a few things:

- Intro (it's just overview)
- Bindings
- Navigation
- Work with Xamarin.Forms
- Plugins/modules/etc
- Support

Also I will make a small projects for each of frameworks and upload their to [github](https://github.com/g0rdan/MvvmFrameworksTests).

I think I will split the article to a few small articles by above parameters. Well, now we'll make a quick reviews for each of frameworks.

## Intro

To light compare these frameworks I use following parameters: is it OSS, how many platforms are frameworks using, a develop state, will try to find some big projects wich using these frameworks.

| Framework | OSS | License | Platforms | Developing state | Apps |
|-----------|:-------------:|:------|:------|:------|:---|
| FreshMvvm  |  &#10004; | [Apache-2.0](https://github.com/rid00z/FreshMvvm/blob/master/LICENSE) | Xamarin.Forms | Active 
| MvvmCross  |    &#10004;   |   [MS-PL](https://github.com/MvvmCross/MvvmCross/blob/develop/LICENSE)| Xamarin.Forms, <br> Xamarin.Android, <br> Xamarin.iOS, <br> Xamarin.Mac, <br> Xamarin.tvOS, <br> UWP, <br> WPF | Active | [CodeHub (iOS)](http://codehub-app.com/) <br> [Fish Angler (Android)](https://play.google.com/store/apps/details?id=com.fishangler.fishangler&pcampaignid=MKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1) <br> [Fish Angler (iOS)](https://itunes.apple.com/us/app/fish-angler-fishing-reports-forecast-logbook/id1073941118?mt=8) <br> [Caledos Runner (Android)](https://play.google.com/store/apps/details?id=com.caledoslab.runner&pcampaignid=MKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1)
| MvvmLight  | &#10004; |    [MIT](https://mvvmlight.codeplex.com/license) | Xamarin.Forms, <br> Xamarin.Android, <br> Xamarin.iOS, <br> UWP, <br> WPF, <br> Windows Phone (deprecated), <br> Silverlight (deprecated) | Not active
| Prism      | &#10004; |    [Apache-2.0](https://github.com/PrismLibrary/Prism/blob/master/LICENSE) | Xamarin.Forms, <br> UWP, <br> WPF | Active
| ReactiveUI | &#10004; |    [MS-PL](https://github.com/reactiveui/ReactiveUI/blob/develop/LICENSE) | Xamarin.Forms, <br> Xamarin.Android, <br> Xamarin.iOS, <br> Xamarin.Mac, <br> UWP, <br> WPF, <br> WinForms | Active | [Mimo (iOS and Android)](https://getmimo.com/) <br> [Github Desktop (Windows)](https://getmimo.com/) <br> [nonlinear](http://www.nonlinear.com/) <br> [Espera (WPF and Android)](http://getespera.com/) <br> [CodeHub (iOS)](http://codehub-app.com/) <br> [PdrMobile (iOS and Android)](https://pdrmobile.com/) <br> **[More example on GitHub](https://github.com/reactiveui/ReactiveUI/issues/979)**

As you can see all of these frameworks are a good products with community and support. Some of them is only for Xamarin.Forms, some of them has not active support right now, but you can pick any of them and build a great app on many platforms. Any licence provide commercial use, which is good. Going forward, I want to say each of frameworks has infrastructure to build any bussines logic.

> If you see some inaccuracies or defects in this article, you can send [PR](https://github.com/g0rdan/g0rdan.github.io) to improve it. Especially if you see grammar mistakes (probably it has a lot of mistakes).