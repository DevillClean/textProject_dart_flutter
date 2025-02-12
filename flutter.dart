/*  Виджеты 
                                     

  Stateless - виджет НЕвозможно изменяться
  Stateful - возможность изменяться 
  Steteless - просто существует и не изменяеться 
  Stateful - просто существует и отслеживает каки-либо изменения
             что бы заново перерисоваться
  stateless - виджет статика
  stateful - виджет динамика
  stateless - чаще всего - просто строка, информация , иконка , приветствие
                           то что в нашем приложении меняться не будет
  stateful - виджет - может быть полем ввода, экраном отображение секундомера



 отличие между Stateless и Stateful
 Stateless это просто статичный виджет который никогда не будет изменяться
 текст или блок который не подлежит изменению 
 Stateful - это то что мы можем пересоздавать , какая-то переменная 


(пример)
 class MyHomePage extends StatefulWidget {
 const MyHomePage({super.key, required this.title});
 final String title;

 сам виджет создает внутри себя состояние - State
 то что внутри себя может менять , менять значение разных переменных


========================================================================== StateFull 

Stateless - это конствнтный виджет в котором состояние не изменяемое 
при конвертации в StateFull виджет мы можем вернуть константы в MaterialApp 

StateFull виджет - 

          class DomashniyEkran extends StatefulWidget {
            const DomashniyEkran({super.key});

            @override
            State<DomashniyEkran> createState() => _DomashniyEkranState();
          }

        Виджет DomashniyEkran создал свою изменяемость которая имеет больше параметров

            
  state - это изменяемость, состояние.
  мы можем переиспользовать state и затрачивать участок памяти  

  setState(() {}); - это то что позволяет сделать ребилд участка кода, соответственно когда происходит ребилд 
  а данные в переменной сохраняються то они могут выводиться на экран и у нас экран уже обновляеться

  StateFull виджет по сути это то что может по командам из нутри этого кода может обновлять данные любых переменных
  или функций , содержать их в памяти пока не начнеться новая сессия

  Statefull это виджет который принимает в себя состояние которое может меняться несколько раз
            рекомендуеться для изменяемых виджетов с изменяемым внутренним состоянием. 
            имееться введу мзменение внутреннего состояния экземпляра класса в зависимости от какого-то события(по нажатию, времени и пр.)

  У Statefull - нету метода сборки и вместо того мы создаем CreateState
                State<Statefull> createState(){
                  return _StrokaSchemTo();
                }

  class __StrokaSchemTo extends State<MyFirstApp>{

  }


 ============================================================== методы и Жизненый цикл Stateful
    Мы можем создать , что-то переопределить и это происходит еще до билда (до появления в терминале);


void.initState() - создание 
super.initState()

void.didChangeDependencies - позволяет обртатиться к теме и получить что-то из нее ,

void.didUpdateWidget - используеться при изменении конфигурации родительского виджета.
                 Если свойства родителя изменяються, нам нужно обновить текущий дочерний виджет, когда вызываеться эта функция.
                 Это в основном происходит в ситуациях, когда мы перезагружаем наше приложение во время отладки. 

void deactivate() -  deactivate вызываеться когда виджет временно удаляеться из дерева, он может присоедениться к дереву виджетов в будущем
                     Деактивированый виджет перемещаеться обратно в дерево виджетов с помощу метода activate().
void activate()      эти функции используются не так часто , например когда мы создаем список и перетягиваем через все элементы один элемент

                    
didUpdateWidget(covariante Roditel1 oldWidget) {
  super.didUpdateWidget(oldWidget);
}

void dispose() - изчезает из структуры наших виджетов 
super.dispose() 

иногда нам нужно будет удалять какие-то подписки , что-то делать при удалении виджета






1. Виджет рождаеться - на этом этапе мы ничего не делаем 
2. вызываеться у виджета CreateState  -  как правило мы тут тоже ничего не делаем
3. State получает context - нужно понимать что до этого момента с ним ничего не делать 

4. у State вызываеться initState - это то место где мы должны провести какую-то инициализацию ,
   какието подписки, какие-то запросы, которые должны вызваться ровно один раз когда State был живой
5. didChangeDependencies - позволяет нам обратиться к теме, получить что-то из нее 
6. потом вызываеться build
7. потом может вызваться deactivate 
8. потом вызываеться dispose - где мы должны завершить всю работу , 
  к примеру если открывали файл - закрываем его, связь с сервером - тоже закрываем, делали подписку, запускали таймер - тоже в dispose нужно его закрыть
  и виджет после этого считаеться умершим
Жизненый цикл виджета закончился и он умер


у нашего State есть еще 3 метода и вот что дальше происходит :

  didUpdateWidget                reassemble                      didChangeDependencies
         |                           |                                      |
1.Если виджет изменился    Если произошел hot reload          Выше по дереву обновился используемый
                                                              inheritWidget(включая блок)



что значит изменяеться виджет?




*/

