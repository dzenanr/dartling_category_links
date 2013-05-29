part of category_links;

// lib/gen/category/links/entries.dart

class LinksEntries extends ModelEntries {

  LinksEntries(Model model) : super(model);

  Map<String, Entities> newEntries() {
    var entries = new Map<String, Entities>();
    var concept;
    concept = model.concepts.singleWhereCode("Category");
    entries["Category"] = new Categories(concept);
    return entries;
  }

  Entities newEntities(String conceptCode) {
    var concept = model.concepts.singleWhereCode(conceptCode);
    if (concept == null) {
      throw new ConceptError("${conceptCode} concept does not exist.") ;
    }
    if (concept.code == "Category") {
      return new Categories(concept);
    }
    if (concept.code == "Link") {
      return new Links(concept);
    }
  }

  ConceptEntity newEntity(String conceptCode) {
    var concept = model.concepts.singleWhereCode(conceptCode);
    if (concept == null) {
      throw new ConceptError("${conceptCode} concept does not exist.") ;
    }
    if (concept.code == "Category") {
      return new Category(concept);
    }
    if (concept.code == "Link") {
      return new Link(concept);
    }
  }

  fromJsonToData() {
    fromJson(categoryLinksDataJson);
  }

  Categories get categories => getEntry("Category");

}


