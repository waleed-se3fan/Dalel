import 'package:dalel/core/widgets/custom_drawer_appbar.dart';
import 'package:dalel/features/bazar/presentation/bloc/bazar_bloc.dart';
import 'package:dalel/features/bazar/presentation/view/bazar.dart';
import 'package:dalel/features/home/presentation/bloc/home_bloc.dart';
import 'package:dalel/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoricalCharDrawer extends StatelessWidget {
  const HistoricalCharDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CutomWidget().drawerAppbar('Historical Characters'),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * .9,
        child: BlocProvider(
          create: (context) =>
              HomeBloc()..add(GetHistoricalPeriods('Historical Characters')),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return state is SuccessGetHistoricalPeriods
                  ? HistoricalCharacters(
                      model: state.data,
                      scrollDirection: Axis.vertical,
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ),
      ),
    );
  }
}
