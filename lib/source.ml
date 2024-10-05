open Batteries

(** read file name *)
let read (file : string) =
  let ic = Stdlib.open_in file in
  let data = Stdlib.really_input_string ic (Stdlib.in_channel_length ic) in
  Stdlib.close_in ic;
  data

(* let data = try Stdlib.input_line ic with | End_of_file -> "" in *)

let%test "dummy" = true
let%test "read" = "" = read "/dev/null"
