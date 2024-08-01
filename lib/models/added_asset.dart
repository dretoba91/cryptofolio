class AddedAsset {
  String? name;
  double? amount;
  double? usdValue;

  AddedAsset({
    this.name,
    this.amount,
    this.usdValue,
  });

  AddedAsset.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amount = json['amount'];
    usdValue = json['usdValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['amount'] = amount;
    data['usdValue'] = usdValue;
    return data;
  }
}
