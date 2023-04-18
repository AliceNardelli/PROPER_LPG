from owlready2 import *
onto_path.append("/home/alice/")
onto = get_ontology("http://www.semanticweb.org/alice/ontologies/2023/3/ontology_new#").load()
print(list(onto.classes()))