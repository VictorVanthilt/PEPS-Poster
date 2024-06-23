#import "./poster.typ": *

#show: poster.with(
  size: "594x841",
  title: "Projected Entangled Pair States (PEPS)",
  authors: "Victor Vanthilt, Niccolò Laurora, Michael Shatnev",
  departments: "",
  // univ_logo: "./images/logo_detail_copenhagen_2x.png",
  // univ_logo: "./images/CPHScience.svg",
  univ_logo: "./images/Ku-ucph-logo-svg.svg",
  footer_text: "4EU+ Quantum Information and Quantum Many-Body Theory",
  footer_url: "",
  footer_email_ids: "",
  footer_color: "901A1E",

  // Use the following to override the default settings
  // for the poster header.
  num_columns: "2",
  // univ_logo_scale: "150",
  univ_logo_scale: "60",
  title_font_size: "50",
  authors_font_size: "30",
  univ_logo_column_size: "10",
  title_column_size: "40",
  footer_url_font_size: "20",
  footer_text_font_size: "35",
)
#set text(size: 22pt)

#let box_color = luma(200)

= Definition
Projected Entangled Pair States (PEPS) are a class of tensor network states that efficiently parametrise quantum states with finite entanglement. They are a generalization of Matrix Product States (MPS).

#align(horizon)[
#grid(
  columns: (8fr, 4fr),
  rows: 4,
  [
    - Given a physical sytem composed of local sites with site-Hilbertspaces $cal(H)_i equiv bb(C)^(d_i)$ situated on a graph with edges $E= {e_(i,j)}$ and vertices $V = {v_i}$.
  ],
  [
    #figure(
      image("./images/graph.svg", 
            width: 50%),
    )
  ],
  [
    - For each vertex $v_i$, and for each edge $e_(i,j)$ connected to $v_i$ (and $v_j$), associate an ancilla degree of freedom $a_(i,j) in cal(H)_(i,j) equiv bb(C)^(d_(i,j))$.
  ],
  [
    #figure(
      image("./images/ancillae.svg", 
            width: 50%),
    )
  ],
  [
    - Maximally entangle ancillae $a_(i,j)$ and $a_(j,i)$ associated with each edge $e_(i,j)$: $ |Phi_(i,j)) = sum^(d_(i,j))_(l=1) |l angle.r times.circle |l angle.r $
  ],
  [
    #figure(
      image("./images/entangled-ancillae.svg", 
            width: 50%),
    )
  ],
  [
    - Apply a linear map $cal(P)_i: times.big.circle_(j_i) cal(H)_(a_(i,j)) arrow.r cal(H)_i$ to the ancillae of site $i$, to obtain the projected entangled pair states (PEPS) $|Psi angle.r = times.big.circle_(e in E) cal(P)_e |Phi_e) $.
  ],
  [
    #figure(
      image("./images/projected-entangled-ancillae.svg", 
            width: 50%),
    )
  ],
  [
    - The final PEPS is a tensor network state that has the same connectivity as the original graph and that lives in the total Hilbert space $cal(H) = times.big.circle_i cal(H)_i$.
    
  ],
  [
    #figure(
      image("./images/peps-network.svg", 
            width: 50%),
    )
  ]
)
]
*[Cirac et. al. 2021]*
= Entanglement Area Law
#block(
  fill: box_color,
  inset: 10pt,
  radius: 8pt,
  stroke: 1pt,
  [*Entanglement Area Law*
  
  The entanglement entropy of a region $cal(A)$ of quantum state with finite (local) entanglement scales as $partial cal(A)$, the boundary of $cal(A)$.
  $ S_(cal(A)) #h(10pt)~#h(10pt) partial cal(A) $
  ],
)

This is in constrast with the volume law most states follow.

Given the Schmidt decomposition of a state $|Psi angle.r$ across a bipartition of the system into the "In" system $cal(A)$ and the "Out" system $cal(B)$ (where $sum_i lambda^2_i = 1$):

$ |Psi angle.r = sum_i lambda_i |I_i angle.r times.circle |O_i angle.r $

The entanglement entropy of the region $cal(A)$ is given by:
$ S_(cal(A)) = - sum_i lambda^2_i log(lambda^2_i) $
The maximal value this can take is when all the $lambda_i = 1/N_S$, with $N_S$ the Schmidt rank.
For finitely entangled systems, $S_(cal(A))$ is thus bounded by the finite Schmidt rank $N_S$.
$ S_(cal(A)) <= log(N_S) $

It turns out that PEPS satisfy an *area law* for their entanglement entropy *by construction*. This property makes PEPS an efficient representation of quantum states with finite (local) entanglement.

#figure(
  image("./images/area-law.svg", 
        width: 40%),
)

The entanglement entropy of the shaded area $cal(A)$ is the sum of the entanglement entropy across the cut virtual bonds, which by construction all have a finite bond dimension (and Schmidt rank) $chi$.

The entanglement entropy of a single cut is bounded by $log(chi)$. The total entanglement entropy of the region $cal(A)$ is thus proportional to the number of cut virtual bonds times $log(chi)$.

$ S_(cal(A)) #h(10pt) ~ #h(10pt) log(chi) dot.c partial cal(A) $

#colbreak()
= Parent Hamiltonians
#block(
  fill: box_color,
  inset: 10pt,
  radius: 8pt,
  stroke: 1pt,
  [*Parent Hamiltonians for PEPS*

    Every injective PEPS is the unique ground state of a _local_, _frustration free_ parent Hamiltonian.
  ]
)

Consider the same shaded region $cal(A)$ as before. The support space $cal(S)_(cal(A))$ of the reduced density matrix $rho_(cal(A))$ grows as $partial cal(A)$ while the Hilbert space $cal(H)_(cal(A))$ grows as $cal(A)$.

Therefore we can always find a sufficiently large region such that $rho_(cal(A))$ has a non-trivial kernel $ker(rho_(cal(A))) = cal(H)_(cal(A)) \\ cal(S)_(cal(A))$.

It is thus the groundstate of every Hamiltonian h with:
- $h >= 0$
- $ker(h) = cal(S)_(cal(A))$

since by construction $tr(rho_(cal(A))h) = 0$.

The Hamiltonian can be extended to the entire lattice by assigning a region $cal(R)_v$ to every vertex $v$ of the lattice and defining
$ H = sum_v h_v times.circle bb(1) $

The Hamiltonian is _local_ since it is the sum of local terms $h_v$ acting on the region $cal(R)_v$, and it is _frustration free_ since every term $h_v$ is minimized by the PEPS.

[*Perez-Garcia et. al. 2007*]

// #block(
//   fill: rgb(footer_color),
//   inset: 10pt,
//   radius: 8pt,
//   stroke: 1pt,
//   [
//     #text(size: 35pt, smallcaps("4EU+ Quantum Information and Quantum Many-Body Theory"))
//   ]
// )
= Computation of local expectation values
#block(
  fill: box_color,
  inset: 10pt,
  radius: 8pt,
  stroke: 1pt,
  [
    COMPUTATION OF EXPECTATION VALUES????????? 
  ]
)

= Computational complexity of PEPS contractions
#block(
  fill: box_color,
  inset: 10pt,
  radius: 8pt,
  stroke: 1pt,
  [
    How Complex are these peps really? It can't be that NP-Hard.
  ]
)