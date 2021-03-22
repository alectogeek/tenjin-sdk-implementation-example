import 'package:advertising_id/advertising_id.dart';
import 'package:flutter/material.dart';
import 'package:tenjin_sdk/tenjin_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('Advertising ID:' + await AdvertisingId.id);
  await TenjinSDK.instance.init(apiKey: 'YOUR-API-KEY!');
  TenjinSDK.instance.optIn();
  TenjinSDK.instance.connect();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tenjin Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Tenjin Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    TenjinSDK.instance.eventWithName('tap_ru');
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Count of events sent to Tenjon:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Send event',
        child: Icon(Icons.add),
      ),
    );
  }
}
