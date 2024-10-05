open Batteries

(** operator *)
type op = Add | Sub | Mul | Div

(** expression *)
type expr =
  | Int of int
  | Id of string
  | Pfx of op * expr
  | Infix of op * expr * expr

(** dump expr with type prefixes *)
let rec dump (some : expr) : string =
  match some with
  | Int n -> "int:" ^ string_of_int n
  | Id s -> "id:" ^ s
  | Pfx (Add, e) -> "+ " ^ dump e
  | Pfx (Sub, e) -> "- " ^ dump e
  | Pfx (Mul, _e) -> failwith " * expr "
  | Pfx (Div, _e) -> failwith " / expr "
  | Infix (Add, e1, e2) -> dump e1 ^ " + " ^ dump e2
  | Infix (Sub, e1, e2) -> dump e1 ^ " - " ^ dump e2
  | Infix (Mul, e1, e2) -> dump e1 ^ " * " ^ dump e2
  | Infix (Div, e1, e2) -> dump e1 ^ " / " ^ dump e2

let%test "int" = "int:1" = (Int 1 |> dump)
let%test "id" = "id:x" = (Id "x" |> dump)
let%test "+pfx" = "+ int:2" = (Pfx (Add, Int 2) |> dump)
let%test "-pfx" = "- int:3" = (Pfx (Sub, Int 3) |> dump)
let%test "x+2" = "id:x + int:2" = (Infix (Add, Id "x", Int 2) |> dump)

(** pretty printer for utop *)
let pp (_fmt : Format.formatter) (t : expr) : unit = t |> dump |> print_endline
