import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:praktikum_firebase/login_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),child: SafeArea(child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Profile",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 36,
                            letterSpacing: 5
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  Padding(padding: EdgeInsets.only(top:20),
                  child: 
                    Text("Email",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.email_outlined), ),
                        title: Text(auth.currentUser.email),
                    ),
                  ),
                  
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: RaisedButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new LoginPage()
                            ),
                        );
                      },
                      child: Text(
                        "Log Out",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: Color(0xFF4f4f4f),
                      elevation: 0,
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}