import 'package:get/get.dart';
import 'package:tiki_clone/app/data/model/category.dart';
import 'package:tiki_clone/app/data/repository.dart';

class CategoryController extends GetxController {
  static CategoryController get to => Get.find();

  Repository _repository = Repository();

  var listCategory = new List().obs;
  var currentCategoryId = 0.obs;

  @override
  void onInit() {
    super.onInit();
    print("CategoryController init");
    _getListCategory();
  }

  @override
  void onReady() {
    super.onReady();
    print("CategoryController onReady");
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> _getListCategory() async {
    print("_getListCategory");
    listCategory.clear();
    List<Category> mList = await _repository.getListCategory(GetPlatform.isAndroid ? "android" : "ios");
    listCategory.addAll(mList);
    print("_getListCategory SIZE ${mList.length}");

    if (listCategory.length > 0) {
      Category current = listCategory[0];
      setCurrentCategory(current.id);
    }
  }

  void setCurrentCategory(int id) {
    currentCategoryId.value = id;
  }
}
