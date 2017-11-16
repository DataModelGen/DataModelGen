let codableTable =
  
"""
struct {{ entitie.name }} {
{% for attribute in entitie.attributes %}
var {{ attribute.name }}: {{ attribute.type }}
{% endfor %}
}

// Mark: Coding keys

extension {{ entitie.name }} {
enum CodingKeys: String, CodingKey {
{% for attribute in entitie.attributes %}
case {{ attribute.name }} {% if attribute.jsonKeyPath %} = {{ attribute.jsonKeyPath }}{% endif %}
{% endfor %}
}
}
"""
