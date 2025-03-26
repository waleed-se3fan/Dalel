import 'package:dalel/core/widgets/custom_drawer_appbar.dart';
import 'package:dalel/features/bazar/presentation/bloc/bazar_bloc.dart';
import 'package:dalel/features/bazar/presentation/view/bazar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SouvenirsDrawer extends StatelessWidget {
  const SouvenirsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CutomWidget().drawerAppbar('Historical Souvenirs'),
      body: BlocProvider(
        create: (context) => BazarBloc()..add(GetHistoricalSouvinersEvent()),
        child: BlocBuilder<BazarBloc, BazarState>(
          builder: (context, state) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * .9,
              width: MediaQuery.of(context).size.width,
              child: state is SuccessGetHistoricalSouviners
                  ? SouvinersProductCard(
                      data: state.data,
                      scrollDirection: Axis.vertical,
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            );
          },
        ),
      ),
    );
  }
}
