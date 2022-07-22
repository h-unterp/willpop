import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:willpop/providers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: TextButton(
              child: const Text("Press", style: TextStyle(fontSize: 40)),
              onPressed: () {
                Navigator.of(context)
                    .push(Widg2.getRoute(context, "from main"));
              }),
        ));
  }
}

class Widg2 extends ConsumerStatefulWidget {
  const Widg2({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  ConsumerState<Widg2> createState() => _Widg2State();
  static Route<void> getRoute(BuildContext context, String inString) {
    return MaterialPageRoute<void>(
      builder: (BuildContext context) => Widg2(title: inString),
    );
  }
}

class _Widg2State extends ConsumerState<Widg2> {
  @override
  Widget build(BuildContext context) {
    String pro1 = ref.watch(provider1);
    String pro2 = ref.watch(provider2);
    debugPrint("building:${widget.title}");
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: WillPopScope(
            child: TextButton(
                child: Center(
                    child: Text("$pro1 : $pro2",
                        style: const TextStyle(fontSize: 40))),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            onWillPop: () {
              return Future.value(true);
            }));
  }
}
