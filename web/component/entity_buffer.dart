import 'dart:html';

import 'package:dartling/dartling.dart';
import 'package:web_ui/web_ui.dart';

class EntityBuffer extends WebComponent {
  Entities entities;
  ConceptEntity entity;
  
  bool showEntityChildren = false;
  
  String elementId(String atributeCode) {
    return '${entities.concept.code}-${atributeCode}'; 
  }
  
  add() {
    Map av = new Map();
    for (var attribute in entities.concept.attributes) {
      var id = "#${attribute.code}";
      InputElement ie = query(id);
      av[attribute.code] = ie.value;
    }
    Element message = query("#entity-message");
    var error = false;
    message.text = '';
    for (var attribute in entities.concept.attributes) {
       if (attribute.required) {
         if (av[attribute.code].trim() == '') {
           message.text = '${entities.concept.code} ${attribute.code} is mandatory; ${message.text}';
           error = true;
         }
       }
    }
    if (!error) {
      entity = entities.newEntity();
      for (var attribute in entities.concept.attributes) {
        entity.setAttribute(attribute.code, av[attribute.code]);
      }
      if (entities.add(entity)) {
        message.text = 'added';
        var entityTable = query('entity-table').xtag;
        entityTable.entities.order();
      } else {
        message.text = 'entity already exists';
      }
    }
  }
  
  update() {
    Map av = new Map();
    for (var attribute in entities.concept.attributes) {
      InputElement ie = query("#${attribute.code}");
      av[attribute.code] = ie.value;
    }
    for (var attribute in entities.concept.attributes) {
      entity.setAttribute(attribute.code, av[attribute.code]);
    }
    var entityTable = document.query('entity-table').xtag;
    entityTable.showEntityEdit = false;
  }
  
  find() {
    
  }
  
  delete() {
    entities.remove(entity);
    showEntityChildren = false;
  }

  showChildren() {
    showEntityChildren = true;
  }
  
}

