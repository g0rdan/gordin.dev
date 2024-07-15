+++
title = 'If You Are Curios Like Me'
date = 2024-07-14T15:08:11-04:00
draft = false
tags = ['vsextensions, vscode, flutter, dart, devtools']
+++

Every time when I clone a flutter/dart repo to see a specific functionality or to learn something new, I always open `pubspec.yaml` first just out of curiosity. Pretty often the main attention point of looking at `pubspec.yaml` is the `dependencies` section.

If you are like me, you probably have the same habit of copy a dependency name and paste it to browser's search input or straight to the [pub.dev](https://pub.dev/) website to see what the package is about, how it is used, and what it offers.

Last week I realized that I can save some time and have some really easy entry point for Vscode extension development. I decided to create a simple extension that will allow me to open [pub.dev](https://pub.dev/) for a package directly from the Vscode.

Here it is, [PubLink](https://marketplace.visualstudio.com/items?itemName=gordin.publink).

![PubLink](/if-you-are-curios-like-me/example.gif)

Some takeaways from this small project:

- I've never developed a Vscode extension before. It was a very smooth experience. I've used [yo code](https://code.visualstudio.com/api/get-started/your-first-extension) to scaffold the project and it was very helpful.

- Last time when I touched Typescript was about 5 years ago and, at best, I have a year of TS experience on hands. However, it is amazing how easy it was to get back to it with help of LLMs. I must admit, current level of dev support from tools like Copilot anf ChatGPT when you don't really know neither the language nor the platform is just mind-blowing.

- A bit off-topic, but it reminds me big brands are un umbrella for so many different products and quality of those products can vary a lot. For example, A long time ago I've mostly used "Visual Studio for Mac" for Xamarin development which, at the time, was just a renamed MonoDevelop IDE. The experience of working in this IDE was questionable at best. I do remember an attempt to create a simple extension for it and it was a nightmare. On the other hand, "Visual Studio Code" is just a pleasure to work with in terms of use of it and development for it. Similar branding, very different experience.

- Publishing an extension to the marketplace is a breeze. Smooth experience, no issues at all.

I'm planing to extend this extension with more features in the future. One of the ideas is to show a popup with a package information like description, version, and so on. It will be a good exercise to work with Vscode API and a http client in Typescript.
