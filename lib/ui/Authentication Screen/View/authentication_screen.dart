import 'package:allevents/ui/Category%20Screen/View/category_screen.dart';
import 'package:allevents/utils/shared_preference.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/png/all_events.png',width: 150, height: 150,),
            SizedBox(height: 20,),
            Text('All Events',style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 30,),
            Text('Sign in with google'),
            SizedBox(height: 10,),
            InkWell(
              onTap: () async{

                await signInWithGoogle(context: context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        color: Colors.white,
                        child: Image.asset('assets/images/png/google_icon.png',width: 50,
                        height: 50,),
                      ),
                      SizedBox(width: 10,),
                      Text('Google Signin')
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,

      );

      try {
        final UserCredential userCredential =
        await auth.signInWithCredential(credential);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        user = userCredential.user;
        prefs.setString('keyUID', user!.uid);
        print('KAYE ${prefs.getString('keyUID')}');

        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>CategoryScreen()),(route) => false,);

      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        }
        else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }
    }
    return user;
  }



}
