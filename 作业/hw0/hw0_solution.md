#### Problem 1

$\forall f,g \in C^1 (\mathbb R), \forall \alpha, \beta \in \mathbb R​$，我们有$\alpha f+ \beta g​$连续可导，所以$\alpha f + \beta g \in C^1 (\mathbb R)​$，因此$C^1 (\mathbb R)​$是线性空间。

考虑$C^1 (\mathbb R)$的子集多项式全体，显然全体多项式的维度为$\infty$，因此$C^1 (\mathbb R)$的维度为$\infty$。



#### Problem 2

$$
A^T A =  \left[
 \begin{matrix}
\vec c_1^T \vec c_1& \ldots & \vec c_1^T \vec c_n \\
\ldots & \ldots & \ldots \\
\vec c_n^T \vec c_1& \ldots & \vec c_n^T \vec c_n \\
  \end{matrix}
  \right] \in \mathbb R^{ n\times n} ,
  AA^T  =  \left[
 \begin{matrix}
\vec r_1^T \vec r_1& \ldots & \vec r_1^T \vec r_m \\
\ldots & \ldots & \ldots \\
\vec r_m^T \vec r_1& \ldots & \vec r_m^T \vec r_m \\
  \end{matrix}
  \right] \in \mathbb R^{ m\times m}
$$



#### Problem 3

注意到原问题等价于最小化
$$
\begin{aligned}
f^2(\vec x) 
&=||A\vec x -\vec b ||^2  \\
&=(A\vec x -\vec b)^T (A\vec x -\vec b)\\
&=\vec x ^T A^TA\vec x  -\vec b^T A\vec x - \vec x ^T A^T \vec b + \vec b^T\vec b \\
&=\vec x ^T A^TA\vec x  -2\vec x ^T A^T \vec b + \vec b^T\vec b
\end{aligned}
$$
对上式关于$\vec x $求梯度可得
$$
\begin{aligned}
\nabla_{\vec x} f^2 (\vec x)
&= \nabla_{\vec x}( \vec x ^T A^TA\vec x  -2\vec x ^T A^T \vec b + \vec b^T\vec b) \\
&= 2 A^TA\vec x - 2A^T \vec b
\end{aligned}
$$
令上式为$0​$可得
$$
A^TA\vec x=A^T \vec b \\
\vec x = (A^TA)^{-1}A^T \vec b
$$



#### Problem 4

注意到原问题等价于最小化
$$
|| A\vec x||^2 = \vec x^T A^TA\vec x
$$
约束条件等价于
$$
||B\vec x||^2 =  \vec x^T B^TB\vec x =1
$$
根据该条件构造拉格朗日乘子：
$$
L(\vec x , \lambda) =  \vec x^T A^TA\vec x -\lambda(\vec x^T B^TB\vec x -1)
$$
求梯度可得
$$
\nabla_{\vec x } L(\vec x ,\lambda) =2 A^TA\vec x -2\lambda   B^TB\vec x \\
\nabla_{\lambda } L(\vec x ,\lambda) = -\vec x^T B^TB\vec x +1
$$
令上式为$0​$可得
$$
\begin{eqnarray*}
A^T A\vec x &&=\lambda B^T B\vec x \tag 1   \\
\vec x^T B^TB\vec x&&=1 \tag 2
\end{eqnarray*}
$$
将$(1)，(2)​$带入目标函数可得
$$
\vec x^T A^TA\vec x =  \lambda  \vec x^T B^T B\vec x =\lambda
$$
所以接下来只要求出$\lambda $即可，对等式$(1)​$稍作变形可得
$$
(A^T A-\lambda B^T B) \vec x = 0
$$
由约束条件可知$\vec x\neq 0$，所以上述线性方程有非零解，因此
$$
|A^T A -\lambda B^T B| = 0
$$
解该$n$次方程即可求出$\lambda_1,...,\lambda _n$，记最小的正根为$\lambda _i$，最大的正根为$\lambda _j $，所以
$$
|| A\vec x||^2 =\lambda \in [\lambda_i, \lambda_j]
$$



#### Problem 5

注意约束条件等价于
$$
\vec x^T \vec x =1
$$
根据该条件构造拉格朗日乘子：
$$
\begin{aligned}
L(\vec x ,\lambda) &= \vec a . \vec x  -\lambda ( \vec x^T \vec x-1) \\
&=\vec a ^T \vec x-\lambda ( \vec x^T \vec x-1)
\end{aligned}
$$
求梯度可得
$$
\nabla_{\vec x } L(\vec x ,\lambda) = \vec a -\lambda \vec x \\
\nabla_{\lambda } L(\vec x ,\lambda) = \vec x^T \vec x-1
$$
令上式为$0$可得
$$
\vec x = \frac 1 \lambda \vec a \\
\vec x ^T \vec x  = \frac 1 {\lambda^2} \vec a ^T \vec a = 1 \\
\lambda = \pm ||\vec a ||
$$
将$\vec x = \frac 1 \lambda \vec a ​$带入可得
$$
f(\vec x) = \frac 1 \lambda \vec a ^T \vec a =\frac 1 \lambda ||\vec a||^2 =\pm ||\vec a||
$$
所以
$$
\max f(\vec x) = ||\vec a ||
$$

