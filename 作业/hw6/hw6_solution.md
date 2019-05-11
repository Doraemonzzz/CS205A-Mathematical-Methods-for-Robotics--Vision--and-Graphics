#### Problem 1

（备注，这题没有讲明，但是从后面的讨论中可以推出这里为无向图）

假设$|V_0|=m$，并且
$$
\vec v_i =\vec v_i^0 ,i=n-m+1,\ldots, n
$$
记$B​$为邻接矩阵，即
$$
B_{ij}=\begin{cases}
1 & (i,j)\in E\\
0 & 其他
\end{cases}
$$
将其记为如下分块形式：
$$
B=	\left[
	\begin{array}{c|c}
	B_1& B_2 \\ \hline 
	B_3& B_4
	\end{array}
	\right] \in \mathbb R^{n\times n}
$$
其中
$$
B_1\in \mathbb R^{(n-m)\times (n-m)},
B_2\in \mathbb R^{(n-m)\times m},
B_3\in \mathbb R^{m\times (n-m)},
B_4\in \mathbb R^{m\times m}
$$
记$1_k\in \mathbb R^k$表示全$1$的$k$维列向量，假设
$$
\vec v_i =[x_i, y_i]^T
$$
那么记
$$
\begin{aligned}
\vec x &=  \left[
 \begin{matrix}
x_1 \\
\vdots \\
x_{n-m}
  \end{matrix}
  \right],\vec y =  \left[
 \begin{matrix}
y_1 \\
\vdots \\
y_{n-m}
  \end{matrix}
  \right]\\
  
  \vec x' &=  \left[
 \begin{matrix}
x_{n-m+1} \\
\vdots \\
x_n
  \end{matrix}
  \right],\vec y' =  \left[
 \begin{matrix}
y_{n-m+1} \\
\vdots \\
y_n
  \end{matrix}
  \right]\\
  V_1& = \left[
 \begin{matrix}
\vec x & \vec y
  \end{matrix}
  \right],  V_2 = \left[
 \begin{matrix}
\vec x' & \vec y'
  \end{matrix}
  \right]
\end{aligned}
$$
(a)对能量式进行化简
$$
\begin{aligned}
 E\left(\vec{v}_{1}, \ldots, \vec{v}_{n}\right) 
 &=  \sum_{(i, j) \in E}\left\|\vec{v}_{i}-\vec{v}_{j}\right\|_{2}^{2}\\

&=\sum_{(i, j) \in E} (\vec v_i^T\vec v_i -2\vec v_i^T \vec v_j +\vec v_j^T\vec v_j )
\end{aligned}
$$
$\forall 1\le k \le n-m$，我们有
$$
\begin{aligned}
\nabla_{\vec v_k} \Lambda 
&= \sum_{(k, j) \in E} (2\vec v_k -2\vec v_j) + \sum_{(i, k) \in E}
(-2\vec v_i +2\vec v_k) \\
&= 2\left(\sum_{(k, j) \in E}  \vec v_k +\sum_{(i, k) \in E}  \vec v_k
- \sum_{(k, j) \in E\\ 1\le j\le n-m} \vec v_j -
\sum_{(k, j) \in E\\ n-m+1\le j\le n} \vec v_j-
\sum_{(i, k) \in E\\1\le i\le n-m} \vec v_i -
\sum_{(i, k) \in E\\n-m+1\le i\le n} \vec v_i \right)

\end{aligned}
$$
令上式为$\vec 0​$得到
$$
\sum_{(k, j) \in E}  \vec v_k +\sum_{(i, k) \in E}  \vec v_k
- \sum_{(k, j) \in E\\ 1\le j\le n-m} \vec v_j -
\sum_{(i, k) \in E\\1\le i\le n-m} \vec v_i -
\sum_{(k, j) \in E\\ n-m+1\le j\le n} \vec v_j-
\sum_{(i, k) \in E\\n-m+1\le i\le n} \vec v_i  =\vec 0
$$
写成矩阵形式为
$$
\begin{aligned}
\left( \left[
 \begin{matrix}
 B_1 & B_2
  \end{matrix}
  \right] +\left[
 \begin{matrix}
 B_1 \\
 B_3
  \end{matrix}
  \right]^T\right) 1_{n}  V_1 - (B_1 +B_1^T) V_1 &= (B_2 +B_3^T) V_2\\
\left(\text{diag}\left(\left( \left[
 \begin{matrix}
 B_1 & B_2
  \end{matrix}
  \right] +\left[
 \begin{matrix}
 B_1 \\
 B_3
  \end{matrix}
  \right]^T\right) 1_{n}\right)-(B_1 +B_1^T) \right) V_1 &=(B_2 +B_3^T) V_2
