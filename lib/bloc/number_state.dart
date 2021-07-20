import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class NumberState extends Equatable {
  @override
  List<Object> get props => [];
}

class EmptyNumberState extends NumberState{}

class LoadedNumberState extends NumberState{
  final int number;

  LoadedNumberState(this.number);

  LoadedNumberState copyWith(int number) {
    return LoadedNumberState(number);
  }

  @override
  List<Object> get props => [number];
}

