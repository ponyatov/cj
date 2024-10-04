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

type num = Int of int | Num of float
type binop = Add | Sub | Mul | Div
type expr = Num of num | Op of binop

let pp (some : expr) : string =
  match some with
  | Op Add -> "+"
  | Op Sub -> "-"
  | Op Mul -> "*"
  | Op Div -> "/"
  | Num (Int n) -> string_of_int n
  | Num (Num f) -> string_of_float f

(* let () = print_endline (pp Op (All)); print_endline (pp Op (All));
   print_endline (pp Op (All)); print_endline (pp Op (All)) *)
