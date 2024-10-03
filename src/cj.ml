open Batteries

let read file:string =
  let ic = open_in file in
  let data = try input_lines ic with End_of_file -> "" in 
  close_in ic;
  data


  "lib/cj.cj" |> open_in |> input_line

let () =
  print_endline (dump Sys.argv);
  print_endline (Sys.argv |> (fun skip arr -> Array.tail arr skip) 1 |> dump)
