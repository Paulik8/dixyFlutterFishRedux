import 'package:dixy_test/app_list/models/appModel.dart';
import 'package:dixy_test/detail/state.dart';
import 'package:dixy_test/widgets/textCreator.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:dixy_test/app_list/view.dart';

Widget buildView(DetailState state, Dispatch dispatch, ViewService viewService) {
  
  final employees = state.employee;

  Widget buildContent() =>
    ListView.builder(
      itemCount: employees.length,
      itemBuilder: (context, index) => EmployeeCell(item: employees[index],),
    );

  return Scaffold(
    body: buildContent(),
  );

}

class EmployeeCell extends StatelessWidget {

  final Employee item;

  const EmployeeCell({
    this.item,
  });

  Widget _buildItem(Widget child, {Alignment alignment = Alignment.center}) =>
    Container(
      margin: EdgeInsets.only(bottom: 4, right: 4),
      child: child,
      alignment: alignment,
    );

  Widget _buildRightInfo() =>
    _buildItem(buildText('${item.position}'), alignment: Alignment.centerRight);

  Widget _buildLeftInfo() =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildItem(buildText('${item.firstname} "${item.username}" ${item.lastname}')),
        _buildItem(buildText('${item.gender}', color: Colors.grey[700])),
        _buildItem(buildText('${item.birthday}', color: Colors.grey[500])),
      ],
    );

  Widget _buildCell(BuildContext context) =>
    Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: Colors.grey[700])
      ),
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLeftInfo(),
          _buildRightInfo(),
        ],
      ),
    );

  @override
  Widget build(BuildContext context) {
    return _buildCell(context);
  }

}