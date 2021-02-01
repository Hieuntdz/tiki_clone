import 'dart:async';

import 'package:get/get.dart';
import 'package:tiki_clone/app/data/model/deal/deal_data.dart';
import 'package:tiki_clone/app/data/model/deal/time_data.dart';
import 'package:tiki_clone/app/data/model/deal/today_deal_response.dart';
import 'package:tiki_clone/app/data/model/shock_price/filters.dart';
import 'package:tiki_clone/app/data/repository.dart';
import 'package:tiki_clone/app/modules/main/controllers/category_controller.dart';
import 'package:tiki_clone/app/utils/logger.dart';
import 'package:tiki_clone/app/utils/utils.dart';

class TodayDealController extends GetxController {

  Repository _repository = Repository();

  @override
  onInit() {
    super.onInit();
    Logger.info("begin");
    _initData();
  }

  @override
  void onReady() {
    super.onReady();
    Logger.info("begin");
  }

  @override
  void onClose() {
    super.onClose();
    Logger.info("begin");
    _timer.cancel();
  }

  _initData() {
    _getDealResponse();
  }

  /// Timmer đếm time hiện tại

  Timer _timer;

  void _startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        _currentTime.value = DateTime.now().millisecondsSinceEpoch;
      },
    );
  }

  var _currentTime = DateTime.now().millisecondsSinceEpoch.obs;

  int get currentTime => _currentTime.value;

  var _posTimeSelected = 0.obs;

  int get posTimeSelected => _posTimeSelected.value;

  void setPosTimeSelected(int pos) {
    Logger.debug("setPosTimeSelected $pos");
    this._posTimeSelected.value = pos;
  }

  var _listTimeValue = <TimeValues>[].obs;

  List<TimeValues> get listTimeValue => _listTimeValue.toList();

  Future<void> _getDealResponse() async {
    TodayDealResponse todayDealResponse =
        await _repository.getTodayDealResponse(Utils.getPlatform);

    if (todayDealResponse == null) {
      return;
    }

    resetListDealData(todayDealResponse.data);

    Filters filters = todayDealResponse.filters;

    if (filters != null && filters.times != null) {
      _listTimeValue.addAll(filters.times.values);
      _startTimer();
      Logger.debug("_listTimeValue Size ${_listTimeValue.length}");
    }
    if (filters != null && filters.tags != null) {
      _listTag.addAll(filters.tags.values);
    }
  }

  /// Tag
  var _listTag = <TagValues>[].obs;

  List<TagValues> get listTag => _listTag.toList();

  var _posTagSelected = 0.obs;

  int get posTagSelected => _posTagSelected.value;

  /// content

  var _listDealData = <DealData>[].obs;

  List<DealData> get listDealData => _listDealData.toList();

  void resetListDealData(List<DealData> data){
    this._listDealData.clear();
    this._listDealData.addAll(data);
  }

  void updateListDealData(List<DealData> data){
    this._listDealData.addAll(data);
  }
}
