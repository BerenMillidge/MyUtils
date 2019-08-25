# simple tool to delete julia history file... or specifically rename it when causing errors

using Dates
using Base.Filesystem
function string_replace(s::AbstractString, replacees, replacer)
    new_string = ""
    for (i,char) in enumerate(s)
        println(char)
        println("$(char in replacees)")
        if char in replacees
            println(char)
            println("replaced $char with $replacer")
            new_string *= replacer
        else
            println("adding old string")
            new_string *= char
        end
    end
    return new_string
end

datestring = string_replace(string(Dates.now()))
history_dir = "/home/beren/.julia/logs/"
mv(history_dir * "history.jl", history_dir *"broken_versions/broken_"*datestring*".jl")
rm(history_dir * "history.jl")


