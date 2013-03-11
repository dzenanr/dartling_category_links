import 'dart:html';
import 'dart:json';

import 'package:dartling_category_links/category_links.dart';

LinksEntries entries;
Categories categories;

load() {
  String json = window.localStorage['category_links_with_dartling'];
  if (json == null) {
    initCategoryLinks(entries);
  } else {
    entries.fromJson(parse(json));
  }
  categories.order();
}

save() {
  window.localStorage['category_links_with_dartling'] =
      stringify(entries.toJson());
}

main() {
  var repo = new CategoryRepo();
  var domainCode = CategoryRepo.categoryDomainCode;
  var modelCode = CategoryRepo.categoryLinksModelCode;
  var models = repo.getDomainModels(domainCode);
  entries = models.getModelEntries(modelCode);
  categories = entries.categories;
  load();
}

