import 'package:flutter/material.dart';
import 'package:flutter_guzogo/providers/state_provider.dart';
import 'package:provider/provider.dart';

class DestinationAirportSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<ApplicationState>(context);
    // print(ModalRoute.of(context).settings.arguments);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 13,
                    ),
                    Expanded(
                      child: Text(
                        'Select Airport',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    onChanged: (text) {
                      print("First text field: $text");
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: Text(
                    'Direct Airports',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  height: 500,
                  child: ListView.builder(
                    itemCount: appState.airports.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          onTap: () {
                            appState.setSelectedDestinationAirport(index + 1);
                            Navigator.pop(context);
                          },
                          leading: Icon(Icons.airplanemode_active_rounded),
                          title: Text(
                              '${appState.airports[index].townName}, ${appState.airports[index].airportName}'),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
