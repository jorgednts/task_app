import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/global/global_bloc.dart';
import '../../bloc/global/global_state.dart';

class GlobalBuilder extends StatelessWidget {
  const GlobalBuilder({
    super.key,
    required this.builder,
  });

  final Widget Function(GlobalState) builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
      builder: (context, state) {
        return builder(state);
      },
    );
  }
}
