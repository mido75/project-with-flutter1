class CheckoutModel {
   String? street1, city, state, country, phone, totalPrice, date,street2;
  CheckoutModel({
    required this.street1,
    required this.street2,
    required this.city,
    required this.state,
    required this.country,
    required this.phone,
    required this.totalPrice,
    required this.date,
  });

  CheckoutModel.fromJson(Map<dynamic, dynamic> map) {
    street1 = map['street1'];
    street2 = map['street2'];
    city = map['city'];
    state = map['state'];
    country = map['country'];
    phone = map['phone'];
    totalPrice = map['totalPrice'];
    date = map['date'];
  }

  toJson() {
    return {
      'street1': street1,
      'street2': street2,
      'city': city,
      'state': state,
      'country': country,
      'phone': phone,
      'totalPrice': totalPrice,
      'date': date,
    };
  }
}
