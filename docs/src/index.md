```@meta
CurrentModule = LogSumExp
```

# Update: Should probably use `StatsFuns.jl` instead

This function exists in
[StatsFuns.jl](https://github.com/JuliaStats/StatsFuns.jl) (wish I had found
that on my first search...).  Their implementation is fancier and a little more
efficient.  Recommend going with theirs unless you really, _really_ want to
keep your dependencies small.

# LogSumExp.jl

A Julia implementation of `logsumexp`.

```@autodocs
Modules = [LogSumExp]
```
