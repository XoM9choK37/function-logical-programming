// Дополнительные сведения о F# см. на http://fsharp.net
// Дополнительную справку см. в проекте "Учебник по F#".
let rec cifrSum n = 
    if n = 0 then 0
    else (n%10) + (cifrSum (n / 10))
[<EntryPoint>]
let main argv = 
    System.Convert.ToInt32(System.Console.ReadLine()) |> cifrSum |> System.Console.WriteLine
    let z = System.Console.ReadKey()
    0 // возвращение целочисленного кода выхода
