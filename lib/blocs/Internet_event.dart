import 'package:flutter/material.dart';

abstract class InternetEvent{}
class InternetGainedEvent extends InternetEvent{}
class InternetLostEvent extends InternetEvent{}