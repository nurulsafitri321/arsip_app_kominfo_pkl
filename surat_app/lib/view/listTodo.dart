// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Checklist App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ChecklistScreen(),
//     );
//   }
// }

// class ChecklistScreen extends StatefulWidget {
//   @override
//   _ChecklistScreenState createState() => _ChecklistScreenState();
// }

// class _ChecklistScreenState extends State<ChecklistScreen> {
//   List<String> _tasks = [
//     'Task 1',
//     'Task 2',
//     'Task 3',
//     'Task 4',
//     'Task 5',
//   ];

//   List<bool> _taskStatus = List.generate(5, (_) => false);

//   bool _allTasksCompleted() {
//     return _taskStatus.every((taskCompleted) => taskCompleted);
//   }

//   void _toggleTask(int index) {
//     setState(() {
//       _taskStatus[index] = !_taskStatus[index];
//     });
//   }

//   void _resetTasks() {
//     setState(() {
//       _taskStatus = List.generate(5, (_) => false);
//     });
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text('Semua tugas telah direset'),
//     ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Checklist'),
//       ),
//       body: ListView.builder(
//         itemCount: _tasks.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(_tasks[index]),
//             trailing: Checkbox(
//               value: _taskStatus[index],
//               onChanged: (value) {
//                 _toggleTask(index);
//               },
//             ),
//           );
//         },
//       ),
//       floatingActionButton: _allTasksCompleted()
//           ? FloatingActionButton(
//               onPressed: _resetTasks,
//               tooltip: 'Reset Tugas',
//               child: Icon(Icons.refresh),
//             )
//           : null,
//     );
//   }
// }
