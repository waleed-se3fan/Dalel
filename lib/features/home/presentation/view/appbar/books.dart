import 'package:dalel/core/widgets/custom_drawer_appbar.dart';
import 'package:dalel/features/bazar/presentation/bloc/bazar_bloc.dart';
import 'package:dalel/features/bazar/presentation/view/bazar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksDrawer extends StatelessWidget {
  const BooksDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CutomWidget().drawerAppbar('Historical Books'),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * .9,
        child: BlocProvider(
          create: (context) => BazarBloc()..add(GetHistoricalBooksEvent()),
          child: BlocBuilder<BazarBloc, BazarState>(
            builder: (context, state) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 180,
                child: state is SuccessGetHistoricalBooks
                    ? BooksProductCard(
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
      ),
    );
  }
}
