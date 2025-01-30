part of 'category_controller.dart';

void implementDeleteCategory({
  required int categoryId,
}) async {
  loadingDialog(msg: "Deletando categoria...");

  final categoriesBox = Hive.box('categories');
  await categoriesBox.delete(categoryId);
  await Future.delayed(Duration(seconds: 1), () {
    Get.back();
  });
  Get.find<CategoryController>().refresh();
  Get.showSnackbar(Ui.successSnackBar(message: "Categoria deletada!"));
}
