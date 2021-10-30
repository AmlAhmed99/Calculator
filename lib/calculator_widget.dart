
import 'package:calculator/Buttons.dart';
import 'package:flutter/material.dart';

class calculatorWidget extends StatefulWidget {
  @override
  _calculatorWidgetState createState() => _calculatorWidgetState();
}

class _calculatorWidgetState extends State<calculatorWidget> {
  bool isLight=false;
  String result='';
  String operator='';
  String LHS='';
  String RHS='';
  var buttonList=[
    Buttons(ButtonText: 'AC',ButtonColor: Color.fromRGBO(62, 165, 89, 1.0),onpress:(){},),
    Buttons(ButtonText: '+/-',ButtonColor: Color.fromRGBO(62, 165, 89, 1.0),onpress:(){},),
    Buttons(ButtonText: '%',ButtonColor: Color.fromRGBO(62, 165, 89, 1.0),onpress: (){},),
    Buttons(ButtonText: '/',ButtonColor: Color.fromRGBO(239, 19, 46, 1.0),onpress: (){},),
    Buttons(ButtonText: '7',ButtonColor: Colors.white,onpress: (){},),
    Buttons(ButtonText: '8',ButtonColor: Colors.white,onpress: (){},),
    Buttons(ButtonText: '9',ButtonColor: Colors.white,onpress: (){},),
    Buttons(ButtonText: '*',ButtonColor: Color.fromRGBO(239, 19, 46, 1.0),onpress: (){},),
    Buttons(ButtonText: '4',ButtonColor: Colors.white,onpress: (){},),
    Buttons(ButtonText: '5',ButtonColor: Colors.white,onpress: (){},),
    Buttons(ButtonText: '6',ButtonColor: Colors.white,onpress: (){},),
    Buttons(ButtonText: '-',ButtonColor:Color.fromRGBO(239, 19, 46, 1.0),onpress:(){},),
    Buttons(ButtonText: '1',ButtonColor: Colors.white,onpress:(){},),
    Buttons(ButtonText: '2',ButtonColor: Colors.white,onpress: (){},),
    Buttons(ButtonText: '3',ButtonColor: Colors.white,onpress:(){},),
    Buttons(ButtonText: '+',ButtonColor: Color.fromRGBO(239, 19, 46, 1.0),onpress: (){},),
    Buttons(ButtonText: 'ref',ButtonColor: Colors.white,onpress: (){},),
    Buttons(ButtonText: '0',ButtonColor: Colors.white,onpress: (){},),
    Buttons(ButtonText: '.',ButtonColor: Colors.white,onpress: (){},),
    Buttons(ButtonText: '=',ButtonColor:Color.fromRGBO(239, 19, 46, 1.0),onpress:(){},),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(43, 43, 43, 1.0),
                  ),
                  alignment: Alignment.center,
                  height: 50,
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          icon: Icon(Icons.wb_sunny_outlined,color:isLight? Colors.white:Colors.grey,),
                          onPressed: (){
                          setState(() {
                            isLight=true;
                          });
                          }
                          ),
                      IconButton(
                          icon: Icon(Icons.nights_stay_sharp,color:isLight?Colors.grey: Colors.white,),
                          onPressed: (){
                          setState(() {
                            isLight=false;
                          });
                          }
                          ),

                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                        child: Container(
                          margin: EdgeInsets.all(20),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [

                              Text(result==''?'0.0':result,style: TextStyle(
                                color: Colors.white,
                                fontSize: 35
                              ),),
                            ],
                          ),
                        )),
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                          color: Color.fromRGBO(43, 43, 43, 1.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 15,
                                childAspectRatio:1.1

                            ),
                            itemCount: buttonList.length,
                            itemBuilder: (ctx,idx){
                              return Buttons(onpress: press(buttonList[idx].ButtonText),
                                ButtonColor:buttonList[idx].ButtonColor ,
                                ButtonText: buttonList[idx].ButtonText,);
                            },

                          ),
                        ),
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
  Function press (String input){
    if(input=='-'||input=='+'||input=='*'||input=='/')
      return onOperator;
    else if(input=='0'||input=='1'||input=='2'||input=='3'||input=='4'||input=='5'||
        input=='6'||input=='7'||input=='8'||input=='9')
      return onButton;
    else if(input=='=')
      return onEqualClick;
    else if(input=='ref'||input=='AC')
      return clear;
    return onButton ;
  }
  void onButton(String text){
  result+=text;
  setState(() {

  });
  }
  void onEqualClick(String str){
    RHS=result;
    String res= calculate(LHS,operator,RHS);
    result=res;
    operator='';
    LHS='';
    setState(() {

    });

  }

  void onOperator(String operat){
    if(operator.isEmpty)
      {
        operator=operat;
        LHS=result;
        result='';
        setState(() {

        });
      }
    else
      {
        RHS=result;
       String res= calculate(LHS,operator,RHS);
       LHS=res;
       result='';
       operator=operat;
      }
    setState(() {

    });
  }

  String calculate(String lhs, String operator, String rhs) {
    double num1=double.parse(lhs);
    double num2=double.parse(rhs);
    double res=0;
    if(operator=='+')
      {
         res=num1+num2;
      }
    else if(operator=='-')
      {
        res=num1-num2;
      }
    else if(operator=='*')
      {
        res=num1*num2;
      }
    else if(operator=='/')
      {
        res=num1/num2;
      }

   return res.toString();
  }

  void clear(String res) {
    result='';
    setState(() {

    });

  }

}




