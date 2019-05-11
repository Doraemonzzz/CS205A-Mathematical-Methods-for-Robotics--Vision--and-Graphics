#### Problem 1

(a)代码如下：

```matlab
M = zeros(nParticles);
[m, n] = size(edges);
for i = 1: m
    x = edges(i, 1);
    y = edges(i, 2);
    M(x, x) = M(x, x) - 1;
    M(x, y) = M(x, y) + 1;
    M(y, x) = M(y, x) + 1;
    M(y, y) = M(y, y) - 1;
end
```

(b)令
$$
Y_1 =X ,Y_2 =X', Y=
\left[
 \begin{matrix}
Y_1 \\
Y_2
  \end{matrix}
  \right]
$$
那么方程为
$$
Y' = \left[
 \begin{matrix}
X' \\
X''
  \end{matrix}
  \right]=
    \left[
 \begin{matrix}
0 & I_n\\
F&0
  \end{matrix}
  \right]
  
  \left[
 \begin{matrix}
X\\
X'
  \end{matrix}
  \right]\triangleq A Y
$$
所以代码如下：

```matlab
[m, n] = size(secondOrderMatrix);
matrix = zeros(2 * m);
matrix(1: m, m+1: 2*m) = eye(m);
matrix(m+1: 2*m, 1: m) = secondOrderMatrix;
```

(c)

(i)前向欧拉
$$
y_{k+1}= y_{k}+h F\left(y_{k}\right)
=(I_n + h A)y_k
$$
代码如下

```matlab
x = x + dt * firstOrder * x;
```

(ii)后向欧拉
$$
\begin{aligned}
y_{k}&=y_{k+1}-h F\left(y_{k+1}\right) =(I_n-hA)y_{k+1}\\
y_{k+1}&=(I_n-hA)^{-1}y_k
\end{aligned}
$$
代码如下

```matlab
x = inv(eye(2 * n) - dt * firstOrder) * x;
```

(iii)梯形法
$$
\begin{aligned}
y_{k+1}&=y_{k}+h \frac{F\left(y_{k+1}\right)+F\left(y_{k}\right)}{2}
=(I_n +\frac 1 2 h A) y_k +\frac 1 2 h A y_{k+1}\\
y_{k+1}&=(I_n-\frac 12 hA)^{-1}(I_n +\frac 1 2 h A) y_k
\end{aligned}
$$
代码如下

```matlab
x = inv(eye(2 * n) - dt * firstOrder / 2) * (eye(2 * n) + dt * firstOrder / 2) * x;
```

(d)leapfrog
$$
\begin{aligned} \vec{y}_{k+1} &=\vec{y}_{k}+h \vec{v}_{k+1 / 2} \\ 
\vec{a}_{k+1} &=F\left[t_{k+1}, \vec{y}_{k+1}\right]=A\vec y_{k+1} \\ 
\vec{v}_{k+3 / 2} &=\vec{v}_{k+1 / 2}+h \vec{a}_{k+1} 
=\vec{v}_{k+1 / 2}+ A\vec y_{k+1}
\end{aligned}
$$
代码如下

```matlab
positions = positions + dt * velocities;
velocities = velocities + dt * force * positions;
```



#### Problem 2

(a)求导可得
$$
\begin{aligned}
E'(t)
&=\theta' \theta'' +\theta' \sin \theta\\
&=\theta'(\theta''+ \sin \theta)\\
&=0
\end{aligned}
$$
所以$E(t)$关于$t$是常数。

(b)
$$
\begin{aligned}
E_{k+1} -E_k
&=\frac 1 2 w_{k+1}^2 -\cos \theta_{k+1}
-\frac 1 2 w_{k}^2+\cos \theta_{k}\\
&=\frac 1 2 (w_k-h\sin \theta_{k+1})^2
-\cos( \theta_k +hw_k)-\frac 1 2 w_{k}^2+\cos \theta_{k}\\
&=\frac 1 2 (-h\sin \theta_{k+1}) (2w_k -h\sin\theta_{k+1}) +
2\sin \left(\frac {hw_k} 2  \right)\sin  \left(\theta_k +\frac {hw_k} 2 \right)\\
&= \frac 1 {2} h^2 \sin^2 \theta_{k+1} -h w_k\sin\theta_{k+1} +2\sin \left(\frac {hw_k} 2  \right)
\left(\sin\theta_k \cos \left(\frac {hw_k} 2 \right)
+\cos\theta_k \sin\left(\frac {hw_k} 2 \right)\right)\\
&=\frac 1 {2} h^2 \sin^2 \theta_{k+1} +2\sin^2\left(\frac {hw_k} 2  \right)\cos\theta_k
 +
