open Batteries
open Cjl

let parse (_src : string) : unit = ()

(** main *)
let () =
  print_endline (dump Sys.argv);
  Sys.argv
  |> (fun skip arr -> Array.tail arr skip) 1
  |> Array.iter (fun x -> read x |> parse)

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
  | Pfx (Mul, e) -> failwith " * expr "
  | Pfx (Div, e) -> failwith " / expr "
  | Infix (Add, e1, e2) -> pp e1 ^ "+" ^ pp e2
  | Infix (Sub, e1, e2) -> pp e1 ^ "-" ^ pp e2
  | Infix (Mul, e1, e2) -> pp e1 ^ "*" ^ pp e2
  | Infix (Div, e1, e2) -> pp e1 ^ "/" ^ pp e2

let () =
  print_endline (pp (Pfx (Add, Int 1)));
  print_endline (pp (Pfx (Sub, Int 2)));
  (* print_endline (pp (Pfx (Mul, Int 3))); *)
  (* print_endline (pp (Pfx (Div, Int 4))); *)
  print_endline (pp (Pfx (Add, Id "x")))
(* let () = print_endline (pp Op (All)); print_endline (pp Op (All));
   print_endline (pp Op (All)); print_endline (pp Op (All)) *)
