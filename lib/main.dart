import 'package:flutter/material.dart';

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
      title: 'Multi Counter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Adding Counters'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int nCounter = 2;

  void _incrementCounter() {
    setState(() {
      nCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // int nCounter = 5;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Number of counters:',
              ),
              Text(
                '$nCounter',
                style: Theme.of(context).textTheme.headline4,
              ),
              Expanded(
                child: ListView(
                  children: List.generate(
                      nCounter,
                      (int i) => ListTileItem(
                            title: "Counter #${i+1}", 
                          )),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Add counter',
        child: const Icon(
          Icons.add,
          color: Colors.white,
          ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ListTileItem extends StatefulWidget {
  final String title;
  const ListTileItem({super.key, required this.title});
  @override
  // ignore: library_private_types_in_public_api
  _ListTileItemState createState() => _ListTileItemState();
}

class _ListTileItemState extends State<ListTileItem> {
  int _itemCount = 0;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.title),
      trailing: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).colorScheme.secondary),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () => setState(() => _itemCount--),
              child: _itemCount > 0
                  ? const Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 16,
                    )
                  : const Icon(
                      // draw icon in same colour as background to hide it
                      Icons.remove,
                      color: Colors.blue,
                      size: 16,
                    ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3), color: Colors.white),
              child: Text(
                _itemCount.toString(),
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            InkWell(
                onTap: () => setState(() => _itemCount++),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 16,
                )),
          ],
        ),
      ),
    );
  }
}
