import 'package:flutter/material.dart';
import 'package:side_menu/side_menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Navigation Drawer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  var _items = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Side Menu",
          ),
        ),
        //drawer: CollapsingNavigationDrawer(),
        body: Stack(
          children: <Widget>[
            Container(color: Colors.grey),
            SideMenu(
              backgroundColor: Colors.grey.shade700,
              screenWidth: MediaQuery.of(context).size.width,
              buttonClosed: Text(
                'Compare aqui',
              ),
              buttonExpanded: Text(
                'Editar opções',
              ),
              bodyWidget: Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      return Text(
                        _items[index],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      );
                    }),
              ),
            )
          ],
        ));
  }
}
