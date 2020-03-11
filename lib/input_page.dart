import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constant.dart';


enum Gender{male,female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  
//  Color maleCardColor = inactiveCardColor;
//  Color femaleCardColor = inactiveCardColor;
//
//  void updateColor(Gender selectedGender){
//    if(selectedGender == Gender.male){
//      if(maleCardColor==inactiveCardColor){
//        maleCardColor = activeCardColor;
//        femaleCardColor = inactiveCardColor;
//      }else{
//        maleCardColor = inactiveCardColor;
//      }
//    }
//  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    print('Male Card Was pressed');
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: ReusableCard(
                    onPressed: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male ? activeCardColor:inactiveCardColor,
                    cardChild: IconContent(icon: FontAwesomeIcons.mars, label: "MALE",),
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPressed: (){
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: inactiveCardColor,
                  cardChild: IconContent(icon: FontAwesomeIcons.venus, label: "FEMALE",),
                ),
              ),
            ],
           )
          ),
          Expanded
            (child: ReusableCard(colour: activeCardColor,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Height',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    height.toString(),
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text('cm')
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                ),
                child: Slider(
                  value: height.toDouble(),
                  min: 120,
                  max: 220,

                  inactiveColor: Color(0xFF808E98),
                  activeColor: Colors.pink,
                  onChanged: (double newValue){
                    setState(() {
                      height = newValue.round();
                    });
                  },
                ),
              )
            ],
          ),),
          ),

          Expanded
            (child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(colour: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        'Weight'
                    ),
                    Text(
                      weight.toString(),
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                          onPressed: (){
                              setState(() {
                                weight--;
                              }
                              );
                          },
                         ),
                        SizedBox(
                          width: 10.0,
                        ),
                         RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                          onPressed: (){
                              setState(() {
                                weight++;
                              });
                          },),
                      ],

                    )

                  ],
                ),),

              ),
              Expanded(
                  child: ReusableCard(colour: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Age',),
                      Text(
                        age.toString(),
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(icon: FontAwesomeIcons.minus,
                            onPressed: (){
                            setState(() {
                              age--;
                            });
                            },),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: (){
                            setState(() {

                            });
                          },),
                        ],
                      )
                    ],
                  ),),
              ),
            ],
          ),
          ),
          Container(
            color: Color(0xFFEB1555),
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 80.0,
          )
        ],

      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {

  RoundIconButton({this.icon, this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Colors.purple,
    );
  }
}




