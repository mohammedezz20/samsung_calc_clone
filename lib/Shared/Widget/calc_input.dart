import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:samsung_calc_clone/Shared/Cubit/app_cubit.dart';
import 'package:samsung_calc_clone/Models/input_button_model.dart';

import 'drawer_widget.dart';
import 'input_button.dart';

class CalcInput extends StatelessWidget {
  const CalcInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Scaffold(
      key: cubit.scaffoldKey,
      drawer: Drawer(
        width: MediaQuery.sizeOf(context).width*.68,
        backgroundColor: Color(0xff010101),
       child: DrawerWidget(),
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InputButton(
                  inputButtonModel: InputButtonModel(
                      text: 'C',
                      function: () {
                        cubit.clear();
                      },
                      color: Color(0xffb61d1d)),
                ),
                InputButton(
                  inputButtonModel: InputButtonModel(
                      text: '( )',
                      function: () {},
                      color: Color(0xffDFA1A6),
                      fontSize: 28.0),
                ),
                InputButton(
                  inputButtonModel: InputButtonModel(
                    text: '%',
                    function: () {
                      cubit.OperationsFunction("%");
                      cubit.addtoinput("%");
                    },
                    color: Color(0xffDFA1A6),
                  ),
                ),
                InputButton(
                  inputButtonModel: InputButtonModel(
                    text: '/',
                    function: () {
                      cubit.OperationsFunction("/");
                      cubit.addtoinput("/");
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
                    text: '7',
                    function: () {
                      cubit.numfunction();
                      cubit.addtoinput('7');
                    },
                  ),
                ),
                InputButton(
                  inputButtonModel: InputButtonModel(
                    text: '8',
                    function: () {
                      cubit.numfunction();

                      cubit.addtoinput('8');
                    },
                  ),
                ),
                InputButton(
                  inputButtonModel: InputButtonModel(
                    text: '9',
                    function: () {
                      cubit.numfunction();
                      cubit.addtoinput('9');
                    },
                  ),
                ),
                InputButton(
                  inputButtonModel: InputButtonModel(
                    text: '*',
                    function: () {
                      cubit.OperationsFunction('*');
                      cubit.addtoinput('*');
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
                      cubit.numfunction();
                      cubit.addtoinput('4');
                    },
                  ),
                ),
                InputButton(
                  inputButtonModel: InputButtonModel(
                    text: '5',
                    function: () {
                      cubit.numfunction();
                      cubit.addtoinput('5');
                    },
                  ),
                ),
                InputButton(
                  inputButtonModel: InputButtonModel(
                    text: '6',
                    function: () {
                      cubit.numfunction();
                      cubit.addtoinput('6');
                    },
                  ),
                ),
                InputButton(
                  inputButtonModel: InputButtonModel(
                      text: '-',
                      function: () {
                        cubit.OperationsFunction('-');
                        cubit.addtoinput('-');
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
                    text: '1',
                    function: () {
                      cubit.numfunction();
                      cubit.addtoinput('1');
                    },
                  ),
                ),
                InputButton(
                  inputButtonModel: InputButtonModel(
                    text: '2',
                    function: () {
                      cubit.numfunction();
                      cubit.addtoinput('2');
                    },
                  ),
                ),
                InputButton(
                  inputButtonModel: InputButtonModel(
                    text: '3',
                    function: () {
                      cubit.numfunction();
                      cubit.addtoinput('3');
                    },
                  ),
                ),
                InputButton(
                  inputButtonModel: InputButtonModel(
                      text: '+',
                      function: () {
                        cubit.OperationsFunction('+');
                        cubit.addtoinput('+');
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
                      cubit.numfunction();
                      cubit.addtoinput("0");
                    },
                  ),
                ),
                InputButton(
                  inputButtonModel: InputButtonModel(
                    text: '.',
                    function: () {
                      cubit.dotFunction();
                      cubit.addtoinput(".");
                    },
                  ),
                ),
                InputButton(
                  inputButtonModel: InputButtonModel(
                      text: '=',
                      function: () {
                        cubit.addToDatabase();
                        cubit.equalFunction();
                      },
                      color: Colors.black,
                      backgroundcolor: Color(0xffDFA1A6),
                      fontSize: 60.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
