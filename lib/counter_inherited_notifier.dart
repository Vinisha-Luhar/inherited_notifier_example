import 'package:flutter/material.dart';
import 'package:inherited_notifier_example/counter_change_notifier.dart';

class CounterInheritedNotifier extends InheritedNotifier<CounterState>
{
  final CounterState counterState;

  const CounterInheritedNotifier({super.key, required this.counterState,required Widget child}) : super(child: child,notifier: counterState);

  static CounterState of(BuildContext context)
  {
    final provider = context.dependOnInheritedWidgetOfExactType<CounterInheritedNotifier>();
    if(provider == null)
      {
        return provider!.counterState;
      }
    return provider.counterState;
  }

}