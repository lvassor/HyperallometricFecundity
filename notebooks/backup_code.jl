for g in 1:length(k_vec) # think this gets changed to alpha_vec using same iterator
    k = k_vec[g]
#     k = 0.01
#     a_b = a_b_vec[g]
#     if alpha == 75
#         alpha = 80
#     end
#     if alpha == 50
#         alpha = 45
#     end
#     alpha = 60
    print("\nalpha: ", alpha)
    if alpha == 290
        c_b_vec = range(0.001,1.2,length = resolution)
    end
    if alpha == 300
        c_b_vec = range(0.001,1.13,length = resolution)
    end
    for h in 1:length(a_b_vec)
        a_b = a_b_vec[h]
        M0 = [hypothetical_starting_mass, hypothetical_starting_reproduction]
        tspan = (0.0,1e4)
        
        ## Calculate which curves have an asymptotic size (no repro) larger than m_alpha (i.e. no shrinking) ##
        ## when reproduction is from birth ##
        results_no_shrink = Array{Float64,2}(undef,resolution,resolution)
        results_optimisation = Array{Any,2}(undef,resolution,resolution)
        for i in 1:resolution
            c_0 = c_vec[i]
            for j in 1:resolution
                c_b = c_b_vec[j]
                p = Dict([(:a_0,a),(:a_b,a_b),
                  (:b_0,b),(:b_b,1.0),
                  (:c_0,c_0),(:c_b,c_b),
                  (:Alph,alpha),
                  (:k,k),(:Z,2/alpha)])
#                 print("beginning simulation")
                prob = ODEProblem(dM,M0,tspan,p)
                sol_optimisation = solve(prob,Rosenbrock23()) 
#                 print("simulation complete")
                results_optimisation[i,j] = sol_optimisation
                global M_alph = sol_optimisation(p[:Alph])[1] # find m_alpha for your given alpha - needs fixing as finding same value in every loop
#                 print(p)
                p[:Alph] = 0.0 # update p value, MUST come after prob defined
#                 print("new p", p)
                prob = ODEProblem(dM,M0,tspan,p)
                sol_no_shrink = solve(prob,Rosenbrock23())
                results_no_shrink[i,j] = sol_no_shrink[end][1]
                
            end
        end
        print("\nM_alpha: ", M_alph)
        feas = results_no_shrink .> M_alph # matrix of feasible growth curves where asmyptotic size is larger than mass a maturity (i.e.) those curves with no shrinking
        
        ## Of those feasible curves, what is optimum
        x = [i.u[end][2] for i = results_optimisation] # find reproduction for each cell
        
        ## Find optimum values from matrix
        max = findmax(x .* feas)
        c_opt = c_vec[max[2][1]]
        rho_opt = c_b_vec[max[2][2]]
        #         optima_sensitivity[g,1] = alpha
#         optima_sensitivity[g,2] = a_b
#         optima_sensitivity[g,3] = c_opt
#         optima_sensitivity[g,4] = rho_opt
        
        
        ## Set plot attributes
        
        
        xticks_labels = 0.00:maximum(c_vec)/10:maximum(c_vec)
        yticks_labels = 0.00:maximum(c_b_vec)/10:maximum(c_b_vec)
        #         yticks_strings = ["$(@sprintf("%.2f", i))" for i in yticks_labels]
#         yticks_strings2 = [latexify(i) for i in yticks_strings]
        
        ## Generate plots
#         p = heatmap(x .* feas, xlab=L"c",xticks = (xticks,xticks_labels),
#                             ylab=L"\rho", yticks = (yticks,yticks_labels),
#                             transpose=true)
#         annotate!([(80, 90, text("c opt = $(@sprintf("%.2f", c_opt))\n  rho opt = $(@sprintf("%.2f", rho_opt))", 10, :white, :topright))])
#         annotate!([(max[2][1], max[2][2], text("O", 12, :white))])
        heat = heatmap(x .* feas, xlab="Proportion of body mass to fecundity rate, c",xticks = (xticks,xticks_labels),
                            ylab="Fecundity rate mass-scaling exp, p", yticks = (yticks,yticks_labels),
                            transpose=true, legend = :none)
        annotation_string = " c opt = $(@sprintf("%.2f", c_opt))\n rho opt = $(@sprintf("%.2f", rho_opt))"
        annotate!([(80, 90, text(annotation_string, 12, :white, :topright))])
        annotate!([(max[2][1], max[2][2], text("O", 12, :white))])

        ## Save fitness surface
        file_name = "../results/opt_hm_Alph=$(@sprintf("%.2f", alpha))_a=$(@sprintf("%.2f", a))_x=$(@sprintf("%.2f", a_b))_k=$(@sprintf("%.2f", k_vec[g]))_regfont.pdf"
#         csv_file_name = "../Results/opt_hm_Alph=$(@sprintf("%.2f", alpha))_a=$(@sprintf("%.2f", a))_x=$(@sprintf("%.2f", a_b))_k=$(@sprintf("%.2f", k_vec[g])).csv"
        print("\nSaving optimisation heatmap for simulation: ", file_name)
#         savefig(file_name) # Saves the plot from p as a .pdf vector graphic
    end
end
        
        
        
        ## Save fitness surface
#         file_name = "../Results/opt_hm_Alph=$(@sprintf("%.2f", alpha))_a=$(@sprintf("%.2f", a))_x=$(@sprintf("%.2f", a_b))_k=$(@sprintf("%.2f", k_vec[g])).pdf"
#         print("\nSaving optimisation heatmap for simulation: ", file_name)
#         draw(PGF("plot.tex", 5inch, 3inch), p.o)
#         savefig(file_name) # Saves the plot from p as a .pdf vector graphic
        ## Save parameter space for feasible curves
#         heatmap(feas, xlab=L"c",xticks = (xticks,xticks_labels),
#                             ylab=L"\rho", yticks = (yticks,yticks_labels),
#                             transpose=true) #, colormap=ColorMaps.Named("Jet"))
#         savefig("../Results/feasible.pdf") # Saves the plot from p as a .pdf vector graphic
#     end
# end