import 'dart:math';

import '../../shared/models/models.dart';

class PackageOrderService {
  List<LocationModel> addDropOffLocation(LocationModel dropOffLocation) {
    //use location service to acquire Location
    List<LocationModel> _dropOffLocations = [];
    _dropOffLocations.add(dropOffLocation);
    return _dropOffLocations;
  }

  //
  PackageModel createPackageOrder(
      {required List<DropOffsModel> dropOffs,
        required LocationModel pickUpLocation}) {
    dropOffs.map((e) => {});
    final PackageModel newPackageOrder = PackageModel(
      pickUpLocation: pickUpLocation,
      dropOffs: dropOffs,
    );
    return newPackageOrder;
  }

  List<PackageModel> getMockPackages() {
    List<PackageModel> _packages = <PackageModel>[
      PackageModel(
          dropOffs: List.generate(
              2,
                  (index) => DropOffsModel(
                  dropOffLocation: LocationModel(address: 'Abeku street'),
                  category: 'Large',
                  priority: 'High',
                  recipientName: 'Musa',
                  recipientPhone: '0701311322')),
          pickUpLocation: LocationModel(address: 'Samiu')),
      PackageModel(
          dropOffs: List.generate(
              1,
                  (index) => DropOffsModel(
                  dropOffLocation: LocationModel(address: 'Anansi street'),
                  category: 'small',
                  priority: 'Low',
                  recipientName: 'Musa Damu',
                  recipientPhone: '0701311322')),
          pickUpLocation: LocationModel(address: 'gobarao road')),
      PackageModel(
          dropOffs: List.generate(
              3,
                  (index) => DropOffsModel(
                  dropOffLocation: LocationModel(address: 'Anansi street'),
                  category: 'small',
                  priority: 'Low',
                  recipientName: 'Musa Damu',
                  recipientPhone: '0701311322')),
          pickUpLocation: LocationModel(address: 'gobarao road')),
    ];
    return _packages;
  }

  List<DriverModel> getMockDrivers() {
    //mock a json later before api
    List<DriverModel> _drivers = <DriverModel>[
      DriverModel(
        name: 'Musa Damu',
        image: 'image',
        phoneNumber: '+234701311255',
        vendor: 'Road Runner',
        rating: 4.5,
        rides: 200,
        carName: 'TVS Raider 2021',
        carNumber: 'ABJ-32-44T',
        carColor: 'Green',
        location: LocationModel(address: '', latitude: 14.0, longitude: 12.3),
      ),
      DriverModel(
        name: 'Simon Sais',
        image: 'image',
        phoneNumber: '+23481034982',
        vendor: 'GIG',
        rating: 3.5,
        rides: 25,
        carName: 'Toyota Corolla S',
        carNumber: 'KDN-32-44T',
        carColor: 'Blue',
        location: LocationModel(address: '', longitude: 12.5, latitude: 13.2),
      ),
      DriverModel(
        name: 'Al-Amin Bashir',
        image: 'image',
        phoneNumber: '+23481034982',
        vendor: 'Mira',
        rating: 4,
        rides: 50,
        carName: 'Toyota Corolla S',
        carNumber: 'GT-32-44T',
        carColor: 'Blue',
        location: LocationModel(address: '', latitude: 10.9, longitude: 12.4),
      ),
      DriverModel(
        name: 'Kahinde Kasimu',
        image: 'image',
        phoneNumber: '+23481034982',
        vendor: 'Road Runner',
        rating: 4,
        rides: 50,
        carName: 'Toyota Corolla S',
        carNumber: 'GT-32-44T',
        carColor: 'Blue',
        location: LocationModel(address: '', latitude: 13.9, longitude: 2.4),
      ),
      DriverModel(
        name: 'Al-Amin Bashir',
        image: 'image',
        phoneNumber: '+23481034982',
        vendor: 'Mira',
        rating: 4,
        rides: 50,
        carName: 'Toyota Corolla S',
        carNumber: 'GT-32-44T',
        carColor: 'Blue',
        location: LocationModel(address: '', latitude: 14.2, longitude: 12.2),
      ),
      DriverModel(
        name: 'Simon Sais',
        image: 'image',
        phoneNumber: '+23481034982',
        vendor: 'GIG',
        rating: 3.5,
        rides: 25,
        carName: 'Toyota Corolla S',
        carNumber: 'KDN-32-44T',
        carColor: 'Blue',
        location: LocationModel(address: '', latitude: 14.1, longitude: 12.3),
      ),
    ];
    return _drivers;
  }

  double calculateDistance(
      {required LocationModel start, required LocationModel stop}) {
    const p = 0.017453292519943295;
    const c = cos;
    final a = 0.5 -
        c((stop.latitude - start.latitude) * p) / 2 +
        c(start.latitude * p) *
            c(stop.latitude * p) *
            (1 - c((stop.longitude - start.longitude) * p)) /
            2;
    return 12742 * asin(sqrt(a));
  }

  String calculateTime(double distance) {
    // int minutes = (distance / 0.000621371).round();

    int minutes = (distance / 0.1).round();
    int hours = (minutes / 60).floor();
    int days = (hours / 24).floor();
    int weeks = (days / 7).floor();
    int months = (weeks / 4).floor();
    int years = (months / 12).floor();
    if (years > 0) {
      return '$years years';
    } else if (months > 0) {
      return '$months months';
    } else if (weeks > 0) {
      return '$weeks weeks';
    } else if (days > 0) {
      return '$days days';
    } else if (hours > 0) {
      return '$hours hours';
    } else if (minutes > 0) {
      return '$minutes minutes';
    } else {
      return '$minutes minutes';
    }
  }

  double calculateTripEstimate(double distance) {
    //money per km
    var moneyPerKm = 100.0;
    //distance in km
    //calculate money to pay
    var moneyToPay = moneyPerKm * distance;
    //print money to pay
    return moneyToPay;
  }
}
