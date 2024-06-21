import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: () async{
            try{
              final GoogleSignIn goog = GoogleSignIn();
              goog.signOut();
              Navigator.pop(context);

            }catch(e){
              print(e);
            }
          }, child: Text('SignOut'))
        ],
      ),
    );
  }
}
