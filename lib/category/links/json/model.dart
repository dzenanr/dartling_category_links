part of category_links;

// http://www.json.org/
// http://jsonformatter.curiousconcept.com/

// rename dartling to yourDomainName
// rename Skeleton to YourModelName
// do not change model or Model

// lib/dartling/skeleton/json/model.dart

var categoryLinksModelJson = r'''
{
    "width":990,
    "lines":[
        {
            "box2box1Max":"1",
            "box1Name":"Category",
            "box1box2Min":"0",
            "box2Name":"Link",
            "box1box2Id":false,
            "box2box1Id":false,
            "box2box1Name":"category",
            "box1box2Max":"N",
            "box1box2Name":"links",
            "box2box1Min":"1",
            "category":"relationship",
            "internal":true
        }
    ],
    "height":580,
    "boxes":[
        {
            "width":80,
            "entry":true,
            "name":"Category",
            "x":56,
            "height":80,
            "y":51,
            "items":[
                {
                    "sequence":20,
                    "name":"description",
                    "category":"attribute",
                    "type":"String",
                    "init":""
                }
            ]
        },
        {
            "width":80,
            "entry":false,
            "name":"Link",
            "x":406,
            "height":80,
            "y":90,
            "items":[
                {
                    "sequence":20,
                    "name":"url",
                    "category":"required",
                    "type":"Uri",
                    "init":""
                },
                {
                    "sequence":30,
                    "name":"description",
                    "category":"attribute",
                    "type":"String",
                    "init":""
                }
            ]
        }
    ]
}
''';