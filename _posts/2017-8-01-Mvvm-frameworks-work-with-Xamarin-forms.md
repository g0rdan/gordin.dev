---
layout: post
title: MVVM frameworks &#58; Work with Xamarin.Forms
description: "Let's figure out how the frameworks connect and work with Xamarin.Forms. (And do they have this opportunity?)"
date: 2017-08-01
tags: [xamarin.forms, mvvm, framework, xamarin]
comments: true
share: true
---

First of all, I need explain why we have to review this. Most of all frameworks can work with platforms without using Xamarin.Forms and they do it great! But now, Xamarin inc. do a lot of promotion to use Xamarin.Forms. They bet on this. Which is good. I like the fact that we can use a shared UI. I not so like the way to do this in Xamarin.Forms, but they, as I can see, are slowly turning out from the way, when I need use Xamarin.Forms project to all of my application, to a way, when I can pick only a few shared UI elements (views, controlls) and use them only a few screens.

Second of all, we need a common platform to see how frameworks are working and it's Xamarin.Forms projects. You can say "Xamarin.Forms already has MVVM pattern implementation inside" and you will be right. But many of frameworks have more things that only MVVM and it should to help you build a great apps.

When you want to use any of frameworks you have to download some nuget packages which contains frameworks. From time to time the packages can change names and structure. I won't write what exactly packages you should find and install. You have to figure it out by yourself. 

## FreshMvvm

Probably, FreshMvvm has a most simple way to use the framework with your Xamarin.Forms app. Basicaly, you just need give a name of view models as "a QuotePageModel must have a QuotePage". The BindingContext on the page will be automatically set with the Model. That's it.

## MvvmCross

MvvmCross documentation has a great [guidline](https://www.mvvmcross.com/documentation/platform/xamarin-forms) how to use the framework with Xamarin.Forms. It's more work to join MvvmCross wich Xamarin.Forms project and I won't repeat all of steps that you can find on official document page. Just want to notice, that we have to inherit from 'MvxFormsApplication' instead 'FormsApplication' in core project. Also we have to add a "Presenter" (we'll talk more about presenter soon) to platform projects.

*To be continued*

> If you see some inaccuracies or defects in this article, you can send [PR](https://github.com/g0rdan/g0rdan.github.io) to improve it. Especially if you see grammar mistakes (probably it has a lot of mistakes).