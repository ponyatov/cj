(** operator *)
type op = Add | Sub | Mul | Div

(** expression *)
type expr =
  | Int of int
  | Id of string
  | Pfx of op * expr
  | Infix of op * expr * expr

  (** pretty-print *)
let rec pp (some : expr) : string =
  match some with
  | Int n -> string_of_int n
  | Id s -> s
  | Pfx (Add, e) -> "+" ^ pp e
  | Pfx (Sub, e) -> "-" ^ pp e
  | Pfx (Mul, _e) -> failwith " * expr "
  | Pfx (Div, _e) -> failwith " / expr "
  | Infix (Add, e1, e2) -> pp e1 ^ "+" ^ pp e2
  | Infix (Sub, e1, e2) -> pp e1 ^ "-" ^ pp e2
  | Infix (Mul, e1, e2) -> pp e1 ^ "*" ^ pp e2
  | Infix (Div, e1, e2) -> pp e1 ^ "/" ^ pp e2
