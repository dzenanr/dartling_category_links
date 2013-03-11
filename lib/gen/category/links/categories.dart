part of category_links;

// lib/gen/category/links/categories.dart

abstract class CategoryGen extends ConceptEntity<Category> {

  CategoryGen(Concept concept) : super.of(concept) {
    Concept linkConcept = concept.model.concepts.findByCode("Link");
    setChild("links", new Links(linkConcept));
  }

  String get description => getAttribute("description");
  set description(String a) => setAttribute("description", a);

  Links get links => getChild("links");

  Category newEntity() => new Category(concept);
  Categories newEntities() => new Categories(concept);

}

abstract class CategoriesGen extends Entities<Category> {

  CategoriesGen(Concept concept) : super.of(concept);

  Categories newEntities() => new Categories(concept);
  Category newEntity() => new Category(concept);

}