/* Верстка
  
  mainAxisAlingment : mainAxisAlingment.(параметры разметки)
  crossAxisAlignment: CrossAxisAlignment.(параметры разметки по линии)

  padding: - это отступ внутри
  margin - это внешний отступ между элементами

   home: Scaffold(
        backgroundColor: Colors.blue, (изменение заднего фона)



============================== Stack - это тот виджет который может накладывать друг на друга элементы
  Stack(
     children: [
      Padding(padding: const EdgeInsets.all(3.0),
       child: Container(
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10),
           color: const Color.fromARGB(255, 65, 32, 32),
          ),
          padding: const EdgeInsets.symmetric(
           vertical: 12,
           horizontal: 18,
          ),
          child: Column(
           children: const [
             Text(
               '11',
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 color: Colors.white,
               ),
             ),
             Text(
               's',
               style: TextStyle(
                 color: Colors.white,
               ),
             ),
             SizedBox(height: 5),
             Icon(
               Icons.alarm,
               color: Colors.white,
               size: 14,
             ),
           ],
          ),
        ),
      ),
                       
============================== Positioned - дает возможность позиционировать элементы так как нам нужно
 
   Positioned(
     right: 0,
     top: 0,
     child: Container(
       width: 10,
       height: 10,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(20),
         color: Colors.red,
         border: Border.all(
           color: Colors.white,
         ),

================================ Wrap - он выстраивает всегда элементы слева на право и выставляет элементы на следующую строку
================================ SingleChildScrollView - body : SingleChildScrollView (скрол приложения)
*/


/* Кнопки

 children: [
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
    ),
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.search_rounded),
    ),
  ],

  children: [
    InkWell(
      onTap: () {},
      icon: const Icon(Icons.arrow_back_ios),
    )
  ]

  
*/

/* Контекст


 context.findAncessorStateFindOfType<_DirectorState>()?.vydatZarplatuKasiru(); - найти состоиние какого типа? указываем тип 
                                                         какой ближайший вверху ?  


  findAncessorStateFindOfType() - получает БЛИЖАЙШИЙ СТЕЙТ вверх по ирархии 
  findRootAncestorStateOfType() - получает ПОСЛЕДНИЙ СТЕЙТ вверх по иерархии 
  findAncestorWidgetOfExactType() - получает БЛИЖАЙШИЙ ВИДЖЕТ вверх по иерархии


!!! чем больше виджетов в иерархии тем медленее они будут работать 
*/


/* Провайдер

  listenableProvider - только без автоматического dispose
  StramProvider и FutureProvider 
  ProxyProvider

  ChangeNotifierProvider - это провайдер который пробрасывает данные и так же имеет возможность следить а изменениями

  что бы это сделать нужно так же прописать классу ChangeNotifier и внутри функции notifyListeners();
  то есть мы какбудтобы делаем подписку на этот метод ну и соответственно это отношение будет иметь к нашей переменной
_______________________________________________________________________________________________________________________
  Если мы хотим что-то задействовать но не получить всегда пишем  Provider.of<Temperature>(context, listen: false).plusTemp();
                                                                                                    ------------- обращаясь к мотоду

 Экземпляр сохраняеться на уровне провайдера и мы можем передавать результат на других страницах
 и так мы можем передавать любые функции , любые данные и проводить любые манипуляции с ними сделать
________________________________________________________________________________________________________________________
 Так же провайдер еще пишут   
 вместо - Provider.of<Temperature>(context)
 вот    - var temp = context.watch<Temperature>();
                             (читать и следить) 

Тоже самое происходить и с вызовом только место - listen: false 
Provider.of<Temperature>(context, listen: false) ну ты понял
должен быть context.read<Temperature>().plusTemp();

!!! посмотреть еще информацию про провайдеры
*/

/*  Networking http

есть 2 библиотеки
1 http - базовая реализация пример в файле network.dart
2 dio

- результатом ответа являються Response c int statusCode и String body
- можно создавать свой Сlient для кастомизации запросов 
- клиент создавать не обязательно 
 
 dio - кастомная , имеет интесерверы  обзерверы и прочее

*/

/* API

  API - если можно так выразится это интерфейс в работе с серверной стороной приложения
        делая запрос через сеть http - мы взаимодействуем с сервером
*/
