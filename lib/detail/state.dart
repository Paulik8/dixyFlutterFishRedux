import 'package:dixy_test/app_list/models/appModel.dart';
import 'package:fish_redux/fish_redux.dart';


class DetailState implements Cloneable<DetailState> {

  List<Employee> employee;

  static DetailState initState(Map<String, dynamic> args) {
    final state = DetailState();
    if (args != null && args.containsKey('employee')) {
      state.employee = args['employee'];
    }
    return state;
  }

  @override
  DetailState clone() => DetailState()
    ..employee = employee;

}