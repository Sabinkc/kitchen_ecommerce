class AddressItemModel {
  final String place;
  final String completeAddress;
  final String floor;
  final String landmark;

  AddressItemModel({
    required this.place,
    required this.floor,
    required this.landmark,
    required this.completeAddress,
  });

  @override
  String toString() {
    return 'AddressItemModel('
        '  place: $place,'
        '  floor: $floor,'
        '  landmark: $landmark,'
        '  completeAddress: $completeAddress'
        ')';
  }
}
