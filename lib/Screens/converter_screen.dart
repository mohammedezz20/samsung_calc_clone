import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samsung_calc_clone/Shared/Cubit/app_states.dart';

import '../Shared/Cubit/app_cubit.dart';
import '../Shared/Widget/unit_converter_input_button.dart';

class ConverterScreen extends StatelessWidget {
  const ConverterScreen();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=AppCubit.get(context);
        return DefaultTabController(
          length: 7,
          child: Scaffold(
            backgroundColor: Color(0xff010101),
            appBar: AppBar(
              backgroundColor: Color(0xff010101),
              automaticallyImplyLeading: false,
              leading: CupertinoButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              title: Text(
                "Unit converter",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size(double.infinity, 50),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TabBar(
                      isScrollable: true,
                      unselectedLabelStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      labelStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 0,
                      indicator: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      tabs: [
                        Tab(
                          text: "Area",
                        ),
                        Tab(
                          text: "Lenth",
                        ),
                        Tab(
                          text: "Temperature",
                        ),
                        Tab(
                          text: "Volume",
                        ),
                        Tab(
                          text: "mass",
                        ),
                        Tab(
                          text: "Data",
                        ),
                        Tab(
                          text: "Speed",
                        ),
                      ]),
                ),
              ),
            ),
            body: Column(
              children: [
                Container(
                  height: MediaQuery
                      .sizeOf(context)
                      .height * .4,
                  child: TabBarView(children: cubit.screens
                  ),
                ),
                Expanded(child: UnitConverterInputButton()),
              ],
            ),
          ),
        );
      },
    );
  }
}
