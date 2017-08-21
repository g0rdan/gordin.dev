---
layout: post
title: My favorite Visual Studio for Mac plugins
description: "I would like to share my favorite addins for Visual Studio for Mac. I'm using IDE for a long time and I collected a tools which help me do my work."
date: 2017-08-18
tags: [xamarin, visual studio, vs4mac, xamarin studio, addins, plugins, IDE]
comments: true
share: true
---

As you know, Visual Studio for Mac is a mobile-first, cloud-first IDE from Microsoft (Xamarin). This IDE supports develop for iOS, Android, Mac, Web, Games, etc. It also has debugger and rich tooling. Also, as a big IDE, it has "Add-Ins" plugin system.

Like others big IDEs vs4mac can be improved by installing plugins. I've worked with vs4mac (Xamarin Studio) more than 3 years and collected a bunch of plugins that help me. Let's take a look to following list below.

## [MFactor](https://www.mfractor.com)

It's a most popular plugin for Visual Studio for Mac. If you used big Visual Studio from PC, you know ReSharper. So, MFactor it's ReSharper from mac world. MFactor can help you to improve your code quality, make some code blocks in simpler way and so on. The plugins has 3 area:

- Xamarin.Forms
- Xamarin.Android.
- C#

Firts two of areas has limited support in lite version of plugin. Third works only in professional version. This's only one bad side of plugin, it is not free. But we can use limited free version.
Let's take an example from official site:

"To use MFractors code actions:"

- Press `Alt + Return` within a C#, XAML or Android Resource document.
- Right click and select `Quick Fix` in a C# document.

![example](http://docs.mfractor.com/img/code-actions/using-code-actions.gif)

You can find more information about how MFactor works on [official doc pages](http://docs.mfractor.com) and I swear, if you feel like you need something in vs4mac and you can't find that, probably you have to look at MFactor.

## [Macaque Tips](https://github.com/mhutch/MonoDevelop.Macaque)

Apparently, you've noticed that working with vs4mac (but more Xamarin Studio) it's not same feelings about working with big Visual Studio. For example, you can don't find familiar hot keys. This plugin can help you wiht that. Every time when you are opening vs4mac it's showing you some tips fow working with IDE.

![macaque tips example](http://g0rdan.com/assets/images/macaque.tips.example.png)

Probably, you know about `Command + .` hot key. It's  the shortest way to find some files in your projects. But apparently, you don't know that if you will type `MainView:75` in search input you can jump into 75 line of MainView file! That's amazing! You definitly have to try this plugin.

To install the plugin go to `Extensions -> Gallery` and type into search input **Macaque**.

## [MvvmCross Template Pack](https://github.com/jimbobbennett/MvvmCross.XSAddIn)

If you are like me and like to use MvvmCross framework, you know that it's kind of hard to build an example MvvmCross project by following some instructions. I don't know, maybe it's because the documentation doesn't (didn't) have enough information about that. But now you have a simple way to do that. Just use MvvmCross Template Pack from [Jim Bennett](https://twitter.com/jimbobbennett). It's too simple, you need go to `Extensions -> Gallery`, type **MvvmCross** and that's it. Afetr that you'll find a new template in new projects window with 2 new types: native MvvmCross project for iOS and Android or Xamarin.Forms MvvmCross project. Choise your favorite way to build mobile apps and... that's all.

*PS: If you know some other useful for you plugins write in comments below. I'll be glad find a new addins for vs4mac.*
