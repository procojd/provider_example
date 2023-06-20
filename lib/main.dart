import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const baseClass(),
    );
  }
}

//base class
class baseClass extends StatelessWidget {
  const baseClass({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<mychangenotifier>(
      //initialising provider
      create: (_) => mychangenotifier(),

      child: Container(
        child: child1(),
      ),
    );
  }
}

// child class first
class child1 extends StatelessWidget {
  const child1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child2(),
    );
  }
}

//child class second
class child2 extends StatelessWidget {
  const child2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child3(),
    );
  }
}

//child class third
class child3 extends StatelessWidget {
  const child3({super.key});

  @override
  Widget build(BuildContext context) {
    late String tf;
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider_example"),
        leading:
            const IconButton(onPressed: null, icon: Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(Provider.of<mychangenotifier>(context)
                  .hello,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),), //accessing the members of custom provider class
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40)
          ),
          labelText: 'input',
          
        ),
                onChanged: (value) {
                tf = value;
              }),
            ),
              SizedBox(height: 10,),
            FilledButton(
                onPressed: () {
                  Provider.of<mychangenotifier>(context, listen: false)
                      .change(tf);
                },
                child: Text("Change")),
            FilledButton.tonal(
                onPressed: () {
                  Provider.of<mychangenotifier>(context, listen: false)
                      .change("hello");
                },
                child: Text("reset",))
          ],
        ),
      ),
    );
  }
}

class mychangenotifier extends ChangeNotifier {
  String hello = "hello";

  void change(String newval) {
    hello = newval;
    notifyListeners();
  }
}