\end{aligned}
$$
记
$$
\begin{aligned}
A&=\text{diag}\left(\left( \left[
 \begin{matrix}
 B_1 & B_2
  \end{matrix}
  \right] +\left[
 \begin{matrix}
 B_1 \\
 B_3
  \end{matrix}
  \right]^T\right) 1_{n}\right)-(B_1 +B_1^T)   \\
\vec b_x&= (B_2 +B_3^T) \vec x'\\
\vec b_y&= (B_2 +B_3^T) \vec y'\\
\end{aligned}
$$
那么将上式写为分量形式得到
$$
\begin{aligned}
A \vec x  & = \vec b_x \\
A \vec y  & = \vec b_y
\end{aligned}
$$
最后验证$A$为对称正定矩阵，对称性显然，下证正定性，首先记
$$
C_1 = \left[
 \begin{matrix}
 B_1 & B_2
  \end{matrix}
  \right] ,C_2= \left[
 \begin{matrix}
 B_1 \\
 B_3
  \end{matrix}
  \right]
$$
$\forall \vec y=(y_1 ,\ldots, y_{n-m})^T$，计算$\vec y ^T A\vec y$：
$$
\begin{aligned}
\vec y ^T A\vec y
&= \vec y ^T \left(\text{diag}\left(\left( C_1 +C_2^T\right) 1_{n}\right)-(B_1 +B_1^T) \right)\vec y \\
&= \vec y ^T\left( C_1 +C_2^T\right) 1_{n}  \vec y  - \vec y ^T (B_1 +B_1^T)  \vec y \\
&= \sum_{i=1}^{n-m} \sum_{j=1}^n (B_{ij}+B_{ji}) y_i^2 -
\sum_{i=1}^{n-m}  \sum_{j=1}^{n-m}  (B_{ij}+B_{ji}) y_i y_j
\end{aligned}
$$
因为$B_{ij}\in \{0,1\}$，所以
$$
\begin{aligned}
\sum_{i=1}^{n-m}  \sum_{j=1}^{n-m}  (B_{ij}+B_{ji}) y_i y_j
&\le 
\frac {1}{2}\sum_{i=1}^{n-m}  \sum_{j=1}^{n-m}  (B_{ij}+B_{ji}) (y_i^2 +y_j^2)\\
&=\sum_{i=1}^{n-m}  \sum_{j=1}^{n-m}   (B_{ij}+B_{ji}) y_i^2 
\end{aligned}
$$
因此
$$
\begin{aligned}
\vec y ^T A\vec y
&= \sum_{i=1}^{n-m} \sum_{j=1}^n (B_{ij}+B_{ji}) y_i^2 -
\sum_{i=1}^{n-m}  \sum_{j=1}^{n-m}  (B_{ij}+B_{ji}) y_i y_j\\
&\ge  \sum_{i=1}^{n-m} \sum_{j=1}^n (B_{ij}+B_{ji}) y_i^2 -
\sum_{i=1}^{n-m}  \sum_{j=1}^{n-m}   (B_{ij}+B_{ji}) y_i^2  \\
&= \sum_{i=1}^{n-m} \sum_{j=n-m+1}^n (B_{ij}+B_{ji}) y_i^2 \\
&\ge 0
\end{aligned}
$$
当且仅当$y_i=0$时等号成立，所以$A$对称正定。

(b)(i)将之前讨论的部分实现即可，代码如下

```matlab
B = zeros(totalVertices);
[m, n] = size(edges);
for i = 1:m
    x = edges(i, 1);
    y = edges(i, 2);
    B(x, y) = 1;
    B(y, x) = 1;
end

B1 = B(unconstrainedVertices, unconstrainedVertices);
B2 = B(unconstrainedVertices, constrainedVertices);
B3 = B2';
B4 = B(constrainedVertices, constrainedVertices);

A = sparse(diag(([B1, B2] + [B1; B3]') * ones(totalVertices, 1)) - B1 - B1');
rhs = (B2 + B3') * constraints;
```

(ii)算法如下：
$$
\begin{aligned} 
\vec{d}_{k} &=\vec{b}-A \vec{x}_{k-1} \\ 
\alpha_{k} &=\frac{\vec{d}_{k}^T \vec{d}_{k}}{\vec{d}_{k}^T A \vec{d}_{k}}\\ 
\vec{x}_{k} &=\vec{x}_{k-1}+\alpha_{k} \vec{d}_{k} 
\end{aligned}
$$
所以对应代码如下：

