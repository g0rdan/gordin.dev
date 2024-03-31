---
layout: post
title: MvvmCross. Введение
---

Здравствуйте. Это первый пост в этом блоге, но я надеюсь не последний :)

Хочу сделать небольшой (или большой) туториал по замечательному фреймворку MvvmCross. Причина - я не видел в рунете хорошего описания того, как с ним (фреймворком) работать. Мне кажется он незаслужено обделен вниманием.
Заранее скажу, что все примеры будут основываться на Xamarin (iOS и Android) с использованием Xamarin Studio.

MvvmCross - фреймворк, который базируется на архитектурном паттерне MVVM (Model-View-ViewModel).

![_config.yml]({{ site.baseurl }}/images/mvvm-light.png)

Если кто не в курсе, тому стоит погуглить и почитать. Сейчас же рассмотрим этот паттерн в разрезе MvvmCross архитектуры.

К слову, рекомендую установить [этот](http://addins.monodevelop.com/Project/Index/227) плагин для Visual Studio или Xamarin Studio. Он сэкономит много времени при создании MvvmCross проекта с нуля.

После установки мы можем увидеть что проект состоит из трех (справедливо для XS) составляющих:
* .Core
* .Droid
* .iOS


Core - это PCL проект, который будет содержать наши Models и ViewModels. Droid и iOS это нативные проекты для соответствующих платформ, содержащие Views и вообще всю платформозависимую составляющую.

Как было сказано, .Соre содержит всю бизнес логику приложения и работу с данными и .Core начинается с App.cs

```csharp
public class App : MvvmCross.Core.ViewModels.MvxApplication
{
	public override void Initialize()
	{
		CreatableTypes()
			.EndingWith("Service")
			.AsInterfaces()
			.RegisterAsLazySingleton();

		RegisterAppStart<ViewModels.FirstViewModel>();
	}
}
``` 

App это наш экземпляр приложения, который в методе Initialize() позволяет определенным образом инициализировать "Сервисы" (про них мы поговорим позже) и указывает, какая ViewModel будет первой при старте приложения. В нашем случае это FirstViewModel.

Каждая ViewModel должна наследоваться от MvxViewModel. Как видно из картинки выше (хоть она и не совсем правильная), View общается с ViewModel посредством Bindings и Commands.

#### Binding ####

Bindings позволяет связывать отображаемые данные в ViewModel c View так, чтобы при изменении этих данных во ViewModel, они изменялись во View (и наоборот). Давайте посмотрим пример:

```csharp
public class FirstViewModel : MvxViewModel
{
  private string _hello = "Hello MvvmCross";
  public string Hello
  {
  	get { return _hello; }
	set { SetProperty(ref _hello, value); }
  }

  private ICommand _submitCommand;
  public ICommand SubmitCommand
  {
    get
	{
	  _submitCommand = _submitCommand ?? new MvxCommand(DoSubmit);
	  return _submitCommand;
	}
  }
}
``` 

При изменении поля Hello вызывается метод SetProperty() который и позволяет нам делать магию. Как именно связывать данные во ViewModel c View мы поговорим чуть позже. В MvvmCross связывать View и ViewModel можно 4 способами:
* One-Way
* One-Way-To-Source
* Two-Way
* One-Time


Для подробного изучения вопроса я рекомендую взглянуть на эту [страницу](https://github.com/MvvmCross/MvvmCross/wiki/databinding)

#### Command ####

Command методы служат для взаимодействия пользователя с приложением. Самый простой пример - тап по кнопке. В нашем теоретическом приложении мы можем связать нажатие на какую-либо кнопку с полем SubmitCommand и при вызове (нажатии) этого поля выполнится Action в MvxCommand. В нашем случае выполнится несуществующий метод DoSubmit().

Пожалуй все. Первый пост не особо информативен, как я вижу. Но я исправлюсь :) Дальше мы узнаем каким образом мы можем связать данные в ViewModel с каждой из платформ.

