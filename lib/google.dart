import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'home.dart';

class GoogleW extends StatefulWidget {
  const GoogleW({super.key});

  @override
  State<GoogleW> createState() => _GoogleWState();
}

class _GoogleWState extends State<GoogleW> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50,),
          ElevatedButton(onPressed: () async{
            final FirebaseAuth auth = FirebaseAuth.instance;
            try{
              final GoogleSignInAccount? gooAc = await GoogleSignIn(
                clientId: "822036550440-0k5ge55j3bni7vi0ci2pu5m174or64u3.apps.googleusercontent.com"
              ).signIn();
              final GoogleSignInAuthentication google = await gooAc!.authentication;
              final AuthCredential cred = GoogleAuthProvider.credential(
                accessToken: google.accessToken,
                idToken: google.idToken
              );
              await auth.signInWithCredential(cred);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> home()));
            }catch(e){
              print(e);
            }
          }, child: Text('Signin'))
        ],
      ),
    );
  }
}
