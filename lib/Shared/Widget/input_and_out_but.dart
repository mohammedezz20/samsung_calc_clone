import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samsung_calc_clone/Shared/Cubit/app_cubit.dart';
import 'package:samsung_calc_clone/Shared/Cubit/app_states.dart';

class InputAndOutBut extends StatelessWidget {
  const InputAndOutBut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Container(
          height: MediaQuery.sizeOf(context).height * .3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Visibility(
                    visible: cubit.outputHistory!=''?true:false,
                    child: Expanded(
                      child: Text(
                        textAlign: TextAlign.right,
                        cubit.outputHistory,
                        style: TextStyle(fontSize: 50, color: Color(0xffDFA1A6)),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: cubit.outputHistory==''?true:false,
                    child: Expanded(
                      child: Text(
                        textAlign: TextAlign.right,
                        cubit.input,
                        style: TextStyle(fontSize: 50, color: Colors.green[300]),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(flex: 2,),
              Text(
                cubit.output,
                style: TextStyle(fontSize: 30, color: Colors.green[400]),
              ),
              Spacer(),
            ],
          ),
        );
      },
    );
  }
}
