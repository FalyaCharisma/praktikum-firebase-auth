import 'package:firebase_auth/firebase_auth.dart';
import 'package:praktikum_firebase/sign_in_sign_up.dart';

class AuthService {
  
  static FirebaseAuth _auth = FirebaseAuth.instance;
  //mendaftarkan user dengan input email dan password
  static Future<SignInSignUpResult> createUser(
    {String email, String password}) async{
      try{
        UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
        return SignInSignUpResult(user: result.user);
      } catch (e){
        return SignInSignUpResult(message: (e.message));
      }
    }
   static Future<SignInSignUpResult> signInWithEmail(
     {String email, String password}) async{
       try{
        UserCredential result = await _auth.signInWithEmailAndPassword(
           email: email, password: password);
        return SignInSignUpResult(user: result.user);
       } catch (e){
         return SignInSignUpResult(message: (e.message));
       }
     }
     static void signOut(){
       _auth.signOut();
     }
}