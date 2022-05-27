import 'package:counter_provider_eg/app/controller/provider/app_provider.dart';
import 'package:counter_provider_eg/features/feature_a/screens/fa_page1.dart';
import 'package:counter_provider_eg/features/feature_a/screens/fa_page2.dart';
import 'package:counter_provider_eg/features/feature_a/screens/fa_page3.dart';
import 'package:counter_provider_eg/features/feature_b/screens/fb_page1.dart';
import 'package:counter_provider_eg/features/feature_b/screens/fb_page2.dart';
import 'package:counter_provider_eg/features/feature_b/screens/fb_page3.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/feature_a/controller/provider/feature_a_provider.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          Provider(create: (_) => AppProvider()),
          //Provider(create: (_) => FeatureAProvider()),
          //Provider(create: (_) => FeatureBProvider()),
        ],
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        primarySwatch: Colors.blue,
      ),
      initialRoute: Home.routeName,
      routes: pageRoutes,
      navigatorObservers: [AppRouteObserver(context)],
    );
  }
}

class AppRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  final BuildContext _materialAppBuildContext;
  late final AppProvider _appProvider;

  AppRouteObserver(this._materialAppBuildContext) {
    _appProvider = Provider.of<AppProvider>(_materialAppBuildContext);
  }

  void _checkIfFeatureRootScreenAndInitFeatureProvider(PageRoute<dynamic> route) {
    String screenName = route?.settings?.name as String;
    switch (screenName) {
      case FaPage1.routeName : {
        _appProvider.featureProviderFactory.initFeatureAProvider();
      }
      break;

      case FbPage1.routeName : {
        _appProvider.featureProviderFactory.initFeatureBProvider();
      }
      break;

      default: {};
      break;
    }
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      _checkIfFeatureRootScreenAndInitFeatureProvider(route);
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      _checkIfFeatureRootScreenAndInitFeatureProvider(newRoute);
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute) {
      _checkIfFeatureRootScreenAndInitFeatureProvider(previousRoute);
    }
  }
}

class Home extends StatelessWidget {
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, FaPage1.routeName);
                },
                child: const Text("To Feature A")
            ),
            const Text(""),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, FbPage1.routeName);
                },
                child: const Text("To Feature B")
            ),
          ],
        ),
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// Final: Class Properties
final Map<String, Widget Function(BuildContext)> pageRoutes = {
  //// Main Routes
  Home.routeName: (_) => Home(),
  FaPage1.routeName: (_) => FaPage1(),
  FaPage2.routeName: (_) => FaPage2(),
  FaPage3.routeName: (_) => FaPage3(),
  FbPage1.routeName: (_) => FbPage1(),
  FbPage2.routeName: (_) => FbPage2(),
  FbPage3.routeName: (_) => FbPage3()
};

/*class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
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
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}*/
