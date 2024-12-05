import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qubit_list/cubitlist.dart';

import 'homepage.dart';

void main(){
  runApp(BlocProvider(create: (_)=>ListCubit(),child: MyApp(),));
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: HomePage(),
    );
  }
}