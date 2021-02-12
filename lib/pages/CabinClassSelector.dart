import 'package:flutter/material.dart';
import 'package:flutter_guzogo/providers/state_provider.dart';
import 'package:provider/provider.dart';

class CabinClassSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var selectedCabin = Provider.of<ApplicationState>(context).selectedCabin;
    return SafeArea(
      child: Container(
        color: Colors.white,
        height: 300,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    'Cabin Class',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Provider.of<ApplicationState>(context, listen: false)
                          .toggleCabinSelector();
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
                ),
              ],
            ),
            Column(
              children: [
                ListTile(
                  onTap: () {
                    Provider.of<ApplicationState>(context, listen: false)
                        .setSelectedCabin('Economy');
                  },
                  title: Text('Economy'),
                  selected: selectedCabin == 'Economy',
                  trailing: selectedCabin == 'Economy'
                      ? Icon(
                          Icons.check,
                        )
                      : null,
                ),
                Divider(
                  height: 1,
                ),
                ListTile(
                  selected: selectedCabin == 'Business',
                  onTap: () {
                    Provider.of<ApplicationState>(context, listen: false)
                        .setSelectedCabin('Business');
                  },
                  title: Text('Business'),
                  trailing: selectedCabin == 'Business'
                      ? Icon(
                          Icons.check,
                        )
                      : null,
                ),
                Divider(
                  height: 1,
                ),
                ListTile(
                  selected: selectedCabin == 'First',
                  onTap: () {
                    Provider.of<ApplicationState>(context, listen: false)
                        .setSelectedCabin('First');
                  },
                  title: Text('First'),
                  trailing: selectedCabin == 'First'
                      ? Icon(
                          Icons.check,
                        )
                      : null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
