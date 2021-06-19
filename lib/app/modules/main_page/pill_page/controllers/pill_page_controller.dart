import 'package:get/get.dart';
import 'package:vaitality/app/data/models/pill_item_model.dart';
import 'package:vaitality/app/widgets/page/pill_page/addnew_pill_widget.dart';

class PillPageController extends GetxController {
  RxBool addTaped = false.obs, isEdit = false.obs;
  RxList<PillItemModel> pillItemModels = RxList();
  RxList<bool> checkedPills = RxList();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    _addPills();
  }
  _addPills(){
    List<PillItemModel> pills = [];
    pills.add(PillItemModel("Лизиноприл-Вертекс", "1 таблетка во время еды утром", true));
    pills.add(PillItemModel("Моксарел", "1 таблетка во время еды утром", true));
    pills.add(PillItemModel("Моксарел", "1 таблетка во время еды в обед", false));
    pills.add(PillItemModel("Моксарел", "1 таблетка во время еды вечером", false));
    pills.add(PillItemModel("Лизиноприл-Вертекс", "1 таблетка во время еды вечером", false));
    pillItemModels.value = pills;
    checkedPills.value = pills.map((e) => false).toList();
  }

  pillPressed(int index){
    if(isEdit.value){
      checkedPills[index] = !checkedPills[index];
    }
  }

  addTap(){
    Get.bottomSheet(AddNewPillWidget(), isScrollControlled: true);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
