import 'package:flutter/material.dart';
import 'package:iot_project/Home_Screen.dart';
import 'package:iot_project/Login_Screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  bool hidden = true;

  void _checking(){
    setState(() {
      hidden = !hidden;
    });
  }


  // Controller

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

  // Form Key

  final _key = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    _name.dispose();
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Center(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Center(
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(image: AssetImage('images/RegisterScreen.png'))
                        ),
                      ),
                    ),


                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade300,
                      ),
                      child: TextFormField(
                        controller: _name,
                        validator: (value){
                          if (value==null || value.isEmpty || value==" ") {
                            return "Name is Required";
                          }
                        },
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          hintText: "Enter Your Name Here",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,borderRadius: BorderRadius.circular(20)
                          ),
                          prefixIcon: Icon(Icons.person,size: 18),
                          prefixIconColor: Colors.black
                        ),
                      ),
                    ),

                    SizedBox(height: 14,),

                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade300,
                      ),
                      child: TextFormField(
                        controller: _email,
                        validator: (value){
                          if (value==null || value.isEmpty || value==" ") {
                            return "Email is Required";
                          }
                        },
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            hintText: "Enter Your Email Here",
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,borderRadius: BorderRadius.circular(20)
                            ),
                            prefixIcon: Icon(Icons.email,size: 18,),
                            prefixIconColor: Colors.black
                        ),
                      ),
                    ),

                    SizedBox(height: 14,),

                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade300,
                      ),
                      child: TextFormField(
                        controller: _pass,
                        validator: (value){
                          if (value==null || value.isEmpty || value==" ") {
                            return "Pass is Required";
                          }
                        },
                        obscureText: hidden==true?true:false,
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            hintText: "Enter Your Password Here",
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,borderRadius: BorderRadius.circular(20)
                            ),
                            prefixIcon: Icon(Icons.key,size: 18,),
                            prefixIconColor: Colors.black,
                            suffixIcon: GestureDetector(
                                onTap: (){
                                  _checking();
                                },
                                child: hidden==true?Icon(Icons.remove_red_eye,size: 18,):Icon(Icons.panorama_fish_eye,size: 18,)),
                            suffixIconColor: Colors.grey.shade800

                      ),
                      ),
                    ),

                    SizedBox(height: 20,),

                    Center(
                      child: Container(
                        width: 140,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                  )),
                              backgroundColor: MaterialStatePropertyAll(Colors.black),

                            ),
                            onPressed: (){
                              if (_key.currentState!.validate()) {
                                _name.clear();
                                _email.clear();
                                _pass.clear();
                              }

                        }, child: Center(child: Text("Sign Up"),)),
                      ),
                    ),

                    SizedBox(height: 14,),

                    Center(
                      child: Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an Account!"),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                              },
                              child: Text(" Login",style: TextStyle(
                                  color: Colors.blue.shade400,
                                  fontWeight: FontWeight.w600
                              ),),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 90,),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
