part of category_links; 
 
// lib/category/links/links.dart 
 
class Link extends LinkGen { 
 
  Link(Concept concept) : super(concept); 
 
  Link.withId(Concept concept, Category category, String name) : 
    super.withId(concept, category, name); 
 
} 
 
class Links extends LinksGen { 
 
  Links(Concept concept) : super(concept); 
 
} 

