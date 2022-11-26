import 'package:flutter/material.dart';

extension EmptyThroughNum on num{
  SizedBox get emptyHeight => SizedBox(height: toDouble());
  SizedBox get emptyWidth => SizedBox(width: toDouble());
  Spacer get spacer => Spacer(flex: toInt());
}