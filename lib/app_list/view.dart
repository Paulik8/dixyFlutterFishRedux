import 'package:dixy_test/app_list/action.dart';
import 'package:dixy_test/app_list/state.dart';
import 'package:dixy_test/widgets/textCreator.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

Widget buildView(AppListState state, Dispatch dispatch, ViewService viewService) {

  final apps = state.items;
  final screenWidth = MediaQuery.of(viewService.context).size.width;

  Widget buildContent() =>
    apps.isEmpty ?
      Center(child: CircularProgressIndicator())
    :
    ListView.builder(
      itemCount: apps.length,
      itemBuilder: (context, index) {
        final item = apps[index];
          return GestureDetector(
            onTap: () => dispatch(AppListActionCreator.itemTapped(item.info.employees)),
            child: Container(
            margin: EdgeInsets.all(12),
            width: screenWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Colors.grey[700])
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildText(
                  item.app,
                  fontSize: 20,
                ),
                buildText(
                  item.city,
                  fontSize: 18,
                ),
                buildText(
                  item.email,
                  fontSize: 18,
                ),
              ],
            ),
          )
        ); 
      } 
    );

  Widget buildScreen() =>
    Scaffold(
      body: buildContent(),
    );

  return buildScreen();

}