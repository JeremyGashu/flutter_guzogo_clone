// accumulating states in one provider is not a good idea but for this app i want you to see
//only how the page interacts

import 'package:flutter/material.dart';
import 'package:flutter_guzogo/models/airport_model.dart';

List<String> months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];
List<String> days = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday',
];

class ApplicationState extends ChangeNotifier {
  bool cabinSelectorCollapsed = true;
  bool passengersSelectorCollapsed = true;
  String selectedCabin = 'Economy';
  bool isSearching = false;
  DateTime initialDate = DateTime.now();
  DateTime returnDate = DateTime.now().add(Duration(days: 5));
  bool is2Way = true;
  List<Airport> searchResult = [];
  Airport selectedInitialAirport = Airport(
      id: 1,
      short: 'ADD',
      airportName: "Addis Ababa International Airport",
      townName: 'Addis Ababa');
  Airport selectedDestinationAirport;

  String searchString = '';
  Map<String, int> passengers = {'adults': 1, 'children': 0, 'infants': 0};
  List<Airport> airports = [
    Airport(
        id: 1,
        short: 'ADD',
        airportName: "Addis Ababa International Airport",
        townName: 'Addis Ababa'),
    Airport(
      id: 2,
      short: 'ABV',
      airportName: 'Abuja International Airport',
      townName: 'Abuja',
    ),
    Airport(
      id: 3,
      short: 'MMB',
      townName: 'Mombasa',
      airportName: 'Mombasa International Airport',
    ),
    Airport(
      id: 4,
      short: 'JBV',
      airportName: 'Johansburg International Airport',
      townName: 'Jhansburg',
    ),
    Airport(
      id: 5,
      short: 'MBV',
      airportName: 'Mali International Airport',
      townName: 'Mali',
    ),
    Airport(
      id: 6,
      short: 'SML',
      airportName: 'Mogadishu International Airport',
      townName: 'Somalia',
    ),
    Airport(
      id: 7,
      short: 'DRS',
      townName: 'Dare sa lam',
      airportName: 'Dare Salam International Airport',
    ),
    Airport(
      id: 8,
      short: 'KIA',
      townName: 'Khartoum',
      airportName: 'Khartoum International Airport',
    ),
  ];

  void setSearchString(String val) {
    if (val != '') {
      this.searchString = val;
      List<Airport> _filtered = [];
      for (int i = 0; i < this.airports.length; i++) {
        if (this
            .airports[i]
            .airportName
            .contains(RegExp(val, caseSensitive: false))) {
          _filtered.add(this.airports[i]);
        }
      }
      this.searchResult = _filtered;
      notifyListeners();
    }
  }

  void changeIsSearching(bool val) {
    this.isSearching = val;
    if (this.isSearching == false) {
      this.searchResult = [];
    }
    notifyListeners();
  }

  void toggleCabinSelector() {
    this.cabinSelectorCollapsed = !this.cabinSelectorCollapsed;
    notifyListeners();
  }

  void togglePassengersSelector() {
    this.passengersSelectorCollapsed = !this.passengersSelectorCollapsed;
    notifyListeners();
  }

  void changePassengers(
      {@required PassengerTypes type, @required OperationType opType}) {
    switch (type) {
      case PassengerTypes.ADULT:
        if (opType == OperationType.increment &&
            this.passengers['adults'] < 7) {
          this.passengers['adults'] = this.passengers['adults'] + 1;
        } else if (opType == OperationType.decrement &&
            this.passengers['adults'] > 1) {
          this.passengers['adults'] = this.passengers['adults'] - 1;
        }
        break;
      case PassengerTypes.CHILDREN:
        if (opType == OperationType.increment &&
            this.passengers['children'] < 2) {
          this.passengers['children'] = this.passengers['children'] + 1;
        } else if (opType == OperationType.decrement &&
            this.passengers['children'] > 0) {
          this.passengers['children'] = this.passengers['children'] - 1;
        }
        break;
      case PassengerTypes.INFANT:
        if (opType == OperationType.increment &&
            this.passengers['infants'] < 2) {
          this.passengers['infants'] = this.passengers['infants'] + 1;
        } else if (opType == OperationType.decrement &&
            this.passengers['infants'] > 0) {
          this.passengers['infants'] = this.passengers['infants'] - 1;
        }
        break;
    }
    notifyListeners();
  }

  void setSelectedInitialAirport(int id) {
    for (int i = 0; i < airports.length; i++) {
      if (airports[i].id == id) {
        this.selectedInitialAirport = airports[i];
        notifyListeners();
      }
    }
  }

  void selectAirport(String type, int id) {
    if (type == 'initial') {
      for (int i = 0; i < airports.length; i++) {
        if (airports[i].id == id) {
          this.selectedInitialAirport = airports[i];
          notifyListeners();
        }
      }
    } else if (type == 'destination') {
      for (int i = 0; i < airports.length; i++) {
        if (airports[i].id == id) {
          this.selectedDestinationAirport = airports[i];
          notifyListeners();
        }
      }
    }
  }

  void setSelectedCabin(String cabin) {
    this.selectedCabin = cabin;
    this.notifyListeners();
  }

  void setSelectedDestinationAirport(int id) {
    for (int i = 0; i < airports.length; i++) {
      if (airports[i].id == id) {
        this.selectedDestinationAirport = airports[i];
        notifyListeners();
      }
    }
  }

  void setInitialDate(DateTime time) {
    if (DateTime.now().compareTo(time) <= 0) {
      this.initialDate = time;
      notifyListeners();
    }
  }

  void setReturnDate(DateTime time) {
    if (this.initialDate.compareTo(time) <= -1) {
      this.returnDate = time;
      notifyListeners();
    }
  }

  void makeTwoWay() {
    this.is2Way = true;
    notifyListeners();
  }

  void makeOneWay() {
    this.is2Way = false;
    notifyListeners();
  }
}

enum OperationType { increment, decrement }
enum PassengerTypes { ADULT, CHILDREN, INFANT }
