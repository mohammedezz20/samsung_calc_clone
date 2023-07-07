import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samsung_calc_clone/Shared/Cubit/app_cubit.dart';
import 'package:samsung_calc_clone/Shared/Cubit/app_states.dart';

import 'option_button.dart';

class ButtonsBar extends StatelessWidget {
  ButtonsBar(
      {required this.clockFunction,
      required this.deleteFunction,
      required this.rulerFunction,
      required this.thirdFunction});
  var clockFunction;
  var rulerFunction;
  var thirdFunction;
  var deleteFunction;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {

        return Container(
          height: MediaQuery.sizeOf(context).height * .08,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                OptionButton(
                  function: clockFunction,
                  img: "assets/clock.png",
                ),
                OptionButton(
                  function: rulerFunction,
                  img: "assets/ruler.png",
                ),
                OptionButton(
                  function: thirdFunction,
                  img: "assets/third.png",
                ),
                Spacer(),
                OptionButton(
                  function: deleteFunction,
                  img: "assets/delete.png",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
