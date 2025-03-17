import 'package:dalel/features/auth/presentation/bloc/authbloc.dart';
import 'package:dalel/features/auth/presentation/bloc/authevent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Agreement extends StatelessWidget {
  const Agreement(
      {super.key, required this.text1, required this.text2, this.onTap});
  final String text1, text2;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Row(
        children: [
          Checkbox(
              value: AuthBloc.isCheck,
              onChanged: (value) {
                context.read<AuthBloc>().add(UpdateCheckBoxEvent(value!));
              }),
          GestureDetector(
            onTap: onTap,
            child: Align(
              child: Text.rich(TextSpan(children: [
                TextSpan(
                  text: text1,
                ),
                TextSpan(
                    text: text2,
                    style:
                        const TextStyle(decoration: TextDecoration.underline)),
              ])),
            ),
          ),
        ],
      ),
    );
  }
}
