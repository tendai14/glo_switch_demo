class UserModel {
  String? user;
  String? balance;
  String? name;
  String? symbol;
  String? type;

  UserModel({
    this.user,
    this.balance,
    this.name,
    this.symbol,
    this.type,
  });

  UserModel copyWith({
    String? user,
    String? balance,
    String? name,
    String? symbol,
    String? type,
  }) =>
      UserModel(
        user: user ?? this.user,
        balance: balance ?? this.balance,
        name: name ?? this.name,
        symbol: symbol ?? this.symbol,
        type: type ?? this.type,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      user: json["user"],
      balance: json["balance"],
      name: json["name"],
      symbol: json["symbol"],
      type: json["type"]);

  Map<String, dynamic> toJson() => {
        "user": user,
        "balance": balance,
        "name": name,
        "symbol": symbol,
        "type": type
      };
}
