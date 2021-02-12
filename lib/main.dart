import 'package:flutter/material.dart';
import 'package:flutter_guzogo/pages/CabinClassSelector.dart';
import 'package:flutter_guzogo/pages/HomePage.dart';
import 'package:flutter_guzogo/pages/PassengerTypeSelector.dart';
// import 'package:flutter_guzogo/pages/PassengerTypeSelector.dart';
import 'package:flutter_guzogo/providers/state_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ApplicationState(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomePage(),
    CabinClassSelector(),
    PassengerType(),
  ];

  onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ApplicationState>(
        builder: (context, appState, widget) {
          return Stack(
            children: [
              _children[_currentIndex],
              !appState.passengersSelectorCollapsed ||
                      !appState.cabinSelectorCollapsed
                  ? Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    )
                  : Container(),
              AnimatedPositioned(
                top: appState.passengersSelectorCollapsed
                    ? MediaQuery.of(context).size.height
                    : MediaQuery.of(context).size.height / 2,
                left: 0,
                right: 0,
                child: PassengerType(),
                duration: Duration(milliseconds: 200),
              ),
              AnimatedPositioned(
                top: appState.cabinSelectorCollapsed
                    ? MediaQuery.of(context).size.height
                    : MediaQuery.of(context).size.height / 2,
                left: 0,
                right: 0,
                child: CabinClassSelector(),
                duration: Duration(milliseconds: 200),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        unselectedItemColor: Colors.black45,
        selectedItemColor: Colors.deepPurple,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}
