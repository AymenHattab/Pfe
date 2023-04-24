import 'package:app/component/particles/circle.dart';
import 'package:app/component/signup.dart';
import 'package:app/main.dart';
import 'package:app/ui/login.dart';
import 'package:app/ui/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class signupAndLogin extends StatefulWidget {
  const signupAndLogin({super.key});

  @override
  State<signupAndLogin> createState() => _signupAndLoginState();
}

Color one=Color.fromRGBO(0, 85, 211, 1) ;
Color two=Colors.white;
class _signupAndLoginState extends State<signupAndLogin> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Container(
        color: Colors.grey[50],
        child: Stack(
          children: [
            // Align(
            //     alignment: Alignment(0, 1),
            //     child: Container(
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //       color: Color.fromRGBO(21, 115, 208, 0.267),
                 
            //       ),
             
            //       height: 100,
            //     )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("images/linaSignUpImage.png"),
                ),
                SizedBox(height: 10,),
                   Container(
                    width: 212,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue)
                    ),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   AnimatedContainer(
                                     width: 100,
                                     height: 30,
                                     duration: Duration(milliseconds: 300),
                                     decoration: BoxDecoration(
                                     color: one,
                      borderRadius: BorderRadius.circular(4 )
                                     ),
                                     child: Center(
                      child: Text(
                        "sign up",
                        style: TextStyle(
                            fontSize: 20,
                            color: two,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lexend'),
                      ),
                                     ),
                                   ),
                                   SizedBox(width: 10,),
                                   Container(
                                     color: two,
                                     width: 100,
                                     height: 30,
                                     child: Center(
                      child: Text(
                        "login",
                        style: TextStyle(
                            fontSize: 20,
                            color: one,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lexend'),
                      ),
                                     ),
                                   ),
                                 ],
                               ),
                   ),
              
              ],
            ),
         
            Container(child: PageView(onPageChanged: (value) {
              setState(() {
               Color aux = one;
               one=two;
               two=aux;

              });
            },children: [signup(), login()])),
            // signup()
          ],
        ),
      ),
    );
  }
}