```matlab
for i=1:maxIters
    % TODO:  Update curX
    d = rhs - A * curX;
    a1 = sum(d .* d, 1);
    a2 = diag(d' * A * d)';
    
    alpha = a1 / a2;
    curX = curX + alpha * d;
    
    
    % Display the current iterate
    curResult(unconstrainedVertices,:) = curX;
    plotGraph(curResult, edges, f);
    title(sprintf('Gradient descent iteration %d',i));
    drawnow;
    pause(.1);
end
```

(iii)算法如下：
$$
\begin{aligned} 
\text{Update search direction: }&\vec{v}_{k} =\vec{r}_{k-1}-\frac{\left\langle\vec{r}_{k-1}, \vec{v}_{k-1}\right\rangle_{A} }{\left\langle\vec{v}_{k-1}, \vec{v}_{k-1}\right\rangle_A} \vec{v}_{k-1} \\
\text{Line search: }&\alpha_{k} =\frac{\vec{v}_{k}^{\top} \vec{r}_{k-1} }{\vec{v}_{k}^{\top} A \vec{v}_{k} } \\ 
\text{Update estimate: }&\vec{x}_{k} =\vec{x}_{k-1}+\alpha_{k} \vec{v}_{k} \\ 
\text{Update residual: }&\vec{r}_k =\vec{r}_{k-1}-\alpha_{k} A \vec{v}_{k} 
\end{aligned}
$$
代码如下：

```matlab
%初始化
r = rhs - A * curX;
v = zeros(size(r)) + 1e-3;

for i=1:maxIters
    % TODO:  Update curX
    r1 = diag(r' * A * v)';
    v1 = diag(v' * A * v)';
    v = r - r1 ./ v1 .* v;
    alpha = diag(v' * r) ./ diag(v' * A * v);
    curX = curX + alpha' .* v;
    r = r - alpha' .* (A * v);

    % Display the current iterate
    curResult(unconstrainedVertices,:) = curX;
    plotGraph(curResult, edges, f);
    title(sprintf('Conjugate gradients iteration %d',i));
    drawnow;
    pause(.1);
end
```

(iv)共轭梯度法很快就收敛了。



#### Problem 2

