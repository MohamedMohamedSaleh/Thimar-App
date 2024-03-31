class CartData {

  late final List<CartModel> list;
  late final int totalPriceBeforeDiscount;
  late final int totalDiscount;
  late final int totalPriceWithVat;
  late final int deliveryCost;
  late final int freeDeliveryPrice;
  late final double vat;
  late final int isVip;
  late final int vipDiscountPercentage;
  late final int minVipPrice;
  late final String vipMessage;
  late final String status;
  late final String message;
  
  CartData.fromJson(Map<String, dynamic> json){
    list = List.from(json['data']).map((e)=>CartModel.fromJson(e)).toList();
    totalPriceBeforeDiscount = json['total_price_before_discount'];
    totalDiscount = int.tryParse((json['total_discount']).toString())?.truncate()?? 0;
    totalPriceWithVat = int.tryParse(json['total_price_with_vat'].toString())?? 0;
    deliveryCost = json['delivery_cost'];
    freeDeliveryPrice = json['free_delivery_price'];
    vat = json['vat'];
    isVip = json['is_vip'];
    vipDiscountPercentage = json['vip_discount_percentage'];
    minVipPrice = json['min_vip_price'];
    vipMessage = json['vip_message'];
    status = json['status'];
    message = json['message'];
  }

}

class CartModel {

  late final int id;
  late final String title;
  late final String image;
  late  int amount;
  late final int priceBeforeDiscount;
  late final int discount;
  late final double price;
  late final int remainingAmount;
  
  CartModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    image = json['image'];
    amount = json['amount'];
    priceBeforeDiscount = json['price_before_discount'];
    discount = json['discount'];
    price = double.tryParse(json['price'].toString())??0;
    // price = int.tryParse(json['price'].toString())?.truncate()?? 0;
    remainingAmount = json['remaining_amount'];
  }

}

class AddProductData {

  late final String status;
  late final String message;
  late final Data data;
  
  AddProductData.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }


}

class Data {

  late final String title;
  late final String image;
  late final int amount;
  late final int deliveryCost;
  late final int price;
  
  Data.fromJson(Map<String, dynamic> json){
    title = json['title'];
    image = json['image'];
    amount = json['amount'];
    deliveryCost = json['delivery_cost'];
    price = int.tryParse(json['price'].toString())?? 0;
  }


}