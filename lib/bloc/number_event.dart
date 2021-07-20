import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class NumberEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Increment extends NumberEvent {}
class Decrement extends NumberEvent {}