#### Problem 1

(a)由定义，我们有
$$
\begin{aligned}
C&= LL^T\\
&= \left(
 \begin{matrix}
   L_{11} & \vec 0 & 0 \\
   \vec l_k^T & l_{kk} & \vec 0^T \\
  L_{31} &  \vec l_k' & L_{33}
  \end{matrix}
  \right)
  \left(
 \begin{matrix}
   L_{11}^T &    \vec l_k &   L_{31}^T \\
   \vec0^T & l_{kk} & \vec l_k'^T \\
  0 &  \vec 0 & L_{33}^T
  \end{matrix}
  \right)\\
  &=\left(
 \begin{matrix}
   L_{11}  L_{11}^T &  L_{11}\vec l_k &   L_{11} L_{31}^T \\
   \vec l_k^T   L_{11}^T &  \vec l_k^T \vec l_k+l_{kk}^2 &
   \vec l_k^T L_{31}^T+l_{kk}\vec l_k'^T \\
  * &     * &    *
  \end{matrix}
  \right)
\end{aligned}
$$
所以
$$
\begin{aligned}
\vec l_k^T   L_{11}^T &=\vec c_k^T \\
\vec l_k^T \vec l_k+l_{kk}^2&= c_{kk}
\end{aligned}
$$
即
$$
\begin{aligned}
 L_{11}\vec l_k &=\vec c_k \\
l_{kk}&= \sqrt {c_{kk}-\Arrowvert \vec l_k\Arrowvert_2^2}
\end{aligned}
$$
所以可以利用上式对$k=1,...,n$遍历求解。

(b)
$$
\begin{aligned}
2\text{proj}_{\vec v} \vec b -\vec b
&= 2\frac{\vec v .\vec b}{\vec v .\vec v}\vec v - \vec b \\
&=2\vec v.\frac{\vec v^T\vec b}{\vec v^T\vec v} - \vec b \\
&=\Big(\frac{2\vec v\vec v^T}{\vec v^T\vec v}-I_n \Big)\vec b\\
&\triangleq -H_{\vec v}\vec b
\end{aligned}
$$
下面验证其正交性：
$$
\begin{aligned}
H_{\vec v}^T H_{\vec v}
&=\Big(I_n -\frac{2\vec v\vec v^T}{\vec v^T\vec v}\Big)^T\Big(I_n -\frac{2\vec v\vec v^T}{\vec v^T\vec v} \Big)\\
&=\Big(I_n -\frac{2\vec v\vec v^T}{\vec v^T\vec v}\Big)\Big(I_n -\frac{2\vec v\vec v^T}{\vec v^T\vec v}\Big)\\
&=I_n+\frac{2\vec v\vec v^T}{\vec v^T\vec v}\frac{2\vec v\vec v^T}{\vec v^T\vec v}-\frac{2\vec v\vec v^T}{\vec v^T\vec v}-\frac{2\vec v\vec v^T}{\vec v^T\vec v} \\
&=I_n+\frac{4(\vec v\vec v^T)(\vec v^T\vec v)}{(\vec v^T\vec v)(\vec v^T\vec v)}
-\frac{4\vec v\vec v^T}{\vec v^T\vec v} \\
&=I_n+\frac{4\vec v\vec v^T}{\vec v^T\vec v}-\frac{4\vec v\vec v^T}{\vec v^T\vec v}\\
&=I_n
\end{aligned}
$$
(c)只要找到反射平面的方向向量$\vec v $即可，作图后不难发现，可以取
$$
\vec v = \vec x - \vec y
$$
然后计算反射矩阵，不失一般性，这里假设
$$
\Arrowvert \vec x \Arrowvert _2= \Arrowvert \vec y \Arrowvert _2=1
$$
计算可得：
$$
\begin{aligned}
H_{\vec v}
&= I_n - \frac{2\vec v\vec v^T}{\vec v^T\vec v}\\
&=I_n - \frac{2(\vec x - \vec y)(\vec x - \vec y)^T}{(\vec x - \vec y)^T(\vec x - \vec y)}\\
&=I_n-\frac{2(\vec x \vec x^T- \vec y\vec x^T-\vec x\vec y^T + \vec y\vec y^T)}
{\vec x^T\vec x - 2\vec y^T\vec x+\vec y^T\vec y }\\
&=I_n-\frac{2(\vec x \vec x^T- \vec y\vec x^T-\vec x\vec y^T + \vec y\vec y^T)}
{2 - 2\vec y^T\vec x }\\
&=I_n-\frac{\vec x \vec x^T- \vec y\vec x^T-\vec x\vec y^T + \vec y\vec y^T}
{1 - \vec y^T\vec x }\\
\end{aligned}
$$
最后验证结论：
$$
\begin{aligned}
- H_{\vec v}\vec x &= 
 \Big(\frac{\vec x \vec x^T- \vec y\vec x^T-\vec x\vec y^T + \vec y\vec y^T}
{1 - \vec y^T\vec x }-I_n\Big) \vec x \\
 &= \frac{(\vec x \vec x^T- \vec y\vec x^T-\vec x\vec y^T + \vec y\vec y^T)\vec x }
{1 - \vec y^T\vec x } -\vec x \\
&=\frac{\vec x (\vec x^T\vec x)- \vec y(\vec x^T\vec x)-\vec x(\vec y^T\vec x) +\vec y(\vec y^T\vec x) }{1 - \vec y^T\vec x } -\vec x\\
&=\frac{\vec x - \vec y-\vec x(\vec y^T\vec x) +\vec y(\vec y^T\vec x) }{1 - \vec y^T\vec x } -\vec x\\
&=\frac{(1 - \vec y^T\vec x )\vec x - (1 - \vec y^T\vec x )\vec y }
{1 - \vec y^T\vec x } -\vec x\\
&=\vec x -\vec y -\vec x \\
&=-\vec y 
\end{aligned}
$$
即
$$
H_{\vec v} \vec x  =\vec  y
$$



