// ignore_for_file: unused_field, prefer_final_fields

import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvent { toAmber, toLightBlue }

class ColorBloc {
  Color _color = Colors.amber;

  //eventcontroller
  StreamController<ColorEvent> _eventController =
      StreamController<ColorEvent>();
  //getterevent
  StreamSink<ColorEvent> get eventSink => _eventController.sink;

  //statecontroller
  StreamController<Color> _stateController = StreamController<Color>();
  //getterstate
  StreamSink<Color> get _stateSink => _stateController.sink;

  //output
  Stream<Color> get stateStream => _stateController.stream;

  void _mapEventToState(ColorEvent colorEvent) {
    if (colorEvent == ColorEvent.toAmber)
      _color = Colors.amber;
    else
      _color = Colors.lightBlue;

    _stateSink.add(_color);
  }

  ColorBloc() {
    _eventController.stream.listen(_mapEventToState);
    // _eventController.
  }

  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
