import 'package:flutter/material.dart';
import 'package:inherited_notifier_example/counter_change_notifier.dart';
import 'package:inherited_notifier_example/counter_inherited_notifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CounterInheritedNotifier(
      counterState: CounterState(),
      child: MaterialApp(
        title: 'Inherited Notifier Example',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const InheritedNotifierScreen(),
      ),
    );
  }
}

class InheritedNotifierScreen extends StatefulWidget {
  const InheritedNotifierScreen({Key? key}) : super(key: key);

  @override
  State<InheritedNotifierScreen> createState() => _InheritedNotifierScreenState();
}

class _InheritedNotifierScreenState extends State<InheritedNotifierScreen> {
  @override
  Widget build(BuildContext context) {
    final counterObject = CounterInheritedNotifier.of(context);
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inherited Notifier",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.white)),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${counterObject.counter}",style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.w500,fontSize: 25),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      counterObject.incrementCounter();
                    },
                    child: Container(
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.indigo,
                      ),
                      child: const Center(child: Text("Increment Counter",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),)),
                    ),
                  ),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      counterObject.decrementCounter();
                    },
                    child: Container(
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.indigo,
                      ),
                      child: const Center(child: Text("Decrement Counter",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),)),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

