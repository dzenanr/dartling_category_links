part of category_links;

// lib/category/links/init.dart

initCategoryLinks(var entries) {
  _initCategories(entries);
}

_initCategories(var entries) {
  Categories categories = entries.categories;
  Concept categoryConcept = categories.concept;

  Category dartCategory = new Category(categoryConcept);
  dartCategory.code = 'Dart';
  dartCategory.description = 'Web programming language';
  categories.add(dartCategory);

  Concept linkConcept = dartCategory.links.concept;

  Link dartHomeLink = new Link(linkConcept);
  dartHomeLink.code = 'Dart Home';
  dartHomeLink.url = Uri.parse('http://www.dartlang.org/');
  dartHomeLink.description =
      'Dart is a new web language with libraries and tools.';
  dartHomeLink.category = dartCategory;
  dartCategory.links.add(dartHomeLink);

  Link dartNewsLink = new Link(linkConcept);
  dartNewsLink.code = 'Dart News';
  dartNewsLink.url = Uri.parse('http://news.dartlang.org/');
  dartNewsLink.description =
      'Official news from the Dart project.';
  dartNewsLink.category = dartCategory;
  dartCategory.links.add(dartNewsLink);

  Category html5Category = new Category(categoryConcept);
  html5Category.code = 'HTML5';
  html5Category.description =
      'HTML5 is the ubiquitous platform for the modern web.';
  categories.add(html5Category);

  Category css3Category = new Category(categoryConcept);
  css3Category.code = 'CSS3';
  css3Category.description = 'Cascading Style Sheets for the modern web.';
  categories.add(css3Category);
}

