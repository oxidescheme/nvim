;; extends

; Color pointer types and address-of/dereference without changing binary operators.
(pointer_type
  "*" @operator.pointer
  (#set! priority 105))

(unary_expression
  ["&" "*"] @operator.pointer
  (#set! priority 105))
