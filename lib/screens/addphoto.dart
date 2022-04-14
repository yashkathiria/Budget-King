// import 'package:flutter/material.dart';
// import 'home_screen.dart';

// class Addingphoto extends StatefulWidget {
//   const Addingphoto({Key key}) : super(key: key);

//   @override
//   State<Addingphoto> createState() => _AddingState();
// }

// class _AddingState extends State<Addingphoto> {
//   bool changebutton = false;
//   final _formKey = GlobalKey<FormState>();

//   moveToHome(BuildContext context) async {
//     if (_formKey.currentState.validate()) {
//       setState(() {
//         changebutton = true;
//       });
//       await Future.delayed(Duration(seconds: 1));
//       await Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => HomeScreen(),
//         ),
//       );
//       setState(() {
//         changebutton = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         title: Text(
//           'Add Catogary',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
