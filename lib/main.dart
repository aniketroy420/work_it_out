import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:work_it_out/data/workout_data.dart';
import 'package:work_it_out/pages/home_page.dart';


void main() async{
  //initialize hive

  await Hive.initFlutter();


  //open a hive box
  await Hive.openBox("workout_database1");


  runApp(const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkoutData(),
      child:   const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),


    );
  }
}
