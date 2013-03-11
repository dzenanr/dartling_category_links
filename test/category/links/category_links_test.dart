// test/category/links/category_links_test.dart

import 'dart:uri';

import "package:unittest/unittest.dart";
import "package:dartling/dartling.dart";
import "package:dartling_category_links/category_links.dart";

testCategoryLinks(Repo repo, String domainCode, String modelCode) {
  var models;
  var session;
  var entries;

  var categories;
  var categoryConcept;
  var categoryCount = 0;

  var linkConcept;
  var dartLinkCount = 0;
  group("Testing ${domainCode}.${modelCode}: ", () {
    setUp(() {
      models = repo.getDomainModels(domainCode);
      session = models.newSession();
      entries = models.getModelEntries(modelCode);
      expect(entries, isNotNull);

      categoryConcept = entries.getConcept('Category');
      expect(categoryConcept, isNotNull);
      expect(categoryConcept.attributes.isEmpty, isFalse);

      linkConcept = entries.getConcept('Link');
      expect(linkConcept, isNotNull);
      expect(linkConcept.attributes.isEmpty, isFalse);
      expect(linkConcept.parents.length, equals(1));

      categories = entries.categories;
      expect(categories.length, equals(categoryCount));

      var dartCategory = new Category(categoryConcept);
      expect(dartCategory, isNotNull);
      expect(dartCategory.links.length, equals(0));
      dartCategory.code = 'Dart';
      dartCategory.description = 'Dart Web language.';
      categories.add(dartCategory);
      expect(categories.length, equals(++categoryCount));

      var dartNewsLink = new Link(linkConcept);
      expect(dartNewsLink, isNotNull);
      dartNewsLink.code = 'Dart News';
      dartNewsLink.url = Uri.parse('http://news.dartlang.org/');
      dartNewsLink.description =
          'Official news from the Dart project.';
      dartNewsLink.category = dartCategory;
      dartCategory.links.add(dartNewsLink);
      expect(dartCategory.links.length, equals(++dartLinkCount));

      var dartHomeLink = new Link(linkConcept);
      expect(dartHomeLink, isNotNull);
      dartHomeLink.code = 'Dart Home';
      dartHomeLink.url = Uri.parse('http://www.dartlang.org/');
      dartHomeLink.description =
          'Dart is a new web language with libraries and tools.';
      dartHomeLink.category = dartCategory;
      dartCategory.links.add(dartHomeLink);
      expect(dartCategory.links.length, equals(++dartLinkCount));

      var html5Category = new Category(categoryConcept);
      expect(html5Category, isNotNull);
      expect(html5Category.links.length, equals(0));
      html5Category.code = 'HTML5';
      html5Category.description =
          'HTML5 is the ubiquitous platform for the modern web.';
      categories.add(html5Category);
      expect(categories.length, equals(++categoryCount));

      var css3Category = new Category(categoryConcept);
      expect(css3Category, isNotNull);
      expect(css3Category.links.length, equals(0));
      css3Category.code = 'CSS3';
      css3Category.description = 'Cascading Style Sheets for the modern web.';
      categories.add(css3Category);
      expect(categories.length, equals(++categoryCount));
    });
    tearDown(() {
      entries.clear();
      expect(categories.length, equals(0));
      categoryCount = 0;
      dartLinkCount = 0;
    });
    test('Find category and link by code', () {
      Category dartCategory = categories.findByCode('Dart');
      expect(dartCategory, isNotNull);
      expect(dartCategory.code, equals('Dart'));

      Links dartLinks = dartCategory.links;
      expect(dartLinks.length, equals(dartLinkCount));
      Link dartHomeLink = dartLinks.findByCode('Dart Home');
      expect(dartHomeLink, isNotNull);
      expect(dartHomeLink.code, equals('Dart Home'));
    });
    test('Order categories by code', () {
      categories.order();
      categories.display(title: 'Order categories by code');
    });
    test('Order Dart links by code', () {
      Category dartCategory = categories.findByCode('Dart');
      expect(dartCategory, isNotNull);
      Links dartLinks = dartCategory.links;
      expect(dartLinks.length, equals(dartLinkCount));
      dartLinks.order();
      dartLinks.display(title:'Ordered Dart links by code');
    });
    test('New link with no category errors', () {
      Category dartCategory = categories.findByCode('Dart');
      expect(dartCategory, isNotNull);

      var dartHomeLink = new Link(linkConcept);
      expect(dartHomeLink, isNotNull);
      expect(dartHomeLink.category, isNull);
      dartHomeLink.code = 'Dart Home';
      dartHomeLink.url = Uri.parse('http://www.dartlang.org/');
      dartHomeLink.description =
          'Dart brings structure to web app engineering '
          'with a new language, libraries, and tools.';
      dartCategory.links.add(dartHomeLink);
      expect(dartCategory.links.length, equals(dartLinkCount));
      expect(dartCategory.links.errors.length, equals(2));
      expect(dartCategory.links.errors.toList()[0].category, equals('required'));
      expect(dartCategory.links.errors.toList()[1].category, equals('unique'));
      dartCategory.links.errors.display(title:'Link Error');
    });
    test('Undo and redo actions', () {
      var frameworkCategory = new Category(categoryConcept);
      frameworkCategory.code = 'Framework';
      expect(frameworkCategory, isNotNull);
      expect(frameworkCategory.links.length, equals(0));

      var action = new AddAction(session, categories, frameworkCategory);
      action.doit();
      expect(categories.length, equals(++categoryCount));

      session.past.undo();
      expect(categories.length, equals(--categoryCount));

      session.past.redo();
      expect(categories.length, equals(++categoryCount));
    });
    test('Model in JSON', () {
      entries.clear();
      entries.fromJsonToData();
      entries.display();
      entries.displayJson();
    });

  });
}

testCategoryData(CategoryRepo categoryRepo) {
  testCategoryLinks(categoryRepo, CategoryRepo.categoryDomainCode,
      CategoryRepo.categoryLinksModelCode);
}

void main() {
  var categoryRepo = new CategoryRepo();
  testCategoryData(categoryRepo);
}
