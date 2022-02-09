class SectrolModel{
  late String sector;
  late String stocks;
  late String upside;
  late String timestamp;
  late String currentStatus;

  SectrolModel({
   this.currentStatus="CURRSTAT",
   this.sector="STOCK",
   this.stocks="STOK",
   this.timestamp="TIME",
   this.upside="UPSIDE"
});

  factory SectrolModel.fromMap(Map json) {
    return SectrolModel(
      sector: json['sector'],
      stocks: json['stocks'],
      upside: json['upside'],
      timestamp: json['timestamp'],
      currentStatus: json['current_status']
    );
  }
}