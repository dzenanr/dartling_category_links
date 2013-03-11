part of category_links;

// lib/gen/category/links/links.dart

abstract class LinkGen extends ConceptEntity<Link> {

  LinkGen(Concept concept) : super.of(concept);

  Category get category => getParent("category");
  set category(Category p) => setParent("category", p);

  Uri get url => getAttribute("url");
  set url(Uri a) => setAttribute("url", a);

  String get description => getAttribute("description");
  set description(String a) => setAttribute("description", a);

  Link newEntity() => new Link(concept);
  Links newEntities() => new Links(concept);

}

abstract class LinksGen extends Entities<Link> {

  LinksGen(Concept concept) : super.of(concept);

  Links newEntities() => new Links(concept);
  Link newEntity() => new Link(concept);

}

