import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../../models/models.dart';

const String fullNameColumn = "fullName";
const String emailColumn = "email";
const String addressColumn = "address";
const String cityColumn = "city";
const String countryColumn = "country";
const String zipCodeColumn = "zipCode";
const String cartItemsColumn = "cartItems";
const String subtotalColumn = "subtotal";
const String deliveryFeeColumn = "deliveryFee";
const String totalColumn = "total";
const String phoneNumberColumn = "phoneNumber";
const String addressDetailsColumn = "addressDetails";

class Checkout extends Equatable {
  final String fullName;
  final String email;
  final AddressDetails addressDetails;
  final List<CartItem> cartItems;
  final String subtotal;
  final String deliveryFee;
  final String total;

  const Checkout({
    required this.fullName,
    required this.email,
    required this.addressDetails,
    required this.cartItems,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
  });

  factory Checkout.fromJson(String str) =>
      Checkout.fromMap(json.decode(str) as Map<String, dynamic>);
  String toJson() => json.encode(toMap());

  factory Checkout.fromMap(Map<String, dynamic> json) => Checkout(
        fullName: (json[fullNameColumn] ?? "") as String,
        email: (json[emailColumn] ?? "") as String,
        addressDetails:
            (json[addressDetailsColumn] ?? Object()) as AddressDetails,
        cartItems: List<CartItem>.from((json[cartItemsColumn] ?? []) as List),
        subtotal: (json[subtotalColumn] ?? "") as String,
        deliveryFee: (json[deliveryFeeColumn] ?? "") as String,
        total: (json[totalColumn] ?? "") as String,
      );

  factory Checkout.fromDocumentSnapshot(DocumentSnapshot doc) {
    final Map<String, dynamic> data;
    if (doc.data() != null) {
      data = doc.data()! as Map<String, dynamic>;
    } else {
      data = <String, dynamic>{};
    }
    return Checkout.fromMap(data);
  }

  Map<String, dynamic> toMap() => {
        fullNameColumn: fullName,
        addressDetailsColumn: addressDetails.toMap(),
        cartItemsColumn: cartItems.map((cartItem) => cartItem.toMap()).toList(),
        subtotalColumn: subtotal,
        deliveryFeeColumn: deliveryFee,
        totalColumn: total,
      };

  Checkout copyWith({
    String? fullName,
    String? email,
    List<CartItem>? cartItems,
    String? subtotal,
    String? deliveryFee,
    String? total,
    String? address,
    String? city,
    String? country,
    String? phoneNumber,
    String? zipCode,
  }) =>
      Checkout(
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        addressDetails: addressDetails.copyWith(
          address: address ?? (addressDetails.address),
          city: city ?? (addressDetails.city),
          country: country ?? (addressDetails.country),
          phoneNumber: phoneNumber ?? (addressDetails.phoneNumber),
          zipCode: zipCode ?? (addressDetails.zipCode),
        ),
        cartItems: cartItems ?? this.cartItems,
        subtotal: subtotal ?? this.subtotal,
        deliveryFee: deliveryFee ?? this.deliveryFee,
        total: total ?? this.total,
      );

  @override
  List<Object> get props => [
        fullName,
        email,
        addressDetails,
        cartItems,
        subtotal,
        deliveryFee,
        total,
      ];
}

class AddressDetails extends Equatable {
  final String address;
  final String city;
  final String country;
  final String zipCode;
  final String phoneNumber;

  const AddressDetails({
    required this.phoneNumber,
    required this.address,
    required this.city,
    required this.country,
    required this.zipCode,
  });

  factory AddressDetails.fromJson(String str) =>
      AddressDetails.fromMap(json.decode(str) as Map<String, dynamic>);
  String toJson() => json.encode(toMap());

  factory AddressDetails.fromMap(Map<String, dynamic> json) => AddressDetails(
        phoneNumber: (json[phoneNumberColumn] ?? "") as String,
        address: (json[addressColumn] ?? "") as String,
        city: (json[cityColumn] ?? "") as String,
        country: (json[countryColumn] ?? "") as String,
        zipCode: (json[zipCodeColumn] ?? "") as String,
      );

  factory AddressDetails.fromDocumentSnapshot(DocumentSnapshot doc) {
    final Map<String, dynamic> data;
    if (doc.data() != null) {
      data = doc.data()! as Map<String, dynamic>;
    } else {
      data = <String, dynamic>{};
    }
    return AddressDetails.fromMap(data);
  }

  Map<String, dynamic> toMap() => {
        phoneNumberColumn: phoneNumber,
        addressColumn: address,
        cityColumn: city,
        countryColumn: country,
        zipCodeColumn: zipCode,
      };

  AddressDetails copyWith({
    String? phoneNumber,
    String? address,
    String? city,
    String? country,
    String? zipCode,
  }) =>
      AddressDetails(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        address: address ?? this.address,
        city: city ?? this.city,
        country: country ?? this.country,
        zipCode: zipCode ?? this.zipCode,
      );

  @override
  List<Object> get props => [
        phoneNumber,
        address,
        city,
        country,
        zipCode,
      ];
}
