# LogSumExp.jl

[![Docs: dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://probcomp.github.io/LogSumExp.jl/dev/)

**Update:** This function exists in
[StatsFuns.jl](https://github.com/JuliaStats/StatsFuns.jl) (wish I had found
that on my first search...).  Their implementation is fancier and a little more
efficient.  Recommend going with theirs unless you really, _really_ want to
keep your dependencies small.

A Julia implementation of `logsumexp`.

Like in
[SciPy](https://docs.scipy.org/doc/scipy/reference/generated/scipy.special.logsumexp.html),
but with `keepdims=True`, since that is the convention for array operations in
Julia.  For the `keepdims=False` version, use `reduce_logsumexp`.

For more details, see the full [docs](https://probcomp.github.io/LogSumExp.jl/dev/).
