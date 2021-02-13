import 'package:flutter/material.dart';
import 'package:flutter_guzogo/providers/state_provider.dart';
import 'package:provider/provider.dart';

class InitialAirportSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<ApplicationState>(context);
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
                      if (text != '') {
                        appState.changeIsSearching(true);
                        appState.setSearchString(text);
                      } else {
                        appState.changeIsSearching(false);
                        appState.setSearchString('');
                      }
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
                  child: appState.isSearching &&
                          (appState.searchResult.length == 0)
                      ? Container(
                          margin: EdgeInsets.all(30),
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'No Airport Found!',
                            style: TextStyle(
                              fontSize: 35,
                              fontFamily: 'Lato',
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: !appState.isSearching
                              ? appState.airports.length
                              : appState.searchResult.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: ListTile(
                                onTap: () {
                                  appState.setSelectedInitialAirport(
                                      appState.isSearching
                                          ? appState.searchResult[index].id
                                          : appState.airports[index].id);
                                  appState.setSearchString('');
                                  appState.changeIsSearching(false);
                                  Navigator.pop(context);
                                },
                                leading:
                                    Icon(Icons.airplanemode_active_rounded),
                                title: Text(
                                  !appState.isSearching
                                      ? '${appState.airports[index].townName}, ${appState.airports[index].airportName}'
                                      : '${appState.searchResult[index].townName}, ${appState.searchResult[index].airportName}',
                                ),
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
