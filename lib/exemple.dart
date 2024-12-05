import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State {
  int _counter = 0;
  // Ajouter 1 au `_counter`
  void _incrementCounter() {
    setState(() {
      _counter+=10;
    });
  }
  // Supprimer 1 au `_counter`
  void _decrementCounter() {
    setState(() {
      _counter-=2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.pink[100],
        leading: const Icon(Icons.menu),
        title: const Text("Mon cours AppBar"),
        actions: [          
          IconButton(icon: const Icon(Icons.settings),onPressed:(){},),
          IconButton(icon: const Icon(Icons.tab_sharp),onPressed:(){},),
          IconButton(icon: const Icon(Icons.search),onPressed:(){},),
          ],),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: const TextStyle(fontSize: 44),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Text('Incrémenter'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: const Text('Décrementer'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}