#### Problem 2

(a)因为$A$是半正定正交矩阵，所以存在正交矩阵$Q$和对角元全大于$0$的对角阵$\Lambda $，使得
$$
A=Q\Lambda Q^T
$$
记
$$
\Lambda = \text{diag}\{ \lambda_1,...,\lambda_n\}\\
\Lambda_1 = \text{diag}\{ \sqrt{\lambda_1},..., \sqrt{\lambda_n}\}
$$
那么
$$
\Lambda = \Lambda_1^2
$$
所以
$$
A=Q\Lambda_1^2 Q^T =(Q\Lambda_1 Q^T)(Q\Lambda_1 Q^T) \triangleq (\sqrt A)^2
$$
(b)大部分矩阵的平方根不唯一，因为上述对角阵对角元的次序可以改变。

(c)注意到我们有
$$
A^2 = Q\Lambda Q^T Q\Lambda Q^T=Q\Lambda^2 Q^T \\
\ldots\\
A^k =Q\Lambda^k Q^T \\
$$
所以
$$
\begin{aligned}
e^A
&= \sum_{k=0} ^{\infty}\frac 1 {k!} A^k\\
&=\sum_{k=0} ^{\infty}\frac 1 {k!} A^k\\
&=\sum_{k=0} ^{\infty}\frac 1 {k!}Q\Lambda^k Q^T\\
&=Q\Big(\sum_{k=0} ^{\infty}\frac 1 {k!}\Lambda^k\Big)Q^T\\
&=Q e^{\Lambda }Q^T
\end{aligned}
$$
(d)由定义，我们有
$$
\begin{aligned}
e^{A+B}&= \sum_{k=0} ^{\infty}\frac 1 {k!} (A+B)^k\\
e^{A}e^B&= \Big(\sum_{i=0} ^{\infty}\frac 1 {i!} A^i\Big)\Big(\sum_{j=0} ^{\infty}\frac 1 {j!} B^j\Big)\\
&=\sum_{i=0}^{\infty}\sum_{j=0}^{\infty}
\frac 1 {i!} A^i\frac 1 {j!} B^j \\
&=\sum_{k=0}^{\infty}\frac 1 {k!} \sum_{i+j=k}
\frac {k!} {i!j!} A^iB^j
\end{aligned}
$$
接着，对$(A+B)^k$展开，因为$AB=BA​$，所以可以使用二项式定理，即
$$
(A+B)^k =  \sum_{i+j=k}
\frac {k!} {i!j!} A^iB^j
$$
因此
$$
\begin{aligned}
e^{A}e^B
&=\sum_{k=0}^{\infty}\frac 1 {k!} \sum_{i+j=k}
\frac {k!} {i!j!} A^iB^j \\
&=\sum_{k=0}^{\infty}\frac 1 {k!} (A+B)^k \\
&=e^{A+B}
\end{aligned}
$$
(e)首先考虑$e^{At}​$的求导运算，利用(c)，我们有
$$
e^{At}= \sum_{k=0} ^{\infty}\frac 1 {k!} A^k t^k
$$
因此
$$
\begin{aligned}
\frac {d e^{At}}{dt}
&=\sum_{k=0} ^{\infty}\frac 1 {k!} A^kk t^{k-1}\\
&=A\sum_{k=1}^{\infty}\frac 1 {(k-1)!} A^{k-1}t^{k-1} \\
&= Ae^{At}
\end{aligned} 
$$
接着验证题目中解即可
$$
\begin{aligned}
\vec y'(t)&= -Ae^{-At} \vec y _0\\
&=-A \vec y (t)
\end{aligned}
$$
所以结论成立。最后考虑$t\to \infty $时解的性质，注意我们有
$$
\begin{aligned}
e^{-At}
&= \sum_{k=0} ^{\infty}\frac 1 {k!} (-At)^k\\
&= \sum_{k=0} ^{\infty}\frac 1 {k!} A^k(-t)^k\\

