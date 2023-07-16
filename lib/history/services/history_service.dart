import 'package:road_runner_rider/shared/shared.dart';

import '../models/models.dart';

class HistoryService {
  List<HistoryModel> mockHistories() {
    List<HistoryModel> _history = [
      HistoryModel(
        order: OrderModel(
          package: PackageModel(
            dropOffs: List.generate(
                4,
                (index) => DropOffsModel(
                    dropOffLocation: LocationModel(address: 'Obasonjo road'),
                    category: 'category',
                    priority: 'High',
                    recipientName: 'Bags',
                    recipientPhone: '070')),
            pickUpLocation: LocationModel(address: 'Isa Kaita'),
          ),
          user: null,
          driver: DriverModel(
              carColor: '',
              rides: 3,
              name: 'Musa Damu',
              phoneNumber: '',
              location: LocationModel(address: 'Isa Kaita'),
              carName: '',
              rating: 3.2,
              vendor: 'GIG',
              image: '',
              carNumber: ''),
        ),
      ),
      HistoryModel(
        order: OrderModel(
          package: PackageModel(
            dropOffs: List.generate(
                4,
                (index) => DropOffsModel(
                    dropOffLocation: LocationModel(address: 'Isa Kaita road'),
                    category: 'category',
                    priority: 'High',
                    recipientName: 'Bags',
                    recipientPhone: '070')),
            pickUpLocation: LocationModel(address: 'Isa Kaita'),
          ),
          user: null,
          driver: DriverModel(
              carColor: '',
              rides: 3,
              name: 'Aminu Kam',
              phoneNumber: '',
              location: LocationModel(address: 'Isa Kaita'),
              carName: '',
              rating: 3.2,
              vendor: 'GIG',
              image: '',
              carNumber: ''),
        ),
      ),
      HistoryModel(
        order: OrderModel(
          package: PackageModel(
            dropOffs: List.generate(
                4,
                (index) => DropOffsModel(
                    dropOffLocation: LocationModel(address: 'Obasonjo road'),
                    category: 'category',
                    priority: 'High',
                    recipientName: 'Bags',
                    recipientPhone: '070')),
            pickUpLocation: LocationModel(address: 'Isa Kaita'),
          ),
          user: null,
          driver: DriverModel(
              carColor: '',
              rides: 3,
              name: 'Musa Damu',
              phoneNumber: '',
              location: LocationModel(address: 'Unguwar rimi'),
              carName: '',
              rating: 3.2,
              vendor: 'GIG',
              image: '',
              carNumber: ''),
        ),
      ),
    ];
    return _history;
  }
}
