import 'package:kitchen_ecommerce/features/settings/model/address_item_model.dart';

final List<String> places = ["Home", "Work", "Friend", "Other"];

final List<AddressItemModel> addresses = [
  AddressItemModel(
    place: "Home",
    floor: "First Floor",
    landmark: "Shankhamul School",
    completeAddress: "Kathmandu, Shankhamul chowk 7777",
  ),
  AddressItemModel(
    place: "Work",
    floor: "Second Floor",
    landmark: "Budhanagar Futsal",
    completeAddress: "Kathmandu, Budhanagar 5678",
  ),
  AddressItemModel(
    place: "Other",
    floor: "First Floor",
    landmark: "Himalayan White House",
    completeAddress: "Kathmandu, Tinkune 0896",
  ),
];
