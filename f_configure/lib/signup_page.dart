import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          try {
            UserCredential userCredential =
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: 'nrlsftr161@gmail.com',
              password: '123456',
            );
            // Jika berhasil mendaftar, tampilkan pesan sukses
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Sign Up Successful'),
                  content: Text('User ID: ${userCredential.user!.uid}'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          } on FirebaseAuthException catch (e) {
            // Jika terjadi kesalahan, tampilkan pesan error
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Error'),
                  content: Text(e.message!),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          }
        },
        child: Text('Sign Up'),
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class SignUp extends StatelessWidget {
//   const SignUp({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ElevatedButton(
//         onPressed: () async {
//           try {
//             UserCredential userCredential =
//                 await FirebaseAuth.instance.createUserWithEmailAndPassword(
//               email: 'nrlsftr161@gmail.com',
//               password: '123456',
//             );
//             // Jika berhasil mendaftar, tampilkan pesan sukses
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   title: Text('Sign Up Successful'),
//                   content: Text('User ID: ${userCredential.user!.uid}'),
//                   actions: [
//                     TextButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: Text('OK'),
//                     ),
//                   ],
//                 );
//               },
//             );
//           } on FirebaseAuthException catch (e) {
//             // Jika terjadi kesalahan, tampilkan pesan error
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   title: Text('Error'),
//                   content: Text(e.message!),
//                   actions: [
//                     TextButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: Text('OK'),
//                     ),
//                   ],
//                 );
//               },
//             );
//           }
//         },
//         child: Text('Sign Up'),
//       ),
//     );
//   }
// }