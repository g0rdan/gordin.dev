---
layout: post
title: How to get a bit more disk space on your Mac
description: "If you have macbook with small SSD you should read this article"
date: 2018-01-27
tags: [Xamarin, iOS, Android, macOS, MacBook]
comments: true
share: true
published: true
---

As a xamarin developer you probably noticed that all develop environment takes a lot of space in your SSD. Xamarin SDKs and tools, Xcode + SDK, Android with his own SDKs and IDEs. I even don't mention emulators for each of platform.
If you're like me and your machine has 256 Gb SDD or less you should know what I feel when time is coming and I have to clean my disk to get a bit more free space. It's always pain.

After 2 years doing this shitty work I have some experience and I want to share it. So, let's take a look.

### Delete unnecessary iOS simulators

Recently, I have noticed that I use only a few iOS simulators for work and I was curious how much space takes others. It was surprise. After deleting unnecessiary simulators my disk space incresed more than 20 Gb. For removing simulators you should open XCode, go to ```Windows -> Devices and Simulators```

![iOS simulators](http://g0rdan.com/assets/images/simulators.png)

There is list of installed simulators and if you aren't using some of them you can delete these simulators.

### Use 'xcrun simctl erase all'

When I'm building one of my project it takes more than 1 Gb disk space in simulator folder. As a developer I have to test my apps on difirent screen dimensions, diferent platforms as iPhone/iPad, etc, which is creating a lot of copies of these folders into ```~/Library/Developer/CoreSimulator/Devices/```. I bet you have seen the following image before:

![iOS simulators folders](http://g0rdan.com/assets/images/simulator_copies.png)

You could clean these folders manually or you can use ```'xcrun simctl erase all'``` command in the terminal.

### Watch your Android SDKs

If you're an Xamarin.Android developer you probably know that you need android SDK for developing and of course you already have it on machine. Most typical way to find what you have in SDK it look at ```Tools -> SDK Manager``` in VS for Mac (I don't have a Windows device, so I can't tell how you should to find SDK settings in VS).

![iOS simulators folders](http://g0rdan.com/assets/images/androd_sdk_window.png)

As you can see, there are a lot of options. Someone is checked, someone is unchecked. You should carefully look at the list and figure out what you need.
You do not need Android Wear SDKs if you're not using them, for example. Or, in most cases, you need only latest SDK version. It has to work even if you're developing android app for android version less than SDK version.
Also, you can check ```Tools``` tab on the window. There are many options that you could unchecked either.

### Use shared Android SDK between Xamarin tools and Android tools

It's a quite often situation when you have to install Android Studio, for example. If you want to work with UI more flexible or if you want to bind native android library and you need to build a package from a source. All of these follow instalation of Android Studio, but with IDE you're taking a new instance of Android SDK. I highly recommend choosing an existing android SDK which delivers with Xamarin.Android instead of downloading a new one, because you don't need it, you already have it.

### Archives

Archives are pre-releale states for iOS and Android packages. That allows you to write release notes, check app size, browse app icons, and distribute your application.

![Xamarin Archives](http://g0rdan.com/assets/images/archives.png)

Eventually, archive list will grow with each new version of an app. You shouldn't keep all archives. Basically, you need to save only one last archive and after release even that archive you could remove. So, it's a good practice to delete old archives.

### Nuget cache

I assume you're .NET developer if you're here and reading this article. So, as .NET developers, we all are using Nuget packages, it's very convinient way to use 3rd-part solutions for your projects. I even can't imagine my workly days without using that.

One of the most advantage things in Nuget ecosystem is caching. If you have used some nuget package and going to use the same package in another project, the package will not download one more time. The IDE will take the package from cache folder. This folder will grow during the time and will contain many packages which you are not using anymore. So, we just could clean the folder and needed packages will be downloaded in next time when the project will be loaded.

```
~/.nuget/packages
~/.local/share/NuGet
```
Calmly clean folders above.

### Android Library Cache

If you're using Xamarin.Android you have to know that without using Android.Support libraries you basicaly could not create an app. Xamarin has bindings for the librarines and they are named as "Xamarin.Android.Support.*". Google delivers a new versions of the libraries pretty quickly and all old versions are stored in disk as well when it happens. So, as we already know, we have to clean this!

```
~/.local/share/Xamarin
```

You can remove all folder there that begins with "Xamarin.*"

### Visual Studio Download Cache

Your favorite IDE has cache folder, too!

```
~/Library/Caches/VisualStudio/7.0/TempDownload
```
Clean that folder and don't worry!

### Look at following folders

```
/Library/Frameworks/Xamarin.Android.framework/Versions
/Library/Java/JavaVirtualMachines
/Users/*USERNAME*/Library/Developer/Xcode/iOS DeviceSupport
```
The paths contain versions of products. So, if you see a list of old versions of JVM, for example, you could probably delete them. Similar situation with other products.

### Clean your Trash

It's pretty obvious thing but you need to clean your trash sometimes. All of these deleted "bin/obj" folders in your trash folder, if you have these, takes a lot of disk space. I get user to clean my disk space with Dr. Cleaner app. It's cleaning not only trash, it handels cleaning your apps and browsers cache and even XCode junk. So, don't be lazy, clean your machine!