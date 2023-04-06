import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 30, bottom: 50),
                    child: Container(
                      color: Colors.black,
                      width: 135.0,
                      height: 135.0,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 0, bottom: 50),
                    child: Container(
                      color: Colors.black,
                      width: 135.0,
                      height: 135.0,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Container(
                      width: 300.0,
                      height: 200.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      width: 90.0,
                      height: 90.0,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      width: 90.0,
                      height: 90.0,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(),
                    child: Container(
                      width: 90.0,
                      height: 90.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.square),
            label: 'Square',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'Circle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hexagon),
            label: 'Hexagon',
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}