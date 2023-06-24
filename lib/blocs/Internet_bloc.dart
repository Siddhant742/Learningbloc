import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningbloc/blocs/Internet_event.dart';
import 'package:learningbloc/blocs/Internet_state.dart';
import 'package:connectivity/connectivity.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState>{
  StreamSubscription? connectivitySubscription;
  Connectivity _connectivity = Connectivity();
  InternetBloc() : super(InternetInitialState()){
    on<InternetGainedEvent>((event, emit) => InternetGainedState());
    on<InternetLostEvent>((event, emit) => InternetLostState());

    _connectivity.onConnectivityChanged.listen((resultEvent) {
      if(resultEvent == ConnectivityResult.mobile || resultEvent == ConnectivityResult.wifi){
        add(InternetGainedEvent());
      }
      else{
        add(InternetLostEvent());
      }
    });

  }
  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }

}