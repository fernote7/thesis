#### Getting to the Formula

\begin{align}
dS_t = \mu S_t dt + \sqrt{V_t} S_t dB_t
\end{align}

If $S$ were deterministic, $dS_t/S_t$ would be the derivative of $\ln(S_t)$ with respect to $S$. This suggests to find an expression for the stochastic differential of $\ln(S_t)$, a function of the single random variable $S_t$.

\begin{scriptsize}
\begin{align}
f(t,S) &= \ln(S) \\
df(t,S) &= \cancelto{0}{\frac{\partial f}{\partial t}dt}  + \frac{\partial f}{\partial S} dS + \cancelto{0}{\frac{1}{2} \frac{\partial^2 f}{\partial t^2} (dt)^2} + \frac{1}{2} \frac{\partial^2 f}{\partial S^2} (dS)^2  + \cancelto{0}{\frac{\partial^2 f}{\partial t \partial S} dt dS} \\
d\ln(S) &= \frac{d\ln(S)}{dS} dS + \frac{1}{2} \frac{d^2\ln(S)}{dS^2}(dS)^2 \\
(dS)^2 &= \int_{0}^{t}{\left(\sqrt{V} \times S \right)^2} ds = V S^2 dt \\
d\ln(S) &= \frac{1}{S} (\mu S dt + \sqrt{V} S dB) + \frac{1}{2}\frac{-1}{S^2} V S^2 dt \\
d\ln(S) &= \left( \mu -  \frac{1}{2} V \right) dt + \sqrt{V} dB \\
\int_{u}^{T}{d\ln(S)} &= \int_{u}^{T}{\left( \mu - \frac{1}{2} V_t \right) dt} + \int_{u}^{T}{\sqrt{V_t}dB_t} \\
\ln(S_t) - \ln(S_u) &= \int_{u}^{T}{\left( \mu - \frac{1}{2} V_t \right) dt} + \int_{u}^{T}{\sqrt{V_t}dB_t} \\
\ln \left( \frac{S_t}{S_u} \right) &= \mu (t-u) - \frac{1}{2}\int_{u}^{T}{V_t dt} + \int_{u}^{T}{\sqrt{V_t} dB_t} \\
\ln \left( \frac{S_t}{S_u} \right) &= \mu (t-u) - \frac{1}{2}\int_{u}^{T}{V_t dt} + \int_{u}^{T}{\sqrt{V_t} \left(\rho dB_{1,s} + \sqrt{1-\rho^2} dB_{1,s} \right)} \\
S_t &= S_u \times \exp \left( \mu (t-u) - \frac{1}{2} \int_{u}^{T}{V_t dt} + \rho \int_{u}^{T}{\sqrt{V_t}dB_{1,t}}+ \sqrt{1 - \rho^2} \int_{u}^{T}{\sqrt{V_t}dB_{2,t}} \right)
\end{align}
\end{scriptsize}