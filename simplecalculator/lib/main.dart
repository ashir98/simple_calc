// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {








  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
   

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}



// ignore: use_key_in_widget_constructors
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}





class _MyHomePageState extends State<MyHomePage> {


  //LOGIC

  int firstnum = 0;
  int secondnum = 0;
  String history = "";
  String textToDisplay ="";
  String res = "";
  String operatorToPerform = "";
  void btnTapped(String btnText){
    if(btnText == "C"){
      firstnum = 0;
      secondnum = 0;
      textToDisplay ="";
      res ="";

    }else if(btnText == "AC"){
      firstnum = 0;
      secondnum = 0;
      textToDisplay ="";
      res ="";
      history = "";
    }

    
    
    else if(btnText == "+" || btnText == "-" || btnText == "x" || btnText == "/"){
      firstnum = int.parse(textToDisplay);
      res = "";
      operatorToPerform = btnText; 
    }
    
    else if( btnText == "⌫"){

      res = textToDisplay.substring(0, textToDisplay.length - 1);

    }
    
    else if(btnText == "="){
      secondnum = int.parse(textToDisplay);
      

      if(operatorToPerform =="+"){
        res = (firstnum + secondnum).toString();
        history = firstnum.toString() + operatorToPerform.toString() + secondnum.toString();
      }
      if(operatorToPerform =="-"){
        res = (firstnum - secondnum).toString();
        history = firstnum.toString() + operatorToPerform.toString() + secondnum.toString();
      }
      if(operatorToPerform =="x"){
        res = (firstnum * secondnum).toString( );
        history = firstnum.toString() + operatorToPerform.toString() + secondnum.toString();
      }
      if(operatorToPerform=="÷"){
        res = (firstnum / secondnum).toStringAsFixed(8);
        history = firstnum.toString() + operatorToPerform.toString() + secondnum.toString();
      }
      


    }

    else{
        res = int.parse(textToDisplay + btnText).toString();
      };

          setState(() {
        textToDisplay = res ;
      });

  }

  Widget custombutton(var borderColor, btnText,btnTextColor, btnColor, double btnFontSize){


    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(height: 9.h,width: 9.h),
      child: ElevatedButton(
        onPressed: ()=>btnTapped(btnText), 

        

        child: Text(btnText), 
        
        
        
        style: ElevatedButton.styleFrom(
         
          
          
          
          primary: Color(btnColor),
          textStyle: TextStyle(color: Color(btnTextColor), fontSize: btnFontSize, ),
          elevation: 10,
          side: BorderSide(color: Color(borderColor), width: 0.2.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.h))
        ),),
    );
  

  }


  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, Orientation, DeviceType) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'SIMPLE CALCULATOR',
          home: Scaffold(
            appBar: AppBar(
              title: Text('Calculator'),
            ),
            body: Container(
              color: Color(0xFF1c1c1c),
              padding: EdgeInsets.all(2.5.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  //DISPLAY

                  Container(
                    padding: EdgeInsets.only(bottom: 7.h),
                    
                    child: Column(children: [
                      Container(
                        
                      padding: EdgeInsets.only(right: 1.5.h,bottom: 2.h),
                      alignment: Alignment.bottomRight,
                      child: Text(history,style: TextStyle(fontSize: 4.h, color: Colors.grey),),
                    ),
                    Container(
                      
                      padding: EdgeInsets.all(1.5.h),
                      alignment: Alignment.bottomRight,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text("$textToDisplay",style: TextStyle(fontSize: 10.h, color: Colors.blue),)),
                    ),
                    ],),
                  ),
                  



                  Container(
                    
                    
                    child: Column(
                      children: [



                        Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        custombutton(0xFF2da84e,"AC", 0xFF2da84e, 0xFF0d0d0d, 4.h),
                        custombutton(0xFF2da84e,"C", 0xFF2da84e, 0xFF0d0d0d, 4.h),
                        custombutton(0xFF2da84e,"⌫", 0xFF2da84e,0xFF0d0d0d, 4.h),
                        custombutton(0xFF9c1616,"%",0xFF9c1616, 0xFF0d0d0d, 4.h),
                        
                      ],
                    ),
                  ),



                        
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        custombutton(0xFF1779ad,"9", 0xFF1779ad, 0xFF0d0d0d, 4.h),
                        custombutton(0xFF1779ad,"8", 0xFF1779ad, 0xFF0d0d0d, 4.h),
                        custombutton(0xFF1779ad,"7", 0xFF1779ad, 0xFF0d0d0d, 4.h),
                        custombutton(0xFF9c1616,"+", 0xFF9c1616, 0xFF0d0d0d, 4.h),
                        
                      ],
                    ),
                  ),





                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        custombutton(0xFF1779ad,"6", 0xFF1779ad, 0xFF0d0d0d, 4.h),
                        custombutton(0xFF1779ad,"5", 0xFF1779ad, 0xFF0d0d0d, 4.h),
                        custombutton(0xFF1779ad,"4", 0xFF1779ad, 0xFF0d0d0d, 4.h),
                        custombutton(0xFF9c1616,"-", 0xFF9c1616, 0xFF0d0d0d, 4.h),
                      ],
                    ),
                  ),





                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        custombutton(0xFF1779ad,"3", 0xFF1779ad, 0xFF0d0d0d, 4.h),
                        custombutton(0xFF1779ad,"2", 0xFF1779ad, 0xFF0d0d0d, 4.h),
                        custombutton(0xFF1779ad,"1", 0xFF1779ad, 0xFF0d0d0d, 4.h),
                        custombutton(0xFF9c1616,"x", 0xFF9c1616, 0xFF0d0d0d, 4.h),
                      ],
                    ),
                  ),




                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        custombutton(0xFF1779ad,".", 0xFF1779ad, 0xFF0d0d0d, 4.h),
                        custombutton(0xFF1779ad,"0", 0xFF1779ad, 0xFF0d0d0d, 4.h),
                        custombutton(0xFF9c1616,"=", 0xFF9c1616, 0xFF0d0d0d, 4.h),
                        custombutton(0xFF9c1616,"÷", 0xFF9c1616, 0xFF0d0d0d, 4.h),
                      ],
                    ),
                  ),
                      ],
                    ),
                  )



                ],
              ),
            ),
          ));
    });
  }



}