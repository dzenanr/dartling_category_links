
// test/category/links/category_links_gen.dart

import "package:dartling/dartling.dart";

import "package:dartling_category_links/category_links.dart";

genCode() {
  var repo = new Repo();

  // change "Dartling" to "YourDomainName"
  var categoryDomain = new Domain("Category");

  // change dartling to yourDomainName
  // change Skeleton to YourModelName
  // change "Skeleton" to "YourModelName"
  Model categoryLinksModel =
      fromMagicBoxes(categoryLinksModelJson, categoryDomain, "Links");

  repo.domains.add(categoryDomain);

  repo.gen("category_links");
}

initCategoryData(CategoryRepo categoryRepo) {
   var categoryModels =
       categoryRepo.getDomainModels(CategoryRepo.categoryDomainCode);

   var categoryLinksEntries =
       categoryModels.getModelEntries(CategoryRepo.categoryLinksModelCode);
   initCategoryLinks(categoryLinksEntries);
   categoryLinksEntries.display();
   categoryLinksEntries.displayJson();
}

void main() {
  genCode();

  var categoryRepo = new CategoryRepo();
  initCategoryData(categoryRepo);
}