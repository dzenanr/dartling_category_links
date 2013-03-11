// web/category/links/category_links_web.dart

import "dart:html";

import "package:dartling/dartling.dart";
import "package:dartling/dartling_app.dart";

import "package:dartling_category_links/category_links.dart";

initCategoryData(CategoryRepo categoryRepo) {
   var categoryModels =
       categoryRepo.getDomainModels(CategoryRepo.categoryDomainCode);

   var categoryLinksEntries =
       categoryModels.getModelEntries(CategoryRepo.categoryLinksModelCode);
   initCategoryLinks(categoryLinksEntries);
   categoryLinksEntries.display();
   categoryLinksEntries.displayJson();
}

showCategoryData(CategoryRepo categoryRepo) {
   var mainView = new View(document, "main");
   mainView.repo = categoryRepo;
   new RepoMainSection(mainView);
}

void main() {
  var categoryRepo = new CategoryRepo();
  initCategoryData(categoryRepo);
  showCategoryData(categoryRepo);
}


