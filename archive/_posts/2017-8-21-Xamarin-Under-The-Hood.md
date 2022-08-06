---
layout: post
title: Оптимизация использования памяти в Xamarin приложениях
description: "В статье приводятся ряд предложений для оптимизации работы с памятью. Если вы хотите знать больше о том, как работает Xamarin и что делать, если у вас течет память, то эта статья для вас."
date: 2017-08-21
tags: [xamarin, xamarin.android, xamarin.ios, android, ios, xamarin.forms]
comments: true
share: true
---

> Это перевод [статьи](https://www.chipsncookies.com/2017/optimize-memory-usage-in-xamarin-apps/) автора [Samuel Debruyn](https://twitter.com/samueldebruyn). Статья понравилась настолько, что появилось спонтанное желание ее перевести. Ранее она была опубликована на [habrahabr.ru](https://habrahabr.ru/post/330854/) от моего имени. Но раз я создаю свой блог, то я решил скопировать ее сюда.

Xamarin удивителен тем, что позволяет .NET разработчикам писать приложения для Android, iOS, macOS на… С#. Но эта удивительная возможность имеет свою цену и даже простейшее приложение может запросто потреблять неприлично много памяти. Давайте посмотрим как это происходит и что мы можем сделать с этим. Большинство моих примеров основываются на Xamarin.Android, но вы быстро заметите, что это также применимо и к Xamarin.iOS.

### Как работает сборщик мусора в Xamarin приложениях

На самом деле в Xamarin приложениях используется несколько типов объектов. Каждое Xamarin приложение имеет объекты, которые живут в двух отдельных мирах:
-  Управляемый, мир Mono с объектами, наследуемыми из ```System.Object```
- Неуправляемый, нативный мир с объектами, наследуемыми от ```NSObject``` (iOS) или ```Java.Lang.Object``` (Android)

Из этого также следует что существуют и работают 2 сборщика мусора:
-  Сборщик мусора от Mono, называемый SGEN
-  Сборщики мусора из нативных миров Android или iOS

<cut />Давайте сначала рассмотрим SGEN. На самом деле в [Xamarin University](https://university.xamarin.com/classes/track/csharp) есть несколько очень интересных лекций по данному топику, также официальная [документация](https://developer.xamarin.com/guides/android/advanced_topics/garbage_collection/) очень неплохо объясняет это.

Я не буду вдаваться в детали того, как SGEN работает. Оставим эту тему для следующего моего поста. Все что нам сейчас нужно знать это то, что мы можем попытаться вызвать полную сборку мусора командой ```GC.Collect()```, а также сборку мусора для объектов нулевого поколения (самых свежих) командой ```CG.Collect(0)```. Большинство остальных команд не реализованы в Mono на момент написания статьи. В качестве альтернативы можно использовать snapshot функцию в Xamarin Profiler для ускорения сборки мусора.

Завершение сборки мусора SGENом также запускает сборку мусора в другом, нативном мире.

### Peer объекты

А я упомянул о двух типов объектов в Xamarin? Да и нет. Все наши объекты живут в каждом из двух миров, но фактически мы используем третий тип объектов:
-  Управляемые объекты (мир Mono)
-  Неуправляемые объекты (нативный мир)
-  Peer объекты (мир Mono, объекты-мосты между управляемым и неуправляемым мирами)

Далее мы можем разделить peer объекты на две категории:
-  Framework peers: экземпляры классов которые являются частью Xamarin.Android или Xamarin.iOS SDKs
-  User peers: экземпляры классов которые вы сами создаете и которые наследуются от нативных объектов

Итак, как Xamarin разработчик вы в праве создавать управляемые объекты или user peers.

Несколько примеров:
-  Framework peers: *android.content.Context, UIViewController…*
-  User peers: *MyCustomActivity, MyCustomViewHolder, MyCustomViewController…*

Какая между ними разница? Давайте взглянем на это со стороны Android (аналогично для iOS).

Framework peer часто называют Managed Callable Wrapper (MCW). Это название говорит нам что:
-  Managed Callable: объект существует, и он вызывается из мира Mono
-  Wrapper: это обертка над нативным Android объектом в Mono объект

Если вы занимались созданием Android binding проектов в Xamarin/Visual Studio то знайте, что вы создавали MCW. Под капотом, Xamarin генерирует код который вызывает нативные методы из Android мира. Для достижения этого они используют JNI (Java Native Interface). Если вы хотите вызвать метод который существует в Android мире, но для которого еще не сделали обертку в Xamarin, вы можете использовать JNI для вызова этого метода.

User peer часто называют Android Callable Wrapper (ACW). В свою очередь это название говорит нам что:
-  Android callable: объект существует и он вызывается из Android мира
-  Wrapper: это ничто иное как обертка, способная вызывать нативные методы из мира Mono

Итак, фактически мы можем сказать, что каждый peer объект на самом деле состоит из двух объектов, живущих в памяти: настоящий (нативный или Mono) и объект-обертка.

Эта структура позволяет Xamarin работать на абсолютно разных платформах и это то, почему Xamarin настолько крут. Все это позволяет Xamarin разработчикам довольно просто писать приложения, но отсутствие понимания того, как это работает, часто служит источником проблем с памятью в Xamarin приложениях.

### Внимание! Классический пример с Bitmap

Наиболее распространённые «большие» объекты в Xamarin приложениях это bitmaps (картинки). Почти каждое приложение содержит в себе хотя бы несколько картинок для того, чтобы выглядеть более привлекательно. Но у этого есть своя цена, эти картинки чаще всего наиболее большие объекты в памяти вашего приложения.

Однако, если вы позволите андроиду загрузить bitmap и посмотрите сколько она весит в памяти любым удобным для вас способом, вы скорее всего заметите что размер будет ничтожным. Даже 5 Мб картинка будет занимать несколько байтов.

Как это возможно? Куда делись 5 Мб? Для мира Mono, эта картинка ничто иное как обертка для нативного объекта. Это нативный объект занимает 5 Мб в памяти.

Хорошо, допустим, но как это может быть источником каких-либо проблем и как это вообще относится к теме поста? Давайте взглянем на код Activity ниже:

```cs
[Activity(Label = "App1", MainLauncher = true, Icon = "@drawable/icon")]
public class MainActivity : Activity
{
    protected override void OnCreate(Bundle bundle)
    {
        base.OnCreate(bundle);
        SetContentView(Resource.Layout.Main);

        for (int i = 0; i < 100; i++)
        {
            var hugeBitmap = Android.Graphics.BitmapFactory.DecodeFile($"path/to/bitmaps/{i}.png");
            if(!ImageContainsUnicorn(hugeBitmap))
            {
                continue;
            }

            var imageView = FindViewById<ImageView>(Resource.Id.SomeImageView);
            imageView.SetImageBitmap(hugeBitmap);
        }
    }
}
```

Этот код загружает 100 bitmaps и проверяет содержит ли картинка единорога, если да, то показывает его в ImageView. Мы используем только один bitmap в конце, поэтому тут не должно быть никаких проблем с памятью, потому что как только выделенные bitmaps выйдут за пределы видимости они будут собраны сборщиком мусора, так?

Неверно. Приложение упадет через несколько миллисекунд из-за ```OutOfMemoryException```. Для того, чтобы разобраться почему так происходит, давайте посмотрим, как Xamarin работает в данной ситуации.

Переменная hugeBitmap это MCW, и размер этого объекта в Mono будет незначительным. Код выше как правило не должен запускать сборку мусора (в Mono мире).

С другой стороны, андроид сойдет с ума, и сборщик мусора будет работать в сумасшедшем темпе. Однако он не сможет найти объекты, подлежащие сборке. Сборщик мусора не может собрать bitmaps, потому как они по-прежнему будут ссылаться на объекты-обертки в управляемом (Mono) мире. До тех пор, пока управляемые объекты-обертки не будут собраны SGEN’ом, нативный сборщик мусора не сможет ничего сделать. Как результат, в нативном мире ваше приложение поймает ```OutOfMemoryException```.

### Что мы можем сделать?

Каждый peer объект реализует IDisposable интерфейс. Давайте быстро посмотрим, как это реализовано:
-  [NSObject в Foundation](https://github.com/xamarin/xamarin-macios/blob/master/src/Foundation/NSObject2.cs#L730)
-  [Object in Java.Lang](https://github.com/xamarin/xamarin-android/blob/master/src/Mono.Android/Java.Lang/Object.cs#L227)

*Замечу что реализация выше для Xamarin.Android больше не используется в последней версии потому как они перешли на использование Java.Interop. Хотя реализация этого сама по себе совсем другая, способ работы очень схож со старым способом.*

Как мы видим, вызов ```Dispose()``` разрывает мост между объектом-обёрткой и оборачиваемым (нативным) объектом. Это удаляет ссылки и после утилизации объекта-обертки, нативный объект может быть собран сборщиком мусора, конечно если этот объект не имеет каких-либо ссылок в нативном мире.

> Замечательно! Значит мне просто нужно всегда вызывать ```Dispose()``` у всех объектов?

Почти, но не совсем. На самом деле мы можем улучшить код выше, используя конструкцию using. Как мы знаем, using незамедлительно вызывает ```Dispose()``` после окончания using блока. В 99% случаев это совершено нормально утилизировать framework peers незамедлительно после вызова метода/свойства, которое вам нужно. Нативный объект продолжит жить до тех пор, пока нужен и вы не сломаете ничего кроме ссылки на этот объект.

Усовершенствованная версия кода выше будет выглядеть так:

```cs
protected override void OnCreate(Bundle bundle)
{
    base.OnCreate(bundle);
    SetContentView(Resource.Layout.Main);

    for (int i = 0; i < 1000; i++)
    {
        using(var hugeBitmap = Android.Graphics.BitmapFactory.DecodeFile($"path/to/bitmaps/{i}.png"))
        {
            if (!ImageContainsUnicorn(hugeBitmap))
            {
                continue;
            }

            using(var imageView = FindViewById<ImageView>(Resource.Id.SomeImageView))
            {
                imageView.SetImageBitmap(hugeBitmap);
            }
        }
    }
}
```

Однако, если вам нужно использовать ImageView в другом методе, например в ```OnResume()```, лучшее место для утилизации ImageView могло бы быть ```OnDestroy()``` или ```Dispose()``` самой активити. Вы можете поспорить и сказать что можно просто вызывать ```FindViewById()``` столько раз, сколько нужно, но это очень дорогая операция и этого следует избегать. Обычно я использую этот метод в самом конце жизненного цикла объекта или я переопределяю ```Dispose()``` метод. Это не то что вы обязаны делать, но это безусловно помогло бы снизить использование памяти в вашем приложении.

### Небольшая заметка о событиях

Вы, наверное, уже догадались, что все описанное выше применимо и к событиям. Никогда не забывайте отписываться от ваших событий в последнем методе жизненного цикла activity, view controller, и т.п. или SGEN никогда не соберет ваш объект. Если у вашего объекта есть ссылка на peer объекты, тогда эти peer объекты будут жить вечно.

### Почему стоит избегать вызова Dispose() у user peer объектов

Когда время придет, будьте уверены, Xamarin сам вызовет ```Dispose()``` для любого user peer объекта. Но для нас, разработчиков приложений, не так просто понять когда это время должно прийти. Вообще документация говорит нам, что никогда не стоит вызывать ```Dispose()``` в ручную для user peer объектов. Просто удостоверьтесь, что ничто не ссылается на объект и тогда фреймворк сделает работу за вас.

#### Конструктор с IntPtr и JNIHandleOwnership

Если вы вызвали ```Dispose()``` user peer объекта вручную, и Android OS нуждается в этом объекте, Mono вызовет конструктор представленный ниже:

```cs
public MyClass(IntPtr javaRef, JniHandleOwnership transfer) : base(javaRef, transfer) { }
```

Аналогичный конструктор есть в Xamarin.iOS только без JNIHandleOwnership. В этом случае Mono пытается пересоздать исчезнувший объект.

Если такой конструктор не реализован, ваше приложение моментально упадет с ```NotSupportedException```. Если Google решит изменить жизненный цикл какого-либо объекта и вы вызовите ```Dispose()``` до конца этого цикла, приложение также упадет.

### Как WeakReference могут вам помочь

Используйте WeakReference вместо обычных (сильных) ссылок, для того чтобы избегать размещения ссылки на нативные объекты. Это чуть-чуть затратно по производительности при поиске этих объектов, но при этом нативный сборщик мусора может в любой момент времени собрать эти объекты. Поэтому выбирайте тип ссылок внимательно! Bitmap’ы которые не могут мгновенно исчезнуть могут быть хорошими кандидатами для слабых ссылок, но для таких маленьких объектов как UILabel это не имеет большого значения.

### Что на счет Xamarin.Forms?

У каждого элемента из Xamarin.Forms есть свой рендер на мобильных платформах, либо пользовательский, либо поставляемый в составе NuGet пакета. Эти рендеры и есть user peers и рассматриваются как таковые. Вот [пример](https://github.com/xamarin/Xamarin.Forms/blob/master/Xamarin.Forms.Platform.Android/ViewRenderer.cs#L79) того как реализован ```Dispose()``` во встроенном Android рендере. Я бы рекомендовал придерживаться похожего шаблона при реализации своего рендера и всегда утилизировать нативные объекты внутри (см. код по ссылке).

### Позвольте Android и iOS помочь вам

У Android и iOS есть механизмы, которые могут оповестить вас о надвигающимся недостатке памяти. В iOS это [DidReceiveMemoryWarning() в UIViewController](https://developer.apple.com/reference/uikit/uiviewcontroller/1621409-didreceivememorywarning). В Android это более скрыто и менее задокументировано: [OnTrimMemory() в Application](https://developer.android.com/reference/android/app/Application.html#onTrimMemory(int)). Логично предположить, что нужно вызывать ```GC.Collect()``` внутри этих методов. Это очистит некоторые объекты, запустит несколько финализаторов и вызовет ```Dispose()```  у peer объектов которые не используются. Это позволит нативному сборщику мусора очистить неиспользуемые объекты и освободить больше места на нативной стороне.

### Заключение

Я думаю, что этот пост дает некоторые полезные рекомендации по увеличению эффективности использования памяти в ваших Xamarin приложениях, но обратите внимание, есть еще много всего, о чем следует рассказать. Об этом я расскажу в следующих постах, а тем временем, вы можете почитать документацию, посмотреть исходники Xamarin на GitHub или поэкспериментировать с Xamarin или нативными профайлерами.