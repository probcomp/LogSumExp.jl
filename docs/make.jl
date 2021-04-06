using Documenter
import LogSumExp

pages_in_order = [
    "index.md",
]

makedocs(
    sitename="LogSumExp.jl",
    pages = pages_in_order,
    expandfirst = pages_in_order,
)

deploydocs(
    repo = "github.com/probcomp/LogSumExp.jl.git",
    devbranch = "main",
)
