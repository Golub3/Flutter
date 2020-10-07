import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Golub Vitaliy',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'made by Golub Vitaliy TI-72'),
    );
  }
}

class MyClass{
  String _name;
  String code;
  int age;
  static Map<String, MyClass> _cache;

  factory MyClass(String name, String code, [age = 18]) { //неіменований необов'язковий параметр, по замовчуванню 18
    if (_cache == null) {
      _cache = {};
    }

    if (_cache.containsKey(code)) {
      return _cache[code];
    } else {
      final myClass = new MyClass._internal(name, code, age);
      _cache[code] = myClass;
      return myClass;
    }   
  }

  MyClass._internal(this._name, this.code, [this.age]);

  //getter
  String get name => _name;

  //setter
  set name(String value) {
    _name = value;
  }

  @override
  String toString() {
    return 'MyClass{_name: $_name, age: $age}';
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState(); //лямбда-функція
}


Function getcalc (v) => <int>(i) => v + i; //приклад замикання

mixin SomeStuff {
  bool flag = true;
}

class _MyHomePageState extends State<MyHomePage> with SomeStuff{
  List<MyClass> full;
  List<String> example;
  var add1 = getcalc(1);
  int buttonClicks = 0;


  _MyHomePageState()
      : this.full = [MyClass('Vitaliy', 'TI-123321', 21), MyClass('Petro','TI-66364'), MyClass('Dmytro', 'TI-133341', 16)];

    void someFunc() {
    
    buttonClicks = add1(buttonClicks);

    setState(() {
      example = flag == true
          ? first(full)
          : second(full);

      flag = !flag;
    });

  }

  List<String> first(List<MyClass> full) => full
      .where((e) => e.age < 20)
      .map((e) => buttonClicks.toString() + ') ' + e.name + ' age: ' + '${e.age}')
      .toList();

  List<String> second(List<MyClass> full) => full
      .where((e) => e.age >= 20)
      .map((e) => e.name + ' age: ' + '${e.age}')
      .toList();

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          color: Colors.grey,
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                (example??"CLICK BUTTON!").toString(), //??
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: someFunc,
        tooltip: 'show',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
