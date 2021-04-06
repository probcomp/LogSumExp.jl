module LogSumExp


export logsumexp, reduce_logsumexp

# Type that mimics the `dims` argument of array operations in `Base`: either a
# single dim, a tuple of dims, or the sentinel `:` which roughly means "all
# dims."
DimsLike = Union{Integer, Dims, Colon}

"""
    logsumexp(a; dims=:)

Computes the [log-sum-exp](https://en.wikipedia.org/wiki/LogSumExp).
Mathematically equivalent to

    log.(sum(exp.(a); dims=dims))

but more numerically stable.

!!! note "Note on treatment of dims"

    Note that, in keeping with the other Julia array operations, no dims are
    dropped in the output of `logsumexp`; instead,

    ```julia
    size(logsumexp(a; dims=dims), d) == 1
    ```

    for each `d` in `dims`.  For example:

    ```julia-REPL
    julia> a = rand(2, 3, 4, 5);

    julia> size(logsumexp(a; dims=(1,3)))
    (1, 3, 1, 5)
    ```

    For a variant of `logsumexp` that does drop dims, see
    [`reduce_logsumexp`](@ref).
"""
function logsumexp(a::AbstractArray{<:Real}; dims::DimsLike=:)
    m = maximum(a; dims=dims)
    return m + log.(sum(exp.(a .- m); dims=dims))
end

"""
    reduce_logsumexp(a; dims=:)

Like [`logsumexp`](@ref), but drops the dims `dims` in the output.

```julia-REPL
julia> a = rand(2, 3, 4, 5);

julia> size(reduce_logsumexp(a; dims=(1,3)))
(3, 5)
```
"""
function reduce_logsumexp(a::AbstractArray{<:Real}; dims::DimsLike=:)
    return dropdims(logsumexp(a; dims=dims); dims=dims)
end


end  # module LogSumExp
