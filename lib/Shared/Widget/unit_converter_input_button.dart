import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samsung_calc_clone/Shared/Cubit/app_cubit.dart';
import 'package:samsung_calc_clone/Shared/Cubit/app_cubit.dart';
import 'package:samsung_calc_clone/Shared/Cubit/app_states.dart';

import '../../Models/input_button_model.dart';
import 'input_button.dart';

class UnitConverterInputButton extends StatelessWidget {
  const UnitConverterInputButton() ;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=AppCubit.get(context);
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InputButton(
                  inputButtonModel: InputButtonModel(
                    text: '7',
                    function: () {
cubit.convertaddtoinput('7');

                    },
                  ),
                ),
                InputButton(
                  inputButtonModel: InputButtonModel(
                    text: '8',
                    function: () {


                      cubit.convertaddtoinput('8');
                    },
                  ),
                ),
                InputButton(
                  inputButtonModel: InputButtonModel(
                    text: '9',
                    function: () {


                      cubit.convertaddtoinput('9');
                    },
                  ),
                ),
                InputButton(
                  inputButtonModel: InputButtonModel(
                    text: '\u232B',
                    fontSize: 30.0,
                    function: () {
                      cubit.convertbackSpace();
                    },
                    color: Color(0xffDFA1A6),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InputButton(
                  inputButtonModel: InputButtonModel(
                    text: '4',
                    function: () {

                      cubit.convertaddtoinput('4');
                    },
                  ),
                ),
                InputButton(
                  inputButtonModel: InputButtonModel(
                    text: '5',
                    function: () {

                      cubit.convertaddtoinput('5');
                    },
                  ),
                ),
                InputButton(
                  inputButtonModel: InputButtonModel(
                    text: '6',
                    function: () {


                      cubit.convertaddtoinput('6');
                    },
                  ),
                ),
                InputButton(
                  inputButtonModel: InputButtonModel(
                      text: 'C',
                      function: () {
                     cubit.convert_clear();
                      },
                      color: Color(0xffb61d1d)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InputButton(
                  inputButtonModel: InputButtonModel(
                    text: '1',
                    function: () {

                      cubit.convertaddtoinput('1');
                    },
                  ),
                ),
                InputButton(
                  inputButtonModel: InputButtonModel(
                    text: '2',
                    function: () {

                      cubit.convertaddtoinput('2');
                    },
                  ),
                ),
                InputButton(
                  inputButtonModel: InputButtonModel(
                    text: '3',
                    function: () {


                      cubit.convertaddtoinput('3');
                    },
                  ),
                ),
                InputButton(
                  inputButtonModel: InputButtonModel(
                      text: '\u2191',
                      function: () {

                      },
                      color: Color(0xffDFA1A6),
                      fontSize: 60.0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InputButton(
                  inputButtonModel: InputButtonModel(
                    text: '+/-',
                    function: () {},
                  ),
                ),
                InputButton(
                  inputButtonModel: InputButtonModel(
                    text: '0',
                    function: () {
                      cubit.convertaddtoinput('0');
                    },
                  ),
                ),
                InputButton(
                  inputButtonModel: InputButtonModel(
                    text: '.',
                    function: () {
                      cubit.convertaddtoinput('.');
                    },
                  ),
                ),
                InputButton(
                  inputButtonModel: InputButtonModel(
                      text: '\u2193',

                      function: () {

                      },
                      color:Color(0xffDFA1A6),

                      fontSize: 50.0),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
