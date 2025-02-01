import 'package:flowcash/widgets/custom/button_base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/screen_size.dart';
import '../themes/app_theme.dart';
import '../models/category.dart';
import '../controllers/categoryController/category_controller.dart';

class CategoryForm extends StatefulWidget {
  final Category? category;
  const CategoryForm({
    Key? key,
    this.category,
  }) : super(key: key);

  @override
  State<CategoryForm> createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
  final inputName = TextEditingController();
  bool blockSubmit = true;

  @override
  void initState() {
    super.initState();
    if (widget.category != null) {
      inputName.text = widget.category!.name ?? "";
    }
  }

  @override
  void dispose() {
    super.dispose();
    inputName.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeScreen = ScreenSizes.getScreenWidthSize(context);

    onSubmit() {
      if (widget.category == null) {
        CategoryController().createCategory(
          categoryName: inputName.text.trim(),
        );
      } else {
        CategoryController().updateCategory(
          categoryId: widget.category!.id,
          categoryName: inputName.text.trim(),
        );
      }
    }

    void onBlockSubmit(String text) {
      if (text.isNotEmpty && text != widget.category?.name) {
        setState(() {
          blockSubmit = false;
        });
      } else if (!blockSubmit) {
        setState(() {
          blockSubmit = true;
        });
      }
    }

    return AlertDialog(
      title: Text(
        widget.category == null ? "Nova categoria" : "Edição de categoria",
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              controller: inputName,
              onFieldSubmitted: (_) => onSubmit(),
              keyboardType: TextInputType.name,
              onChanged: onBlockSubmit,
              decoration: InputDecoration(
                labelText: 'Nome',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppTheme.primaryColor,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppTheme.primaryColor,
                    width: 1.5,
                  ),
                ),
              ),
              cursorColor: AppTheme.primaryColor,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: Text(
                      'Cancelar',
                      style: TextStyle(
                        fontSize: sizeScreen * 0.047,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    onPressed: () => Get.back(),
                  ),
                  SizedBox(width: sizeScreen * 0.02),
                  ButtonBase(
                    label: widget.category == null ? 'Adicionar' : 'Salvar',
                    onPressed: blockSubmit ? null : () => onSubmit(),
                    width: 100,
                    elevation: blockSubmit ? 1 : null,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
