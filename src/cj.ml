open Batteries
open Cj

let parse (_src : string) : unit = ()

(** main *)
let () =
  print_endline (dump Sys.argv);
  Sys.argv
  |> (fun skip arr -> Array.tail arr skip) 1
  |> Array.iter (fun x -> Source.read x |> parse)