&=\sum_{k=0} ^{\infty}\frac 1 {k!}Q\Lambda^kQ^T(-t)^k\\
&=Q\Big(\sum_{k=0} ^{\infty}\frac 1 {k!}(-\Lambda t)^k\Big)Q^T\\
&=Q e^{-\Lambda t}Q^T 
\end{aligned}
$$
因为
$$
\frac 1 {k!}(-\Lambda t)^k
$$
为对角矩阵，所以
$$
e^{-\Lambda t}=\sum_{k=0} ^{\infty} \frac 1 {k!}(-\Lambda t)^k
$$
也为对角矩阵，其对角元第$i$个元素为
$$
e^{-\lambda_i t}
$$
因为$\lambda_i >0$，所以当$t\to \infty$时，上式趋于$0$，即
$$
e^{-\Lambda t} \to \text{diag}\{0,...,0\}
$$
因此
$$
e^{-At}= Q e^{-\Lambda t}Q^T  \to 0
$$



#### Problem 3

(a)直接验证即可
$$
\begin{aligned}
A^T (I_m- QQ^T)
&=R^TQ^T(I_m- QQ^T)\\
&=R^TQ^T-R^TQ^TQQ^T\\
&=R^TQ^T-R^TQ^T\\
&=0
\end{aligned}
$$
所以结论成立。

(b)因为
$$
\vec a = \frac {\vec a }{\Arrowvert \vec a \Arrowvert}.\Arrowvert \vec a \Arrowvert
$$
利用第五讲的定义可得
$$
Q_1 =  \frac {\vec a }{\Arrowvert \vec a \Arrowvert}, R_1 = \Arrowvert \vec a \Arrowvert
$$
(c)注意上式等价于
$$
AQ^T =R
$$
所以只要利用正交矩阵对$A$做列变换，使得最终结果为上三角阵即可，所以存在上述分解。

(d)注意上式等价于
$$
Q^T A=L
$$
所以只要利用正交矩阵对$A​$做行变换，使得最终结果为下三角阵即可，所以存在上述分解。

