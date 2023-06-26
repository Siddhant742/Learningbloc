import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningbloc/blocs/Internet_bloc.dart';
import 'package:learningbloc/blocs/Internet_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetBloc, InternetState>(
            listener:(BuildContext context, state){
              if (state is InternetGainedState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Internet is connected'),
                      backgroundColor: Colors.green,));
              }
              if(state is InternetLostState){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Internet is disconnected'),
                backgroundColor: Colors.red,));
              }
            },
            builder: (BuildContext context, state) {
              if(state is InternetLostState){
                return Text('Internet is lost!');
              }
              else if(state is InternetGainedState){
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
