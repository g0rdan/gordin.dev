---
layout: post
title: Best 5 tips and tricks in Visual Studio for Mac
description: "You will definitely like this tips. These tips will save your time and nerves"
date: 2017-08-25
tags: [xamarin, vs4mac]
comments: true
share: true
published: true
---

Probably you have seen my previuos [post](http://g0rdan.com/2017-08-18/My-favorite-vs4mac-plugins/) about plugins for vs4mac. If you didn't see follow by link, you'll like it.

I mentonied on post about **Macaque Tips** plugin. I really like it and I want to tell about the plugin more.

Here we'll consider useful tips from the plugin.

### Global Navigation

It's most powerful feature, I guess. Let's take a look. 

As I wrote in the plugin post, if you'll press `Command + .` (⌘.) the focus of IDE jumps to the search input. The Navigate To... (⌘.) command allows you to quickly search and navigate your solution and workspace.

    - jump to any file, type or member in your solution
    - execute commands, including hidden commands
    - search for NuGet packages
    - start a solution-wide full-text search

![command plus dot hot key](http://g0rdan.com/assets/images/command.plus.dot.gif)

Also it has another great function. As we already know, you can write name of file or class and jump directly to the file or class. But very few people know that if you'll write, for example, `MainActivity:25` into search field, you'll jump straight in 25 line on MainActivity file. Also, you can use a second suffix to specify the column, e.g. `Ma:25:10` to jump to line 25, column 10 in the file MainActivity.cs! Isn't great!?

When using the *Navigate To... (⌘.)* command, you can search for a specific kind of result by starting your search with a filter prefix:

|Kind|Prefix|Short Prefix|
|---|---|---|
|Files|file:|f:
|Types|type:|t:
|Members|member:|m:
|Commands|command:|c:

The *Type... (⇧⌘T)* and *File... (⇧⌘D)* commands offer a quick way to start a search with the type or file filter prefixes.

### Task pad

Visual Studio for Mac has greate feature to help you mark some pice of code which helps you don't forget this place. It can be some code for rewriting, some bug in code, etc. For example, If you found some bug and you don't have enough time to fix this, you can write `FIXME` right into your code in comment sections as on picture below. After that you can find all of your warnings in *Tasks* area. Also you can add `TODO`, `HACK` and `UNDONE`. To setup this environment you have to go to `Preferences -> Environment -> Tasks`.

![tasks keys](http://g0rdan.com/assets/images/tasks.vs4mac.png)

### Show Code Generation

The Show Code Generation `Command + I` (⌘I) command can automatically generate common code patterns. For example, it can generate a constructor to assign arguments to properties:

![Show Code Generation](http://g0rdan.com/assets/images/command.plus.o.gif)

After opening the code generation window, select a generator from the upper list with the arrow keys, then hit ⇥ to move to the lower list. Use ␣ to select which items to include, then ⏎ to generate the code.

### Clipboard history

Every programmer uses clipboard when he develops. This is the way to make our code more smells. Of course, it's not good way but still. Sometimes you would like to put some previous pice of code, which was in clipboard before the last one. The IDE provides an opportunity to do that. All your clipboad history saves in `Tools -> Clipboard ring`. Check it out!

### Key bindings

We as programmers are lazy persons. We develop tools and libraries to make our work life more comfortable. Also we appreciate out time. Also we spend a lot of time by typing some code in our favorites IDE. Nowadays, popular IDE's are huge! For example, you have to work with Visual Studio at leats one year to know it pretty well! And life is more easier when you know IDE hot keys! You could do your work much faster if you know how to use IDE without a mouse. The IDE can help you with that!

Many commands can be activated from key bindings, which are shown beside the commands in the menus. Some commands are not shown in the menus, and you can find these in the Key Bindings Preferences panel, where you can also change or add key bindings of your own.

![Key Bindings](http://g0rdan.com/assets/images/key.bindings.gif)