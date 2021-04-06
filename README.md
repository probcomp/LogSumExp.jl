# LogSumExp.jl

[![Docs: dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://probcomp.github.io/LogSumExp.jl/dev/)

A Julia implementation of `logsumexp`.

Like in
[SciPy](https://docs.scipy.org/doc/scipy/reference/generated/scipy.special.logsumexp.html),
but with `keepdims=True`, since that is the convention for array operations in
Julia.  For the `keepdims=False` version, use `reduce_logsumexp`.

For more details, see the full [docs](https://probcomp.github.io/LogSumExp.jl/dev/).
