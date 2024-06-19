import 'package:app_check_poc/constants/dimension.dart';
import 'package:flutter/material.dart';
import 'package:master_utility/master_utility.dart';

AppBar appBarCustom({required String title, void Function()? onPressed, List<Widget>? actions}) => AppBar(
      actions: actions,
      leading: IconButton(
        onPressed: onPressed ?? NavigationHelper.navigatePop,
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      title: AutoText(
        text: title,
        style: TextStyle(color: Colors.black, fontSize: FontSize.sp18),
      ),
    );
