;; extends

; Give pointer declarators a nearby color above generic operator captures.
(pointer_declarator
  "*" @operator.pointer
  (#set! priority 105))

(abstract_pointer_declarator
  "*" @operator.pointer
  (#set! priority 105))
