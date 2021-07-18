using MAT
using LinearAlgebra
using TimerOutputs
using SparseArrays
using SuiteSparse

to = TimerOutput()


function testfun(x)
	afile = Array{Any}(undef, 8)
	afile[8] = matopen("/home/ducky/code/progetto-calcolo/data/matrix/Hook_1498.mat")
	afile[1] = matopen("/home/ducky/code/progetto-calcolo/data/matrix/G3_circuit.mat")
	afile[2] = matopen("/home/ducky/code/progetto-calcolo/data/matrix/nd24k.mat")
	afile[3] = matopen("/home/ducky/code/progetto-calcolo/data/matrix/bundle_adj.mat")
	afile[4] = matopen("/home/ducky/code/progetto-calcolo/data/matrix/ifiss_mat.mat")
	afile[5] = matopen("/home/ducky/code/progetto-calcolo/data/matrix/TSC_OPF_1047.mat")
	afile[6] = matopen("/home/ducky/code/progetto-calcolo/data/matrix/ns3Da.mat")
	afile[7] = matopen("/home/ducky/code/progetto-calcolo/data/matrix/GT01R.mat")
	file = afile[x]

		to = TimerOutput()
		prob = read(file, "Problem")
		A= prob["A"]
		# A = sparse(Asparse)
		xe = ones(size(A,2),1)
		
		b= A*xe

		println("Begin Factor")
		@timeit to "Factorization Cost" begin
				A1 = factorize(A) 
		end

		@timeit to "FactoResolver" begin
			xF = A1\b
		end
		res_normF = norm(xe-xF)/norm(xe)

		@timeit to "LinearResolver" begin
			xM = A\b
		end

		res_norm = norm(xM-xe)/norm(xe)
		res_normF = norm(xM-xe)/norm(xe)
		print("Printing the norm for ", prob["name"], " file!\n")
		print(res_norm, "\n",
		res_normF,
		"\nPrinting timings\n")
		show(to)
		print("\n")
		println(typeof(A), " tipo di A")
		println(typeof(A1), " tipo di A1")
	
end
