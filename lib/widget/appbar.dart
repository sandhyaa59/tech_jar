import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

PreferredSize appbar(String title){
  return PreferredSize(preferredSize: Size.fromHeight(2), child: Text(title));
}