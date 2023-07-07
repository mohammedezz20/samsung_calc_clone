import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:units_converter/models/extension_converter.dart';
import 'package:units_converter/properties/area.dart';
import 'package:units_converter/properties/length.dart';

import '../../Models/HistoryModel.dart';
import '../Network/local/databaseHelper.dart';
import '../Widget/convirt_widget.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  var databaseHelper = DatabaseHelper();
  String input = '';
  String output = '';
  String outputHistory = '';
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void addtoinput(String char) {
    input += char;
    if (char != '%' &&
        char != '/' &&
        char != '*' &&
        char != '-' &&
        char != '+' &&
        char != '.') {
      calculateExpression(input);
    }
    emit(AddCharToInputState());
  }

  void clear() {
    input = '';
    output = '';
    outputHistory = '';
    emit(AppClearInputOutputState());
  }

  void backSpace() {
    if (input != '') {
      input = input.substring(0, input.length - 1);
      if (input.length != 0)
        calculateExpression(input);
      else
        output = '';
      emit(BackSpaceState());
    }
  }

  void calculateExpression(String expression) {
    try {
      Parser parser = Parser();
      Expression exp = parser.parse(expression);

      ContextModel contextModel = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, contextModel);

      output = result.toString();
    } catch (e) {
      print('Error: Invalid expression');
    }
    emit(AppCalculateresultState());
  }

  void equalFunction() {
    outputHistory = output;
    output = '';
    input = '';
    emit(OutputHistoryState());
  }

  void OperationsFunction(var char) {
    if (input == '') {
      addtoinput(outputHistory);
      outputHistory = '';
    }
    emit(OperationsFunctionState());
  }

  dotFunction() {
    if (input == '') {
      double x = double.parse(outputHistory);
      print(x.toInt());
      outputHistory = x.toInt().toString();
      addtoinput(outputHistory);
      outputHistory = '';
    }
    emit(DotFunctionState());
  }

  void numfunction() {
    if (input == '') {
      addtoinput(outputHistory);
      outputHistory = '';
    }
    emit(NumFunctionState());
  }

  void addToDatabase() {
    if (input != '') {
      emit(HistoryAddToDatabaseLoading());
      try {
        CalculatorHistory calculatorHistory =
            CalculatorHistory(input: input, output: output);
        databaseHelper.addToDatabase(calculatorHistory);
        emit(HistoryAddToDatabaseSuccess());
      } catch (error) {
        emit(HistoryAddToDatabaseFaild(error.toString()));
      }
    }
  }

  List<CalculatorHistory> historyList = [];

  Future<void> getData() async {
    historyList = [];
    emit(HistoryGetFromDatabaseLoading());
    try {
      historyList = await databaseHelper.getHistory();
      emit(HistoryGetFromDatabaseSuccess());
    } catch (error) {
      emit(HistoryGetFromDatabaseFaild(error.toString()));
    }
  }

  void delete_data() {
    emit(DeleteFromDatabaseLoading());
    try {
      databaseHelper.deleteAllHistory();
      emit(DeleteFromDatabaseSuccess());
      getData();
    } catch (error) {
      emit(DeleteFromDatabaseFaild(error.toString()));
    }
  }

  on_history_click(CalculatorHistory calculatorHistory) {
    input = calculatorHistory.input;
    output = calculatorHistory.output;
    outputHistory = '';
    emit(OnHistoryClickState());
  }

  List<String> area = [
    "Acres (ac)",
    "Hectares (ha)",
    "Square centimeters (cm²)",
    "Square feet (ft²)",
    "Square inches (in²)",
    "Square meters (m²)",
  ];

  List<String> lenth = [
    "Millimeters (mm)",
    "Centimeters (cm)",
    "Meters (m)",
    "Kilometers (km)",
    "Inches (in)",
    "Feet (ft)",
    "Yards (yd)",
    "Miles (mi)",
  ];

  List<Widget> screens = [
    ConvirtWidget(1),
    ConvirtWidget(2),
    ConvirtWidget(2),
    ConvirtWidget(2),
    ConvirtWidget(2),
    ConvirtWidget(2),
    ConvirtWidget(2),


  ];

  var valueFrom;
  var valueTo;

  valuefromvalueChanged(val) {
    valueFrom = val;
    emit(valuefromvalueChangedState());
  }

  var convertfrom = '0';
  var convertto = '0';

  valueTovalueChanged(val) {
    valueTo = val;
    emit(valueTovalueChangedState());
  }

  void convertaddtoinput(String char) {
    if (convertfrom == '0') convertfrom = '';
    convertfrom += char;
    areaconvert();
    emit(ConvertAddCharToInputState());
  }

  void convertbackSpace() {
    if (convertfrom != '') {
      convertfrom = convertfrom.substring(0, convertfrom.length - 1);
      if (convertfrom.length != 0)
        areaconvert();
      else {
        convertfrom = '0';
        convertto='0';
      }
      emit(ConvertbackSpace());
    }
  }

  void convert_clear() {
    convertfrom = '0';
    convertto = '0';
    emit(ConvertClearInputOutputState());
  }

  void areaconvert() {

    if ((valueFrom != null) && (valueTo != null)) {
      var from;
      var to;
      switch(valueFrom)
      {
        case  "Acres (ac)":
          from=AREA.acres;
          break;
        case "Hectares (ha)":
          from=AREA.hectares;
          break;
          case "Square centimeters (cm²)":
          from=AREA.squareCentimeters;
          break;
          case "Square feet (ft²)":
          from=AREA.squareFeet;
          break;
          case "Square inches (in²)":
          from=AREA.squareInches;
          break;
          case "Square meters (m²)":
          from=AREA.squareMeters;
          break;
      }
     print(convertfrom);
      print(double.parse(convertfrom));
      print('vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv');
      var result = Area()..convert(from,double.parse(convertfrom) );

      switch(valueTo)
      {
        case  "Acres (ac)":
          to=result.acres;
          print(to.value);
          break;
        case "Hectares (ha)":
          to=result.hectares;
          print(to.value);

          break;
          case "Square centimeters (cm²)":
          to=result.squareCentimeters;
          print(to.value);

          break;
          case "Square feet (ft²)":
          to=result.squareFeet;
          print(to.value);

          break;
          case "Square inches (in²)":
          to=result.squareInches;
          print(to.value);

          break;
          case "Square meters (m²)":
          to=result.squareMeters;
          print(to.value);

          break;
      }
      convertto =to.value.toString();
      print(convertto);
      emit(valueConvert());

    }
  }
}
