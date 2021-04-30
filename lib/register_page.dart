import 'package:flutter/material.dart';
import 'package:praktikum_firebase/auth_service.dart';
import 'package:praktikum_firebase/login_page.dart';
import 'package:praktikum_firebase/profil_page.dart';
import 'package:praktikum_firebase/sign_in_sign_up.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
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
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                      ),
                      validator: (value){
                        if(value.isEmpty){
                          return "Enter an Email Address";
                        }
                        else if(!value.contains('@')){
                          return "Please enter a valid email address";
                        }
                        return null;
                      }
                    ),   
                    SizedBox(height: 8),
                    SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Enter Password",
                          enabledBorder: OutlineInputBorder(
                            borderRadius:BorderRadius.circular(8),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                        ),
                        validator: (value){
                          if(value.isEmpty){
                            return "Enter Password";
                          }
                          else if(value.length<6){
                            return "Password must be atleast 6 characters!";
                          }
                          return null;
                        }
                      ),
                     SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: Color(0xFF4f4f4f),
                    child: RaisedButton(
                      child: Text("Login", style: TextStyle(color: Colors.white)),
                      onPressed:() async{
                      SignInSignUpResult result = await AuthService.createUser(
                        email: _emailController.text, password: _passwordController.text
                      );
                      if (result.user != null){
                        //Go to first screen
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context) => ProfilePage(),
                          ),
                        );
                      }
                      else{
                        showDialog(
                          context: context, 
                          builder: (context) => AlertDialog(
                            title: Text('Error'), 
                            content: Text(result.message),
                            actions: <Widget>[
                              FlatButton(onPressed: (){
                                Navigator.pop(context);
                              }, 
                              child: Text("OK"),
                              ),
                            ],
                          ),
                        );
                      }
                    }
                ),
              ),
               Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(bottom: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("Already have account ?"),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context)=> LoginPage())
                          );
                        },
                        child: Text("Login Here", style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
               )
            ],
          ),
        ),
      ),
    );
  }
}
