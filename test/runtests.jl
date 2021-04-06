using LogSumExp
import Random
import Test: @test, @testset

@testset "Equivalence to the naive implementation for small inputs" begin
    a = [1, 2]
    b = logsumexp(a)
    b_expected = log(exp(1) + exp(2))
    @test b ≈ b_expected
end

@testset "Summing along different dimensions" begin
    a = [1 2 3;
         4 5 6]
    b = logsumexp(a; dims=1)
    b_expected = reshape([log(exp(1) + exp(4)),
                          log(exp(2) + exp(5)),
                          log(exp(3) + exp(6))],
                         (1, 3))
    @test size(b) == size(b_expected)
    @test b ≈ b_expected

    b = logsumexp(a; dims=2)
    b_expected = reshape([log(exp(1) + exp(2) + exp(3)),
                          log(exp(4) + exp(5) + exp(6))],
                         (2, 1))
    @test size(b) == size(b_expected)
    @test b ≈ b_expected
end

@testset "Dropping dims" begin
    a = [1 2 3;
         4 5 6]
    b = reduce_logsumexp(a; dims=1)
    b_expected = [log(exp(1) + exp(4)),
                  log(exp(2) + exp(5)),
                  log(exp(3) + exp(6))]
    @test size(b) == size(b_expected)
    @test b ≈ b_expected

    b = reduce_logsumexp(a; dims=2)
    b_expected = [log(exp(1) + exp(2) + exp(3)),
                  log(exp(4) + exp(5) + exp(6))]
    @test size(b) == size(b_expected)
    @test b ≈ b_expected
end

@testset "Shape when summing over multiple dims" begin
    Random.seed!(1)
    a = rand(2, 3, 4, 5)
    b1 = logsumexp(a; dims=(1,3))
    @test size(b1) == (1, 3, 1, 5)
    b2 = reduce_logsumexp(a; dims=(1,3))
    @test size(b2) == (3, 5)
    @test b2 == b1[1, :, 1, :]
end

@testset "Numerical stability for large inputs" begin
    a = 1e10 .+ (1:8)
    b = logsumexp(a)
    b_expected = 1e10 + log(sum(exp.(1:8)))
    @test b ≈ b_expected
end

@testset "Numerical stability for small inputs" begin
    a = -1e10 .+ (1:8)
    b = logsumexp(a)
    b_expected = -1e10 + log(sum(exp.(1:8)))
    @test b ≈ b_expected
end
