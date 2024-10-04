open Batteries

let read (file : string) =
  let ic = Stdlib.open_in file in
  let data =
    try Stdlib.input_line ic with
    | End_of_file -> ""
  in
  Stdlib.close_in ic;
  let lines = String.split_on_char '\n' data in
  List.iter print_endline lines

let () =
  print_endline (dump Sys.argv);
  Sys.argv |> (fun skip arr -> Array.tail arr skip) 1 |> Array.iter read

(** operator *)
type op = Add | Sub | Mul | Div

(** expression *)
type expr = Int of int | Pfx of binop * expr | Infix of binop * expr * expr

let rec pp (some : expr) : string =
  match some with
  | Num (Int n) -> string_of_int n
  | Num (Float f) -> string_of_float f
  | Pfx (Add, e) -> "+" ^ pp e
  | Pfx (Sub, e) -> "-" ^ pp e
  | Pfx (Mul, e) -> failwith " * expr "
  | Pfx (Div, e) -> failwith " / expr "
  | Infix (Add, e1, e2) -> pp e1 ^ "+" ^ pp e2
  | Infix (Sub, e1, e2) -> pp e1 ^ "-" ^ pp e2
  | Infix (Mul, e1, e2) -> pp e1 ^ "*" ^ pp e2
  | Infix (Div, e1, e2) -> pp e1 ^ "/" ^ pp e2

let () =
  print_endline (pp (Pfx (Add, Num (Int 1))));
  print_endline (pp (Pfx (Sub, Num (Int 2))));
  print_endline (pp (Pfx (Mul, Num (Int 3))));
  print_endline (pp (Pfx (Div, Num (Int 4))))
(* let () = print_endline (pp Op (All)); print_endline (pp Op (All));
   print_endline (pp Op (All)); print_endline (pp Op (All)) *)
