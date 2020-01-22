import 'package:flutter/material.dart';

import 'custom_card.dart';

class ContentPage extends StatefulWidget {
  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0xff00000),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 0.0),
                    child: Text('Michael\'s Hispanic Grill',
                        style: TextStyle(
                            color: Color(0xffb38867), fontSize: 48.0)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Text('Better to eat happily',
                        style: TextStyle(
                            color: Color(0xffddbc95), fontSize: 48.0)),
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.fromLTRB(100.0, 32.0, 0.0, 32.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 12,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: buttons.length,
                          itemBuilder: (BuildContext ctx, int idx) {
                            return buttons[idx];
                          },
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(65.0, 0.0, 0.0, 32.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: cards.length,
                        itemBuilder: (BuildContext ctx, int idx) {
                          return cards[idx];
                        },
                      ),
                    ),
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.fromLTRB(80.0, 32.0, 32.0, 32.0),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 16,
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text(
                            'Checkout: 0 items selected (\$72.58)',
                            style:
                                TextStyle(color: Colors.black, fontSize: 22.0),
                          ),
                          color: Colors.redAccent,
                        ),
                      ))
                ],
              ),
            )));
  }

  static Widget CustomButton(String text, IconData iconData, Color color) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: color,
                child: Icon(iconData),
              ),
            ),
            Text(
              text,
              style: TextStyle(fontSize: 20.0),
            )
          ],
        ));
  }

  var buttons = [
    CustomButton('Alcholic Drinks', Icons.local_bar, Colors.redAccent),
    CustomButton('Fast Food', Icons.fastfood, Colors.greenAccent),
    CustomButton('Combo Meals', Icons.restaurant_menu, Colors.yellow),
    CustomButton('Alcholic Drinks', Icons.local_bar, Colors.blueAccent),
    CustomButton('Fast Food', Icons.fastfood, Colors.pink[50]),
    CustomButton('Combo Meals', Icons.restaurant_menu, Colors.purpleAccent),
  ];

  List<CustomCard> cards = [
    CustomCard(
        img: 'assets/images/desserts.png',
        food: 'Coconut',
        subtitle: 'with strawberries',
        description: '',
        calories: 420),
    CustomCard(
        img: 'assets/images/desserts.png',
        food: 'Cupcake',
        subtitle: 'with trailmix',
        description: '',
        calories: 420),
    CustomCard(
        img: 'assets/images/desserts.png',
        food: 'Coconut',
        subtitle: 'with strawberries',
        description: '',
        calories: 420),
    CustomCard(
        img: 'assets/images/desserts.png',
        food: 'Coconut',
        subtitle: 'with strawberries',
        description: '',
        calories: 420),
    CustomCard(
        img: 'assets/images/desserts.png',
        food: 'Coconut',
        subtitle: 'with strawberries',
        description: '',
        calories: 420),
  ];
}
