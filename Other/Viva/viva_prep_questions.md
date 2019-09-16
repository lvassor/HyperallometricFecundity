# Internal Viva Preparation
*Luke Vassor, CMEE*

1. Explain the 2/3 scaling as a rearrangement of pi*r^2

*A perfectly isometrically scaling organism would see all volume-based properties change proportionally to the body mass (assuming constant density), all surface area-based properties change with mass to the power of 2/3, and all length-based properties change with mass to the power of 1/3. <br/> Can obtain this by plotting surface area or length of cube against volume and finding slopes. Or with log-transformation. So no pi?*

2. Explain your derivation of ```a```.

*a represents a mass-independent constant for energy intake - energy coming in (joules/sec) multiplied by mass of cell/cost of creating cell (j/s X m/s). i.e. with my current rate of energy flow, how many cells can I produce (growth)? Calculate Ec using E_T X m_c. West use the energy content of mammalian tissue and then take B0 from unicellular organisms. I chased down their references because their estimate of a didn't work for other taxa.*

3. Why did you take a metabolic theory approach? Why not DEB?

*This raises the question of what is the point of theory? Is it to make extremely accurate predictions or to increase our understanding? Most mechanistic models aren't actually truly mechanistic because parameters require estimation from empirical data. Phenomenological models can be fitted to data to DESCRIBE underlying biological processes, but mechanistic explicitly track details of underlying systems. DEB theory includes the state variables of structure, reserve, maturity, and reproduction buffer, and Kearney notes that much confusion in theories of growth relate to the inadequacy of body mass as a state variable. The state variables of DEB are not directly observable, however, and therefore their values estimated from model fits cannot be compared to empirically determined values.*

4. Explain why maturity means rho has to be low.

*Comes down to the architecture of the model. Fecundity rate loss term kicks in at maturity. Therefore, assuming the same processes are dictating intake and maintenance during immaturity, fish can grow larger when immature, since they have more energy to grow with. However, this also means that delaying maturity means fish are much larger when they finally mature. Since fecundity rate scales with mass, which is now a LOT larger, they can only allocate a very tiny amount of energy to fecundity rate without shrinking, which necessitates a low c and rho.*

5. So there ARE previous results showing hypoallometric investment in reproduction? Reiss paper.

*Yes, however not brilliantly conclusive. Reiss concludes that reproduction investment in calories must be less than 1 because a least squares fit to Ein - Ereq produces an exponent less than 1. Further, uses ADMR for Ein which has food ad libitum (again, not active). Ereq is based off arthropod species. Not general at all. Yes, when you assume intake around 0.75 then rho < 1 typically. Estimates exponent values from fitting, not from theory.*

6. Explain results. Sounds like 3/4 could be correct and it doesn't happen? So why are you confident that it does happen?

*Yes, may certainly be the case that 0.75 is correct, it is theoretically prodicted and empirically supported. Crucial part is the resting metabolic rate. There's too much uncertainty here - fish and others violate the assumptions firstly. Additionally, pers comm with author of fecundity study suggest that when they include some measure of frequency (to approximate a rate), it actually exacerbates the hyperallometry. EXTEND THIS*

7. What's going on with Fig 5 and 6 axes?

*My bad. Ideally should have kept constant, like in presentation. TAKE AN UPDATED COPY. But dashed hline at rho=1 is indicative.*

8. Explain the advantage of growing rapidly during immaturity.

*If your mortality rate is such that your maturity age is x, it is advantageous to grow rapidly during the immature period since this can afford you several competitive advantages (line 223): e.g. increased fecundity, reduced vulnerability to predators, increased access to food. So within the intake provided by the environment you want to grow as maximally as possible before maturing for these advantages without growing so big that your rho would then have to be tiny.*

9.  But you said that hyperallometry cannot emerge due to growth being too rapid during immaturity. So surely 0.85 scaling would exacerbate this problem?

*Yes I do say this. However the results seem to suggest that 0.85 scaling allows you to both grow more rapidly AND overcome large reproduction costs.*

10.  Explain why ```b``` is a caveat.

*```b```, your maintenance coefficient is derived from B_c/E_c, rate/cost (joules/sec/joules). However the metabolic rate of a cell in vivo, as stated by West et al. is not know. Thus, b is calculated as a rearrangement of the equation for terminal size. Reason this becomes a caveat is that this asymptotic size then affects this value. I selected 10000kg.*

11.  Why would fish evolve reproductive senescence (surely a fitness benefit?) if they are extremely likely to die?

*(Few fish species have exhibited it, fish fecundity increases with age?) Life History Theory suggests that non-reproductive elders provide an inclusive fitness benefit via the "grandmother" effect, via contributions to children and grandchildren (Reznick 2006). Also, actuarial senescence and reproductive senescence are highly likely to be linked, so makes no sense to invest in reproduction when somatic tissue is breaking down (Reznick 2002).*

12.  Realistic ```k``` value would reduce alpha, but you said low alpha is unrealistic?

*Yes, so perhaps this would show the uniqueness of reproductive senescence to only some species and it is not a widely evolved strategy.*