import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningbloc/blocs/Internet_bloc.dart';
import 'package:learningbloc/blocs/Internet_event.dart';
import 'package:learningbloc/blocs/Internet_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocBuilder<InternetBloc, InternetState>(builder: (BuildContext context, state) {
            if(state is InternetLostEvent){
              return Text('Internet is lost!');
            }
            else if(state is InternetGainedEvent){
              return Text('Internet is connected!');
            }
            else{
              return Text('Loading...');
            }
          },
          ),
        ),
      ),
    );
  }
}
