import 'package:flutter/material.dart';
import 'package:praktikum_firebase/first_screen.dart';
import 'package:praktikum_firebase/register_page.dart';
import 'package:praktikum_firebase/sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

  //controller untuk input email dan password
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(size: 80),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Email"),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Email",
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey
                            ),
                          ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text("Password"),
                    SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius:BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:BorderRadius.circular(8),
                            borderSide: BorderSide(
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                        ),
                      ),
                     SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () {},
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              color: Color(0xFF4f4f4f),
                              elevation: 0,
                              padding:EdgeInsets.symmetric(vertical: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
    
              SizedBox(height: 10),
              Text("OR"),
              SizedBox(height: 10), _signInButton(),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("Don\’t have account ?",
                      //style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => RegisterPage()));
                      },
                      child: Text("Register here",
                      //style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

 Widget _signInButton() {
  return OutlineButton(
    splashColor: Colors.grey,
    onPressed: () {
      signInWithGoogle().then((result) {
        if (result != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return FirstScreen();
              },
            ),
          );
        }
      });
    },
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    highlightElevation: 0,
    borderSide: BorderSide(color: Colors.grey),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 25.0,
            child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png")),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Sign in with Google',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    ),
  );
 }
}