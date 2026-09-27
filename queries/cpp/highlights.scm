;; extends

; Give pointer and reference declarators a nearby color above generic operator captures.
(pointer_declarator
  "*" @operator.pointer
  (#set! priority 105))

(abstract_pointer_declarator
  "*" @operator.pointer
  (#set! priority 105))

(reference_declarator
  ["&" "&&"] @operator.pointer
  (#set! priority 105))

(abstract_reference_declarator
  ["&" "&&"] @operator.pointer
  (#set! priority 105))
