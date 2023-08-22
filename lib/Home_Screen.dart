import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iot_project/My_Service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String temp = "25";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left:20,top: 20 ),
                  child: Text("Welcome Back",style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade600
                  ),),
                ),

                Container(
                  margin: EdgeInsets.only(left:20,),
                  child: Text("Sir Tayyab",style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  ),),
                ),

                SizedBox(
                  height: 10,
                ),

                FutureBuilder(
                  future: MyService.fetch(),
                  builder: (context, snapshot) {

                  if(snapshot.hasData){

                    Map map = jsonDecode(snapshot.data);
                    List data = map["all_data"];

                    print(data);

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                          width: double.infinity,
                          height: 170,
                          decoration: BoxDecoration(

                            border: Border.all(color: Colors.white10),
                            borderRadius: BorderRadius.circular(14),
                            gradient: LinearGradient(colors: [
                              Colors.blue.shade50,
                              Colors.blue.shade100
                            ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade200,
                                  spreadRadius: 2,
                                  blurRadius: 10
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Container(
                                margin: EdgeInsets.only(left:20,top: 20 ),
                                child: Text("Temperature: ${data[index]["temprature"]} °C",style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),),
                              ),

                              Container(
                                margin: EdgeInsets.only(left: 20),
                                width: 40,
                                child: Divider(
                                  color: Colors.black,
                                  thickness: 1,
                                ),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [

                                  Container(
                                    margin: EdgeInsets.only(left: 10,top:10),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Text("${data[index]["ph_value"]}",style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),),
                                        ),

                                        Container(
                                          child: Text("ph Value",style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    height: 24,
                                    child: VerticalDivider(
                                      thickness: 1,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),

                                  Container(
                                    margin: EdgeInsets.only(left: 10,top:10),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Text("${data[index]["water_level"]}",style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),),
                                        ),

                                        Container(
                                          child: Text("Water Level",style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    height: 24,
                                    child: VerticalDivider(
                                      thickness: 1,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),

                                  Container(
                                    margin: EdgeInsets.only(left: 10,top:10),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Text("${data[index]["water_flow"]}",style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),),
                                        ),

                                        Container(
                                          child: Text("Water Flow",style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [

                                  Container(
                                    margin: EdgeInsets.only(left: 10,top:10),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Text("${data[index]["soil_moisture"]}",style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),),
                                        ),

                                        Container(
                                          child: Text("Soil Moisture",style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    height: 24,
                                    child: VerticalDivider(
                                      thickness: 1,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),

                                  Container(
                                    margin: EdgeInsets.only(left: 10,top:10),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Text("${data[index]["humidity"]}",style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),),
                                        ),

                                        Container(
                                          child: Text("Humidity",style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    height: 24,
                                    child: VerticalDivider(
                                      thickness: 1,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),

                                  Container(
                                    margin: EdgeInsets.only(left: 10,top:10),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Text("${data[index]["soil_temprature"]}",style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),),
                                        ),

                                        Container(
                                          child: Text("Soil Temperature",style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              )

                            ],
                          ),
                        );
                      },);
                  }

                  if(snapshot.hasError){
                    return Center(child: Icon(Icons.error),);
                  }

                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LinearProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.grey.shade600),
                          backgroundColor: Colors.black,
                        ),
                      ],
                    );
                  }

                  return Container();
                },)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
