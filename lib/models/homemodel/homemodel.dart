
class HomeModel {
  late String date;
  late String reco;
  late String segment;
  late String stkName;
  late String cmp;
  late String entryRange;
  late String stopLoss;
  late String target1;
  late String target2;
  late String status;
  late String closePrice;
  late String closeDate;
  late String duration;
  late String suggExpo;
  late String timeFrame;
  late String gainLoss;
  late String valWtGainLoss;
  late String closeData;
  late String currentStatus;
  HomeModel({
    this.date="Date",
    this.reco="RECO",
    this.segment="SEGMENT",
    this.stkName="STOCKNAME",
    this.cmp="1",
    this.entryRange="1550-1660",
    this.stopLoss="1",
    this.target1="1",
    this.target2="1",
    this.status="1",
    this.closePrice="1630",
    this.closeDate="2022-12-4",
    this.duration="1",
    this.suggExpo="_",
    this.timeFrame="IntraDay",
    this.gainLoss='1',
    this.valWtGainLoss="_",
    this.currentStatus="CURR",
    this.closeData="CLODATA"
  });

  factory HomeModel.fromMap(Map json) {
    return HomeModel(
      date: json['date'],
      reco: json['reco'],
      segment: json['segment'],
      stkName: json['stock_name'],
      cmp: json['cmp'],
      entryRange: json['entry_range'],
      stopLoss: json['stoploss'],
      target1: json['target1'],
      target2: json['target2'],
      status: json['status'],
      closePrice: json['close_price'],
      closeDate: json['close_date'],
      duration: json['duration'],
      suggExpo: json['suggested_exposure'],
      timeFrame: json['time_frame'],
      gainLoss: json['gain_loss'],
      valWtGainLoss: json['valuewise_gain_loss'],
      currentStatus: json['current_status'],
      closeData: json['close_date']
    );
  }

}
