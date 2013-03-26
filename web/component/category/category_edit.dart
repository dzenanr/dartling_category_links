import 'dart:html';

import 'package:dartling_category_links/category_links.dart';
import 'package:web_ui/web_ui.dart';

class CategoryEdit extends WebComponent {
  Categories categories;
  Category category;

  update() {
    InputElement description = query("#edit-category-description");
    category.description = description.value;
    var categoryTable = document.query('category-table').xtag;
    categoryTable.showEntityEdit = false;
  }

}