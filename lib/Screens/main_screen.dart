import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samsung_calc_clone/Shared/Cubit/app_states.dart';

import '../Shared/Cubit/app_cubit.dart';
import '../Shared/Widget/buttons_bar.dart';
import '../Shared/Widget/calc_input.dart';
import '../Shared/Widget/input_and_out_but.dart';
import 'converter_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xff010101),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                InputAndOutBut(),
                ButtonsBar(
                  clockFunction: () {
                    cubit.scaffoldKey.currentState?.openDrawer();
                    cubit.getData();
                  },
                  deleteFunction: () {
                    cubit.backSpace();
                  },
                  rulerFunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConverterScreen()));
                  },
                  thirdFunction: () {},
                ),
                Divider(
                  color: Color(0xff494949),
                  thickness: 2,
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(child: CalcInput()),
              ],
            ),
          ),
        );
      },
    );
  }
}