(a)定义
$$
\begin{eqnarray*}
\vec x'&&= A^{-1}\vec b \tag 1 \\
\vec x_k &&=M^{-1}\left(N \vec{x}_{k-1}+\vec{b}\right)\tag 2\\
\vec{e}_{k}&&=\vec{x}_{k}-\vec{x}' \tag 3
\end{eqnarray*}
$$
下面考虑$\vec e_k$和$\vec e_{k-1}$的递推关系：
$$
\begin{aligned}
\vec e_k
&= \vec{x}_{k}-\vec{x}'\\
&=M^{-1}\left(N \vec{x}_{k-1}+\vec{b}\right) -\vec{x}'\\
&=M^{-1} N\left(
\vec x_{k-1} +N^{-1} (\vec b -M\vec x') 
\right)
\end{aligned}
$$
注意
$$
A=M-N
$$
所以由(1)可得
$$
\begin{aligned}
A\vec x ' &=(M-N)\vec x ' =\vec b\\
\vec b - M\vec x' &=-N\vec x'\\
N^{-1}(\vec b - M\vec x') &=-\vec x'
\end{aligned}
$$
因此
$$
\begin{aligned}
\vec e_k
&= M^{-1} N\left(
\vec x_{k-1} +N^{-1} (\vec b -M\vec x') 
\right)\\
&=G(\vec x_{k-1}- \vec x')\\
&=G \vec e_{k-1}
\end{aligned}
$$
递推可得
$$
\vec{e}_{k}=G^{k} \vec{e}_{0}
$$
假设$G$的特征值为$\lambda_1, \ldots ,\lambda_n$，对应的特征向量为$\vec v_1,\ldots ,\vec v_n$，记
$$
V=  \left(
 \begin{matrix}
  \vec v_1,\ldots ,\vec v_n
  \end{matrix}
  \right),\Lambda = 
  \text{diag}\{
  \lambda_1,\ldots,\lambda_n
 \}
$$
题目假设$\vec v_1,\ldots ,\vec v_n$张成$\mathbb R^n$，那么
$$
\begin{aligned}
G &=  V \Lambda V^{-1} \\
G^k&= V \Lambda^k V^{-1}
\end{aligned}
$$
因为$\lambda_i <1$，所以
$$
\begin{aligned}
\Lambda^k &\to 0 \\
G^k= V \Lambda^k V^{-1}  &\to 0 \\
\vec e_k &\to 0
\end{aligned}
$$
因此
$$
\vec x_k \to \vec x'
$$
(b)利用圆盘定理即可：

**圆盘定理**

假设$A\in \mathbb R^{n\times n}$为$n$阶矩阵，令
$$
R_{i}=\sum_{j \neq i}^{n}\left|a_{i j}\right|=\left|a_{i 1}\right|+\cdots+\left|a_{i, i-1}\right|+\left|a_{i, i+1}\right|+\cdots+\left|a_{i n}\right|
$$
那么$A$的特征值$z$在如下圆盘中
$$
\left|z-a_{ii}\right| \leqslant R_{i}, i=1,2, \cdots, n
$$
证明：任取$A$的特征值$\lambda_0$，对应的特征向量为$\vec x$，那么
$$
A\vec x = \lambda_0 \vec x
$$
写成方程形式为
$$
\left\{\begin{array}{l}{a_{11} x_{1}+a_{12} x_{2}+\cdots+a_{1 n} x_{n}=\lambda_{0} x_{1}} \\ {a_{21} x_{1}+a_{2 z} x_{2}+\cdots+a_{2 n} x_{n}=\lambda_{0} x_{2}} \\ {\ldots \ldots \ldots} \\ {a_{n 1} x_{1}+a_{n 2} x_{2}+\cdots+a_{n n} x_{n}=\lambda_{0} x_{n}}\end{array}\right.
$$
设
$$
|x_r| =\max \{\left|x_{1}\right|,\left|x_{2}\right|, \cdots,\left|x_{n}\right|\}
$$
那么
$$
\left(\lambda_{0}-a_{r r}\right) x_{r}=a_{r 1} x_{1}+\cdots+a_{r, r-1} x_{r-1}+a_{r , r+ 1} x_{r+1}+\cdots+a_{r n} x_{n}
$$
于是
$$
\begin{aligned}
\left|\lambda_{0}-a_{r r}\right|\left|x_{r}\right|
&\le \left|a_{r 1}\right|\left|x_{\mathrm{l}}\right|+\cdots+\left|a_{r, r-1}\right|\left|x_{r-1}\right|+\left|a_{r, r-1}\right|\left|x_{r+1}\right| +\cdots+\left|a_{r n}\right|\left|x_{n}\right|\\
&=\left(\left|a_{r 1}\right|+\cdots+\left|a_{r, r-1}\right|+\left|a_{r, r \rightarrow 1}\right|+\cdots+\left|a_{r n}\right|\right)\left|x_{r}\right|
\end{aligned}
$$
即
$$
\left|\lambda_{0}-a_{r r}\right|\left|x_{r}\right|\le  R_{r}\left|x_{r}\right|
$$
但是显然$| x_r|>0 $，所以
$$
\left|\lambda_{0}-a_{r r}\right|\le  R_{r}
$$


回到原题，我们有
$$
\begin{aligned}
R_{i}&=\sum_{j \neq 1}^{n}\left|g_{i j}\right|\\
&=\left|g_{i 1}\right|+\cdots+\left|g_{i, i-1}\right|+\left|g_{i, i+1}\right|+\cdots+\left|g_{i n}\right|\\
&=\frac {1}{|a_{ii}|} \left(\left|a_{i 1}\right|+\cdots+\left|a_{i, i-1}\right|+\left|a_{i, i+1}\right|+\cdots+\left|a_{i n}\right|\right) \\
&<1
\end{aligned}
$$
而$g_{ii}=0$，所以$G​$的特征值满足
$$
|\lambda|<R_i  < 1
$$
因此收敛。



#### Problem 3

如果
$$
\sum_{i=1}^n a_i \vec x_i =\vec 0
$$
左乘$\vec x_k^TA,k=1,\ldots,n$可得
$$
\sum_{i=1}^n a_i\vec x_k^TA\vec x_i 
=a_k\vec x_k^TA\vec x_k +\sum_{i\neq k} a_i\vec x_k^TA\vec x_i 
= 0 \tag 1
$$
由$A​$正交的定义可得
$$
\vec x_i ^T A \vec x_j =0 ,i\neq j
$$
所以(1)即为
$$
a_k (\vec x_k^TA\vec x_k)=0
$$
如果$A$正定，$\vec x_k$非零，那么
$$
a_k=0,k=1,\ldots,n
$$
此时$\vec x_i$线性无关。

如果$A$半正定，那么因为$\vec x_k^TA\vec x_k$可能为$0$，所以无法判断$a_k$，即此时无法推出$\vec x_i$线性无关。