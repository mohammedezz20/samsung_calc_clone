import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samsung_calc_clone/Shared/Cubit/app_cubit.dart';
import 'package:samsung_calc_clone/Shared/Cubit/app_states.dart';

class ConvirtWidget extends StatelessWidget {
  ConvirtWidget(this.index);
  var index;
  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).valueFrom = null;
    AppCubit.get(context).valueTo = null;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: DropdownButton(
                  isExpanded: true,
                  hint: Text(
                    'Select Item',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff31D9C2),
                    ),
                  ),
                  items: (index == 1)
                      ? cubit.area
                          .map((String item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ))
                          .toList()
                      : cubit.lenth
                          .map((String item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ))
                          .toList(),
                  value: cubit.valueFrom,
                  padding: EdgeInsets.only(top: 20,bottom: 20),
                  onChanged: (value) {
                    print(value);
                    cubit.areaconvert();
                    cubit.valuefromvalueChanged(value);
                  },
                  dropdownColor: Color(0xff444343),
                  borderRadius: BorderRadius.circular(20),

                  style: TextStyle(
                      color: Color(0xff31D9C2),
                      fontSize: 50,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Text(cubit.convertfrom, style: TextStyle(
                fontSize: 25,
                color: Color(0xff31D9C2),
              ),),
              Center(
                child: DropdownButton(
                  isExpanded: true,
                  hint: Text(
                    'Select Item',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff31D9C2),
                    ),
                  ),
                  items: (index == 1)
                      ? cubit.area
                          .map((String item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ))
                          .toList()
                      : cubit.lenth
                          .map((String item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ))
                          .toList(),
                  value: cubit.valueTo,
                  onChanged: (value) {
                    cubit.areaconvert();
                    cubit.valueTovalueChanged(value);
                  },
                  dropdownColor: Color(0xff444343),
                  borderRadius: BorderRadius.circular(20),
                  padding: EdgeInsets.only(top: 20,bottom: 20),
                  style: TextStyle(
                      color: Color(0xff31D9C2),
                      fontSize: 50,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Text(cubit.convertto, style: TextStyle(
                fontSize: 25,
                color: Color(0xff31D9C2),
              ),),
            ],
          ),
        );
      },
    );
  }
}
