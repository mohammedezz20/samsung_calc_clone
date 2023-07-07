import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samsung_calc_clone/Shared/Cubit/app_cubit.dart';
import 'package:samsung_calc_clone/Shared/Cubit/app_states.dart';

class DrawerWidget extends StatelessWidget {
   DrawerWidget();
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      height: 370,
                      child: ListView.builder(
                        controller: _scrollController,
                          itemCount: cubit.historyList.length,
                          itemBuilder: (context, index) {
                            return CupertinoButton(
                              onPressed: () {
                                cubit.on_history_click(cubit.historyList[index]);

                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(),
                                  Text(
                                    cubit.historyList[index].input,
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 22,
                                    letterSpacing: 1),

                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "= ${cubit.historyList[index].output}",
                                    style: TextStyle(
                                        color: Color(0xff1bbfb6), fontSize: 25),
                                  ),
                                ],
                              ),
                            );
                          })),
                  CupertinoButton(
                    onPressed: () {
                      cubit.delete_data();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.sizeOf(context).width * .5,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color(0xff1bbfb6),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Clear history",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Color(0xff494949),
              height: double.infinity,
              width: 2,
            )
          ],
        );
      },
    );
  }
}
