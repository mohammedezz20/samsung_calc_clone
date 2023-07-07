abstract class AppStates{}
class AppInitialState extends AppStates{}
class AddCharToInputState extends AppStates{}
class AppClearInputOutputState extends AppStates{}
class BackSpaceState extends AppStates{}
class AppCalculateresultState extends AppStates{}
class OutputHistoryState extends AppStates{}
class OperationsFunctionState extends AppStates{}
class DotFunctionState extends AppStates{}
class NumFunctionState extends AppStates{}
class HistoryAddToDatabaseLoading extends AppStates{}
class HistoryAddToDatabaseSuccess extends AppStates{}
class HistoryAddToDatabaseFaild extends AppStates{
  String error;
  HistoryAddToDatabaseFaild(this.error){
   print("error : $error");
  }
}
class HistoryGetFromDatabaseLoading extends AppStates{}
class HistoryGetFromDatabaseSuccess extends AppStates{}
class HistoryGetFromDatabaseFaild extends AppStates{
  String error;
  HistoryGetFromDatabaseFaild(this.error){
   print("error : $error");
  }
}
class DeleteFromDatabaseLoading extends AppStates{}
class DeleteFromDatabaseSuccess extends AppStates{}
class DeleteFromDatabaseFaild extends AppStates{
  String error;
  DeleteFromDatabaseFaild(this.error){
   print("error : $error");
  }
}
class OnHistoryClickState extends AppStates{}
class valuefromvalueChangedState extends AppStates{}
class valueTovalueChangedState extends AppStates{}
class ConvertAddCharToInputState extends AppStates{}
class ConvertbackSpace extends AppStates{}
class ConvertClearInputOutputState extends AppStates{}
class valueConvert extends AppStates{}