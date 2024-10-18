import 'package:firebase_auth/firebase_auth.dart';
class LoginScreen extends StatefulWidget {
  // ...

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();  

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ...
      body: Form(
        key: _formKey,
        child: Column(
          // ...
          children: 
 [
            // Email and password fields
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  loginUser(_emailController.text, _passwordController.text);
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
Future<void> registerUser(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance 

        .createUserWithEmailAndPassword(email: email, password: password); 

    // Handle successful registration (e.g., show a success message, navigate to the login screen)
  } on FirebaseAuthException catch (e) {
    // Handle registration errors (e.g., show error messages)
    if (e.code == 'weak-password') {
      print('Password is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('Email is already in use.');
    } else {
      print('Error: ${e.code}');
    }
  }
}
Future<void> loginUser(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password); 

    // Handle successful login (e.g., navigate to the app's main screen)
  } on FirebaseAuthException catch (e) {
    // Handle login errors (e.g., show error messages)
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided.'); 

    } else {
      print('Error: ${e.code}');
    }
  }
}
Future<void> resetPassword(String email) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    // Handle successful password reset email sent (e.g., show a success message)
  } on FirebaseAuthException catch (e) {
    // Handle password reset email sending errors (e.g., show error messages)
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else {
      print('Error: ${e.code}');
    }
  }
}
void checkUserSignIn() {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    print('User is signed in with UID: ${user.uid}');
    print('Email: ${user.email}');
    print('Display name: ${user.displayName}');
    // ... access other user information
  } else {
    print('User is not signed in');
  }
}