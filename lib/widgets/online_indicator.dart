import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simonaapp/bloc/web_socket_online_indicator/online_indicator_bloc.dart';
import 'package:simonaapp/bloc/web_socket_online_indicator/online_indicator_state.dart';
import 'package:simonaapp/screens/sign_in_page.dart';
import 'package:sized_context/sized_context.dart';

class OnlineIndicator extends StatelessWidget {
  const OnlineIndicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnlineIndicatorBloc, OnlineIndicatorState>(
      listener: (context,state){
        if(state is ConnectionOffline) {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
              builder: (context) {
                return SignInPage();
              }
          ), ModalRoute.withName('/signin'));
        }
      },
      child: BlocBuilder<OnlineIndicatorBloc, OnlineIndicatorState>(
        builder: (context, state) {
          return Container(
            color: state is ConnectionOnline ? Colors.green : Colors.red,
            height: 18,
            width: context.widthPct(1),
          );
        },
      ),
    );
  }
}