import 'package:flutter/material.dart';

class LayoutView extends StatefulWidget {
  static const _widgetHeight = 80.0;

  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

enum CurrentTextGroup { first, second, third }

class _LayoutViewState extends State<LayoutView> {
  late int _counter;
  late String _firstTextGroupValue;
  late String _secondTextGroupValue;
  late String _thirdTextGroupValue;

  late CurrentTextGroup _currentTextGroup;

  @override
  void initState() {
    super.initState();
    _counter = 1;
    _currentTextGroup = CurrentTextGroup.first;
    _firstTextGroupValue = _counter.toString();
    _secondTextGroupValue = '';
    _thirdTextGroupValue = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: LayoutView._widgetHeight,
              child: Row(
                children: [
                  Expanded(
                    child:
                        Text(_firstTextGroupValue, textAlign: TextAlign.center),
                  ),
                  Expanded(
                    child: Text(_secondTextGroupValue,
                        textAlign: TextAlign.center),
                  ),
                  Expanded(
                    child:
                        Text(_thirdTextGroupValue, textAlign: TextAlign.center),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: LayoutView._widgetHeight,
              child: Column(
                children: [
                  Expanded(
                    child:
                        Text(_firstTextGroupValue, textAlign: TextAlign.center),
                  ),
                  Expanded(
                    child: Text(_secondTextGroupValue,
                        textAlign: TextAlign.center),
                  ),
                  Expanded(
                    child:
                        Text(_thirdTextGroupValue, textAlign: TextAlign.center),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(_firstTextGroupValue, textAlign: TextAlign.center),
                      Text(_secondTextGroupValue, textAlign: TextAlign.center),
                    ],
                  ),
                  Text(_thirdTextGroupValue, textAlign: TextAlign.center),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _roll,
                child: const Text('Roll'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _roll() {
    _counter++;
    final nextCounterValue = _counter.toString();
    setState(() {
      switch (_currentTextGroup) {
        case CurrentTextGroup.first:
          _firstTextGroupValue = '';
          _secondTextGroupValue = nextCounterValue;
          _currentTextGroup = CurrentTextGroup.second;
          break;
        case CurrentTextGroup.second:
          _secondTextGroupValue = '';
          _thirdTextGroupValue = nextCounterValue;
          _currentTextGroup = CurrentTextGroup.third;
          break;
        case CurrentTextGroup.third:
          _thirdTextGroupValue = '';
          _firstTextGroupValue = nextCounterValue;
          _currentTextGroup = CurrentTextGroup.first;
          break;
      }
    });
  }
}
