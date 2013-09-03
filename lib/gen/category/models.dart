part of category_links;

// lib/gen/category/models.dart

class CategoryModels extends DomainModels {

  CategoryModels(Domain domain) : super(domain) {
    add(fromJsonToLinksEntries());
  }

  LinksEntries fromJsonToLinksEntries() {
    return new LinksEntries(fromJsonToModel(
      categoryLinksModelJson,
      domain,
      CategoryRepo.categoryLinksModelCode));
  }

}





