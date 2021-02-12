import 'package:flutter/material.dart';
import 'package:flutter_guzogo/providers/state_provider.dart';
import 'package:provider/provider.dart';

class PassengerType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<ApplicationState>(context);
    return SafeArea(
      child: Container(
        color: Colors.white,
        height: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 15,
                ),
                Flexible(
                  flex: 2,
                  child: Text(
                    'Passengers',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Flexible(
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Provider.of<ApplicationState>(context, listen: false)
                              .togglePassengersSelector();
                        },
                        child: Text(
                          'Done',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ListTile(
                  title: Text('Adult'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            Provider.of<ApplicationState>(context,
                                    listen: false)
                                .changePassengers(
                                    type: PassengerTypes.ADULT,
                                    opType: OperationType.decrement);
                          },
                          child: Icon(
                            Icons.remove,
                          ),
                        ),
                      ),
                      Text("${appState.passengers['adults']}"),
                      Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            Provider.of<ApplicationState>(context,
                                    listen: false)
                                .changePassengers(
                                    type: PassengerTypes.ADULT,
                                    opType: OperationType.increment);
                          },
                          child: Icon(
                            Icons.add,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                ),
                ListTile(
                  title: Text('Children'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            Provider.of<ApplicationState>(context,
                                    listen: false)
                                .changePassengers(
                                    type: PassengerTypes.CHILDREN,
                                    opType: OperationType.decrement);
                          },
                          child: Icon(
                            Icons.remove,
                          ),
                        ),
                      ),
                      Text("${appState.passengers['children']}"),
                      Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            Provider.of<ApplicationState>(context,
                                    listen: false)
                                .changePassengers(
                                    type: PassengerTypes.CHILDREN,
                                    opType: OperationType.increment);
                          },
                          child: Icon(
                            Icons.add,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                ),
                ListTile(
                  title: Text('Infants'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            Provider.of<ApplicationState>(context,
                                    listen: false)
                                .changePassengers(
                                    type: PassengerTypes.INFANT,
                                    opType: OperationType.decrement);
                          },
                          child: Icon(
                            Icons.remove,
                          ),
                        ),
                      ),
                      Text("${appState.passengers['infants']}"),
                      Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            Provider.of<ApplicationState>(context,
                                    listen: false)
                                .changePassengers(
                                    type: PassengerTypes.INFANT,
                                    opType: OperationType.increment);
                          },
                          child: Icon(
                            Icons.add,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
