import 'package:flutter/material.dart';

class CounterState extends ChangeNotifier
{
    int _counter=0;

    int get counter => _counter;

    void incrementCounter()
    {
        _counter++;
        notifyListeners();
    }

    void decrementCounter()
    {
        _counter--;
        notifyListeners();
    }
}