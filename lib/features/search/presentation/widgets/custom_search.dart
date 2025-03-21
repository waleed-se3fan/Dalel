import 'package:dalel/core/utils/colors.dart';
import 'package:dalel/features/auth/presentation/widgets/textfield.dart';
import 'package:dalel/features/home/presentation/view/view.dart';
import 'package:dalel/features/search/presentation/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            bottomNavBarKey.currentState?.changePage(0);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.brown,
          ),
        ),
        SizedBox(
          height: 55,
          width: MediaQuery.of(context).size.width * .79,
          child: CustomTextFeild(
            onChanged: (name) {
              context.read<SearchBloc>().add(GetSearchEvent(name
                  //.replaceFirst(name[0], name[0].toUpperCase())
                  ));
            },
            prefixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                )),
            textColor: Colors.white,
            fillColor: AppColors.appColor,
            hintText: 'Search deep into the history',
          ),
        )
      ],
    );
  }
}
