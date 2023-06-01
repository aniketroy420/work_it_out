import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_it_out/components/heat_map.dart';
import 'package:work_it_out/data/workout_data.dart';
import 'package:work_it_out/pages/workout_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    Provider.of<WorkoutData>(context, listen: false).intializeWorkoutList();
  }

  //text controller
  final newWorkoutNameController = TextEditingController();

  //create a new workout
  void createNewWorkout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Create new Workout and Workit Out"),
        content: TextField(
          controller: newWorkoutNameController,
        ),
        actions: [
          //save button
          MaterialButton(
            onPressed: save,
            child: const Text("save"),
          ),
          MaterialButton(
            onPressed: cancel,
            child: const Text("cancel"),
          ),
        ],
      ),
    );
  }

  //go to workout page
  void gotoWorkoutPage(String workoutName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkoutPage(
          workoutName: workoutName,
        ),
      ),
    );
  }

  //save workout
  void save() {
    // get workout name from text controller
    String newWorkoutName = newWorkoutNameController.text;

    // add workout to workoutdata list
    Provider.of<WorkoutData>(context, listen: false).addWorkout(newWorkoutName);

    // pop the dialog box
    Navigator.pop(context);
    clear();
  }

  //cancel
  void cancel() {
    //pop the dialog box
    Navigator.pop(context);
    clear();
  }

  // clear controllers
  void clear() {
    newWorkoutNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
          backgroundColor: Colors.lightBlueAccent,
          appBar: AppBar(
            title: const Text("Workit Out"),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: createNewWorkout,
            child: const Icon(Icons.add),
          ),
          body: ListView(
            children: [
              //HEATMAP
              MyHeatMap(
                  datasets: value.heatMapDataSet,
                  startDateDDMMYYYY: value.getStartDate()),

              //WORKOUT LIST
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: value.getWorkoutList().length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(value.getWorkoutList()[index].name),
                  trailing: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () =>
                        gotoWorkoutPage(value.getWorkoutList()[index].name),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
