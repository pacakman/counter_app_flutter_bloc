import 'package:flutter/material.dart';
import 'package:flutter_app_flutter_bloc/bloc/number_bloc.dart';
import 'package:flutter_app_flutter_bloc/bloc/number_event.dart';
import 'package:flutter_app_flutter_bloc/bloc/number_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: BlocProvider(
        create: (_) => NumberBloc(),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NumberViewWidget(),
              SizedBox(
                height: 16,
              ),
              NumberButtonWidget()
            ],
          ),
        ),
      ),
    );
  }
}

class NumberViewWidget extends StatelessWidget {
  NumberViewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NumberBloc, NumberState>(
      builder: (_, state) {
        if (state is EmptyNumberState) {
          return Center(
            child: Text(
              '0',
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
          );
        }
        else if (state is LoadedNumberState) {
          return Center(
            child: Text(
              '${state.number}',
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
          );
        }
        return Container();
      },
    );
  }
}

class NumberButtonWidget extends StatelessWidget {
  NumberButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _bloc = BlocProvider.of<NumberBloc>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
            _bloc.add(Decrement());
          },
          child: Icon(
            Icons.remove,
            size: 40,
          ),
        ),
        InkWell(
          onTap: () {
            _bloc.add(Increment());
          },
          child: Icon(
            Icons.add,
            size: 40,
          ),
        ),
      ],
    );
  }
}
