// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lat_bloc_erico_1/bloc/color_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    // TODO: implement dispose
    bloc.dispose();
    super.dispose();
  }

  ColorBloc bloc = ColorBloc();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color(0xff34e89e),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  bloc.eventSink.add(ColorEvent.toAmber);
                },
                backgroundColor: Color(0xff34e89e),
                shape: StadiumBorder(
                  side: BorderSide(
                    color: Colors.black,
                    width: 5,
                  ),
                ),
              ),
              SizedBox(width: 10),
              FloatingActionButton(
                onPressed: () {
                  bloc.eventSink.add(ColorEvent.toLightBlue);
                },
                backgroundColor: Color(0xff0f3443),
              ),
            ],
          ),
          appBar: AppBar(
            title: const Text('Bloc Tanpa Library'),
            centerTitle: true,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff34e89e), Color(0xff0f3443)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
            ),
          ),
          body: Center(
            child: StreamBuilder(
              stream: bloc.stateStream,
              initialData: Colors.amber,
              builder: (context, snapshot) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: 100,
                  height: 100,
                  color: snapshot.data,
                );
              },
            ),

            // child: Container(
            //   height: 200,
            //   width: 200,
            //   decoration: BoxDecoration(
            //     color: Color(0xff0f3443),
            //     border: Border.all(color: Colors.black, width: 5),
            //   ),
            //   // color: Colors.black,
            // ),
          )),
    );
  }
}
