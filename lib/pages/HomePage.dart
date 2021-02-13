import 'package:flutter/material.dart';
import 'package:flutter_guzogo/pages/DestinationAirportSelector.dart';
import 'package:flutter_guzogo/pages/InitialAirportSelector.dart';
import 'package:flutter_guzogo/pages/InitialDateSelector.dart';
import 'package:flutter_guzogo/pages/ReturnDateSelector.dart';
import 'package:flutter_guzogo/providers/state_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(
      builder: (ctx, appState, child) {
        return SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 1.8,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.purple[900],
                      image: DecorationImage(
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.2), BlendMode.dstATop),
                        image: AssetImage('images/image_test.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: FlutterLogo(
                              size: 50,
                            ),
                          ),
                          _buildWayButtons(context),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildInitialPointSelector(context),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.airplanemode_active,
                                      color: Colors.purple,
                                      size: 13,
                                    ),
                                    Icon(
                                      Icons.airplanemode_active,
                                      color: Colors.purple,
                                      size: 13,
                                    ),
                                  ],
                                ),
                              ),
                              _buildFinalDestinationSelector(context),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildDepartureDateSelector(context),
                      _buildReturnDateSelector(context),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildClassSelector(context),
                      _buildChoosePassengersSelector(context),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 50,
                      left: 20,
                      right: 20,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: Colors.yellowAccent,
                    ),
                    child: TextButton(
                      child: Text(
                        'Search Flight',
                        style: TextStyle(
                          fontSize: 22,
                          letterSpacing: 1.1,
                          color: Colors.deepPurple[900],
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget _buildInitialPointSelector(BuildContext context) {
  var selectedAirport =
      Provider.of<ApplicationState>(context).selectedInitialAirport;
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) {
                return InitialAirportSelector();
              },
              settings: RouteSettings(name: 'context', arguments: context)));
    },
    child: Column(
      children: [
        Text(
          'From',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Text(
            '${selectedAirport.short}',
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 28,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Text(
          '${selectedAirport.townName}',
          style: TextStyle(
            fontSize: 19,
            fontFamily: 'Lato',
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
        Text(
          '${selectedAirport.airportName}',
          style: TextStyle(
            fontSize: 11,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    ),
  );
}

Widget _buildFinalDestinationSelector(BuildContext context) {
  var selectedDestination =
      Provider.of<ApplicationState>(context).selectedDestinationAirport;
  var appState = Provider.of<ApplicationState>(context);

  return selectedDestination != null && appState.is2Way
      ? InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) {
                      return DestinationAirportSelector();
                    },
                    settings:
                        RouteSettings(name: 'context', arguments: context)));
          },
          child: Column(
            children: [
              Text(
                'To',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  '${selectedDestination.short}',
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                '${selectedDestination.townName}',
                style: TextStyle(
                  fontSize: 19,
                  fontFamily: 'Lato',
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                '${selectedDestination.airportName}',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        )
      : InkWell(
          onTap: appState.is2Way
              ? () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) {
                            return DestinationAirportSelector();
                          },
                          settings: RouteSettings(
                              name: 'context', arguments: context)));
                }
              : () {},
          child: Container(
            padding: EdgeInsets.all(20),
            child: Text(
              appState.is2Way ? 'SELECT DESTINATION' : 'ONE WAY SELECTED',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
}

Widget _buildWayButtons(BuildContext context) {
  var appState = Provider.of<ApplicationState>(context);
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      border: Border.all(
        color: Colors.white,
        width: 0.5,
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: appState.is2Way
                  ? BorderRadius.circular(20)
                  : BorderRadius.circular(0),
              color: appState.is2Way ? Colors.white : Colors.transparent,
            ),
            height: 35,
            margin: EdgeInsets.all(10),

            // padding: EdgeInsets.all(10),
            child: TextButton(
              child: Text(
                'Return',
                style: TextStyle(
                  fontSize: 15,
                  color: !appState.is2Way ? Colors.white : Colors.deepPurple,
                ),
              ),
              onPressed: () {
                appState.makeTwoWay();
              },
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: !appState.is2Way
                  ? BorderRadius.circular(20)
                  : BorderRadius.circular(0),
              color: !appState.is2Way ? Colors.white : Colors.transparent,
            ),
            height: 35,
            margin: EdgeInsets.all(10),

            // padding: EdgeInsets.all(10),
            child: TextButton(
              child: Text(
                'One-Way',
                style: TextStyle(
                  fontSize: 15,
                  color: appState.is2Way ? Colors.white : Colors.deepPurple,
                ),
              ),
              onPressed: () {
                appState.makeOneWay();
              },
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildDepartureDateSelector(BuildContext context) {
  var appState = Provider.of<ApplicationState>(context);
  return Expanded(
    child: InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return InitialDateSelector();
        }));
      },
      splashColor: Colors.deepPurple.withOpacity(0.1),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 0.3,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(6),
              child: Text(
                'Departure Date',
                style: TextStyle(
                  letterSpacing: 1.1,
                  fontSize: 15,
                  fontFamily: 'Lato',
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 10,
                  ),
                  child: Text(
                    '${appState.initialDate.day}',
                    style: TextStyle(fontSize: 55, color: Colors.purple[900]),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${months[appState.initialDate.month - 1]}',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Lato',
                        // color: Colors.purple[900],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${days[appState.initialDate.weekday - 1]}',
                      style: TextStyle(
                        fontSize: 18,
                        // color: Colors.purple[900],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildReturnDateSelector(BuildContext context) {
  var appState = Provider.of<ApplicationState>(context);
  return Expanded(
    child: InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ReturnDateSelector();
        }));
      },
      splashColor: Colors.deepPurple.withOpacity(0.1),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 0.3,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(6),
              child: Text(
                'Return Date',
                style: TextStyle(
                  letterSpacing: 1.1,
                  fontSize: 15,
                  fontFamily: 'Lato',
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 10,
                  ),
                  child: Text(
                    '${appState.returnDate.day}',
                    style: TextStyle(fontSize: 55, color: Colors.purple[900]),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${months[appState.returnDate.month - 1]}',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Lato',
                        // color: Colors.purple[900],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${days[appState.returnDate.weekday - 1]}',
                      style: TextStyle(
                        fontSize: 18,
                        // color: Colors.purple[900],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildClassSelector(BuildContext context) {
  var appState = Provider.of<ApplicationState>(context);
  return Expanded(
    child: InkWell(
      onTap: () {
        appState.toggleCabinSelector();
      },
      splashColor: Colors.deepPurple.withOpacity(0.1),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 0.3,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cabin Class',
              style: TextStyle(
                fontSize: 17,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '${appState.selectedCabin}',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildChoosePassengersSelector(BuildContext context) {
  var appState = Provider.of<ApplicationState>(context);
  return Expanded(
    child: InkWell(
      onTap: () {
        appState.togglePassengersSelector();
      },
      splashColor: Colors.deepPurple.withOpacity(0.1),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 0.3,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Passenger',
              style: TextStyle(
                fontSize: 17,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 18,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('${appState.passengers['adults']}'),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.pregnant_woman,
                      size: 18,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('${appState.passengers['children']}'),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.child_friendly,
                      size: 18,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('${appState.passengers['infants']}'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
