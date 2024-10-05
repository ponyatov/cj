open Batteries
open Cjl

let parse (_src : string) : unit = ()

(** main *)
let () =
  print_endline (dump Sys.argv);
  Sys.argv
  |> (fun skip arr -> Array.tail arr skip) 1
  |> Array.iter (fun x -> read x |> parse)



let () =
  print_endline (Cjl.Grammar.pp (Pfx (Add, Int 1)));
  print_endline (pp (Pfx (Sub, Int 2)));
  (* print_endline (pp (Pfx (Mul, Int 3))); *)
  (* print_endline (pp (Pfx (Div, Int 4))); *)
  print_endline (pp (Pfx (Add, Id "x")))
(* let () = print_endline (pp Op (All)); print_endline (pp Op (All));
   print_endline (pp Op (All)); print_endline (pp Op (All)) *)
