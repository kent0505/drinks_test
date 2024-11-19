import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'fonts.dart';

final theme = ThemeData(
  useMaterial3: false,
  fontFamily: Fonts.w400,
  dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
);

const cupertinoTheme = CupertinoThemeData(
  textTheme: CupertinoTextThemeData(
      textStyle: TextStyle(fontFamily: Fonts.w400, color: Colors.black)),
);