\sin\theta_{k} \sin(hw_k)- hw_k \sin(\theta_k+h w_k)
\end{aligned}
$$
因为
$$
\begin{aligned}
\sin\theta_{k} \sin(hw_k)- hw_k \sin(\theta_k+h w_k)
&= \sin\theta_{k} \sin(hw_k) -hw_k \sin \theta_k \cos(hw_k)
-hw_k \cos \theta_k \sin(hw_k)\\
&=-hw_k \cos \theta_k \sin(hw_k) +\sin\theta_{k}  \cos(hw_k)
\left(\tan(hw_k)- hw_k\right)\\
&=O(h^2)
\end{aligned}
$$
以及
$$
\frac 1 {2} h^2 \sin^2 \theta_k +2\sin^2\left(\frac {hw_k} 2  \right)\cos\theta_k= O(h^2)
$$
所以
$$
E_{k+1}=E_k +O(h^2)
$$
(c)因为
$$
\begin{aligned}
w_{k+1}
&=w_k -h\theta_{k+1}\\
&=w_k -h(\theta_k+ hw_k)\\
&=-h\theta_k +(1-h^2) w_k
\end{aligned}
$$
所以
$$
\left( \begin{array}{c}\theta_{k+1} \\ w_{k+1}\end{array}\right)
=
 \left(
 \begin{matrix}
  1 & h\\
  -h & 1-h^2
  \end{matrix}
  \right)

\left( \begin{array}{c}\theta_{k} \\ w_{k}\end{array}\right)
$$
(d)
$$
\begin{aligned}
E_{k+1}
&= w_{k+1}^2 + hw_{k+1} \theta_{k+1}+
\theta_{k+1}^2\\
&=\left( \begin{array}{c}\theta_{k+1} \\ w_{k+1}\end{array}\right)^{\top} 
 \left(
 \begin{matrix}
  1 & \frac 1 2h\\
\frac 1 2h &1
  \end{matrix}
  \right)\left( \begin{array}{c}\theta_{k+1} \\ w_{k+1}\end{array}\right)\\
  &= 
\left( \begin{array}{c}\theta_{k} \\ w_{k}\end{array}\right)^{\top}
\left(
 \begin{matrix}
  1 & -h\\
  h & 1-h^2
  \end{matrix}
  \right)
   \left(
 \begin{matrix}
  1 & \frac 1 2h\\
\frac 1 2h &1
  \end{matrix}
  \right)\left(
 \begin{matrix}
  1 & h\\
  -h & 1-h^2
  \end{matrix}
  \right)
  \left( \begin{array}{c}\theta_{k} \\ w_{k}\end{array}\right)\\
  &=\left( \begin{array}{c}\theta_{k} \\ w_{k}\end{array}\right)^{\top}
\left(
 \begin{matrix}
  1-\frac 12  {h^2}& -\frac 1 2h\\
  \frac 3 2 h-\frac 1 2 h^3 & 1-\frac 1 2 h^2
  \end{matrix}
  \right)
\left(
 \begin{matrix}
  1 & h\\
  -h & 1-h^2
  \end{matrix}
  \right)
  \left( \begin{array}{c}\theta_{k} \\ w_{k}\end{array}\right)\\
  &=\left( \begin{array}{c}\theta_{k} \\ w_{k}\end{array}\right)^{\top}
\left(
 \begin{matrix}
  1& \frac 1 2h\\
\frac 1 2h & 1
  \end{matrix}
  \right)

  \left( \begin{array}{c}\theta_{k} \\ w_{k}\end{array}\right)\\
  &= E_k
\end{aligned}
$$
