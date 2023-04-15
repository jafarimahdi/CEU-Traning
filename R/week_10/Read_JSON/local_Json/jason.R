library(jsonlite)


t <- '{
    "glossary": {
        "title": "example glossary",
		"GlossDiv": {
            "title": "S",
			"GlossList": {
                "GlossEntry": {
                    "ID": "SGML",
					"SortAs": "SGML",
					"GlossTerm": "Standard Generalized Markup Language",
					"Acronym": "SGML",
					"Abbrev": "ISO 8879:1986",
					"GlossDef": {
                        "para": "A meta-markup language, used to create markup languages such as DocBook.",
						"GlossSeeAlso": ["GML", "XML"]
                    },
					"GlossSee": "markup"
                }
            }
        }
    }
}'


# convert a JSON to the list
my_list <- fromJSON(t)


# convert back to the JSON file
toJSON(my_list).    # simple  
toJSON(my_list,pretty=T)  # better view 
toJSON(my_list,pretty=T,auto_unbox = T) # unBox all the result

