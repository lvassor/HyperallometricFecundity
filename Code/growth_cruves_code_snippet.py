# no need to include a Lt ODE since we already have a closed form solution to this ODE - 
# pointless using ode.int to integrate it numerically
# Define L(t)
def L(t):
    return sc.exp(-mu*t)

def dCR_dt(pops, t, a,b,c,rho,alpha):                 
    """ Takes model parameters and populates array
    based on model calculations"""
    m = pops[0]
    r = pops[1]
    Q = L(t - alpha)
    if t < alpha:            # juvenile stage
        dmdt = a*(m**0.75) - b*m
        dRdt = 0
    elif t >= alpha:          # mature adult stage
        dmdt = a*(m**0.75) - b*m - c*(m**rho)
        dRdt = Q*c * m**rho      # because lifetime R is the integral of RHS, so ODE is RHS with no integrand
    if m+dmdt < 0:
        dmdt = -m
    return sc.array([dmdt, dRdt])


# set parameters
a = 0.2
alpha = 200
rho = 1
resolution = 5
rho_values = np.linspace(0.75,1.5,resolution)
alpha_values = np.array([100,300,500])
mu = 0.01


# Define the time vector
t = np.arange(0, 800, 1)


# set the initial conditions for the two populations (10 resources and 5 consumers per unit area)
hypothetical_starting_reproduction = c*hypothetical_starting_mass**rho
m0 = 5
r0 = hypothetical_starting_reproduction
rm0 = sc.array([m0, r0])


# Integration - loop through all maturation ages within all exponent values
# cumRepro = np.ones((resolution,resolution))
cumRepro = np.ones((resolution,resolution))
for j, alpha in enumerate(alpha_values):
    alpha = alpha_values[j]
    color = next(ax._get_lines.prop_cycler)['color'] # keep color the same for both growth curve and repro curve with same rho value
    for i, rho in enumerate(rho_values):
        rho = rho_values[i]
        lifetime_repro, infodict = integrate.odeint(dCR_dt, rm0, t, args = (a,b,c,rho,alpha),full_output = True)
        plt.vlines(alpha, color='grey',linestyle='--', linewidth=1, ymin=0, ymax=lifetime_repro[alpha][0])
        plt.plot(t, lifetime_repro[:,0], color = color, label = rho_values[i])
#         plt.plot(t, lifetime_repro[:,1], color = color) # label = 'Mass with Time')
        cumRepro[i,j] = lifetime_repro[-1][1] # only want repro so print second element of scipy array

        
# Plot growth curves under different regimes
plt.grid()
# plt.plot(t, 800*L(t))
# plt.legend(loc='best', title=r'$\rho$ = ')
plt.xlabel('Time (Days)')
axes = plt.gca()
axes.set_xlim([0,len(time)])
axes.set_ylim([0,hypothetical_asymptotic_mass+100])
plt.rcParams['figure.figsize'] = [8,5]
plt.ylabel('Size (g)')
plt.title("Lifetime Growth at Different Exponent")
plt.savefig('../Results/growth_curve_rho.pdf', bbox_inches='tight')
plt.show()



# 3D PLOT: (Fitness Surface)
x,y = np.meshgrid(rho_values, alpha_values) # generates a 25x25 grid for rho and alpha respectively (ie. all the x values and all the y values)
z = cumRepro.transpose() # cartesian coordinates vs numpy matrix

from mpl_toolkits.mplot3d import Axes3D

# Generate plot
fig = plt.figure()
ax = fig.gca(projection='3d')

# TeX font
# fig.rc('text', usetex=True)
# fig.rc('font', family='serif')

# Rotation angle
# Get current rotation angle
# print(ax.azim)
# Set rotation angle to 30 degrees
ax.view_init(azim=60)
surf = ax.plot_surface(x, y, z, cmap=cm.hot,linewidth=0, antialiased=False)

# Axes labels
ax.set_xlabel('ATR exponent, {}'.format(r'$\rho$'), labelpad = 15)
ax.set_ylabel('Age at Maturation \n (days), {}'.format(r'$\alpha$'), labelpad = 15)
ax.set_zlabel('Lifetime Reproduction, {}'.format(r'$R$'))


# Add a color bar which maps values to colors.
# plt.rcParams['figure.figsize'] = [5,5] # change plot size
#fig.colorbar(surf, shrink=0.5, aspect=20)#, orientation="horizontal")
plt.colorbar(surf,fraction=0.046, pad=0.07, orientation="horizontal")
plt.savefig('../Results/optimisation.pdf', bbox_inches='tight')
# plt.show()