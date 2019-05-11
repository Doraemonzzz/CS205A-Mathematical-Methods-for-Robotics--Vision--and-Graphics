#### Problem 1

(a)$E_1$测量$f$和$f_0$的误差，$E_2$测量$f$的光滑性。

(b)该式表示关于$g$的相对变化率。

(c)
$$
\begin{aligned}
d E_{1}(f, g)
&= \frac{d}{d \epsilon}  \int_{0}^{1}\left(f(t)+\epsilon g(t)-f_{0}(t)\right)^{2} d t\left.\right|_{\epsilon=0} \\
&=   \int_{0}^{1}2\left(f(t)+\epsilon g(t)-f_{0}(t)\right)g(t) d t\left.\right|_{\epsilon=0}\\
&= 2\int_{0}^{1}\left(f(t)-f_{0}(t)\right)g(t) d t\\

d E_{2}(f, g)
&= \frac{d}{d \epsilon} \int_{0}^{1}
\left(f^{\prime}(t)+\epsilon g'(t)\right)^{2} d t\left.\right|_{\epsilon=0} \\
&=   \int_{0}^{1}2\left(f^{\prime}(t)+\epsilon g'(t)\right)g'(t) d t\left.\right|_{\epsilon=0}\\
&=2 \int_{0}^{1} f'(t)g'(t) d t\\
&= 2 \int_{0}^{1}f'(t) d(g(t))\\
&=2 \left(f'(t)g(t)\Big |_{t=0}^{t=1} - \int_{0}^{1}f''(t)g(t) dt\right) \\
&=-2\int_{0}^{1}f''(t)g(t) dt
\end{aligned}
$$
(d)由(c)可得
$$
d E(f)
=2\int_{0}^{1}\left(f(t)-f_{0}(t)-\alpha f''(t)\right)g(t) d t =0
$$
所以可以近似认为
$$
f(t)-f_{0}(t)=\alpha f''(t)
$$
(e)这部分感觉有点问题，这里略过。



#### Problem 2

假设$a_i$存在数组$a$中，那么利用如下算法即可在$O(k)$时间内计算出$f(x)$：

```python
res = 0
s = 1
for i in a:
    res += i * s
    s *= x
```



#### Problem 3

(a)设
$$
g(x)= p\left(x-\frac {a+b} 2\right)^2 +q\left(x-\frac {a+b} 2\right) +r
$$
那么
$$
\begin{aligned}

g'(x)&= 2p\left(x-\frac {a+b} 2\right) + q
\end{aligned}
$$
因为
$$
\begin{aligned}
f^{\prime}(a)&=g^{\prime}(a)\\
f^{\prime}(b)&=g^{\prime}(b)\\
g\left(\frac{a+b}{2}\right)&=f\left(\frac{a+b}{2}\right)
\end{aligned}
$$
所以
$$
\begin{aligned}
f\left(\frac{a+b}{2}\right)&=r\\
 f'(a)&=2p\left(a-\frac {a+b} 2\right) + q\\
f'(b)&=2p\left(b-\frac {a+b} 2\right) + q
\end{aligned}
$$
解得
$$
\begin{cases}

p&=\frac{f'(a)-f'(b)}{2(a-b)} \\
q&= \frac {f'(a)+f'(b)}{2}\\
r&=f\left(\frac{a+b}{2}\right) 
\end{cases}
$$
因此
$$
g(x) = \frac{f'(a)-f'(b)}{2(a-b)} \left(x-\frac {a+b} 2\right)^2 +\frac {f'(a)+f'(b)}{2}\left(x-\frac {a+b} 2\right) +f\left(\frac{a+b}{2}\right)
$$
(b)对$g(x)​$积分可得
$$
\begin{aligned}
\int_a^b g(x) dx
&= \frac{f'(a)-f'(b)}{2(a-b)}\int_a^b \left(x-\frac {a+b} 2\right)^2 dx
+\frac {f'(a)+f'(b)}{2}\int_a^b\left(x-\frac {a+b} 2\right) dx 
+f\left(\frac{a+b}{2}\right)\int_a^b dx \\
&=-\frac{f'(a)-f'(b)}{2(a-b)} \times \frac 2 3 \times\left(\frac {a-b} 2\right)^3
+ f\left(\frac{a+b}{2}\right)(b-a)\\
&=(b-a)\left (f\left(\frac{a+b}{2}\right) +\frac 1 {24}\left(f'(b)-f'(a)\right)
(b-a)\right)
\end{aligned}
$$
(c)为方便叙述，记
$$
c=\frac 1 2(a+b)
$$
那么$f​$在$c​$处的泰勒展开为
$$
f(x)=f(c)+f^{\prime}(c)(x-c)+\frac{1}{2} f^{\prime \prime}(c)(x-c)^{2}+\frac{1}{6} f^{\prime \prime \prime}(c)(x-c)^{3}+\frac{1}{24} f^{\prime \prime \prime \prime}(c)(x-c)^{4}+\cdots \tag 1
$$
对上式积分可得
$$
\int_{a}^{b} f(x) d x=(b-a) f(c)+\frac{1}{24} f^{\prime \prime}(c)(b-a)^{3}+\frac{1}{1920} f^{\prime \prime \prime \prime}(c)(b-a)^{5}+\cdots \tag 2
$$
注意
$$
\begin{aligned}
\int_a^b g(x) dx&= (b-a)\left (f\left(\frac{a+b}{2}\right) +\frac 1 {24}\left(f'(b)-f'(a)\right)
(b-a)\right) \\
&=(b-a)\left (f\left(c\right) +\frac 1 {24} f''(\xi)
(b-a)^2\right) & a\le \xi \le b \\
&=(b-a)f(c) + \frac 1 {24} f''(\xi) (b-a)^3
\end{aligned}
$$
所以(2)可以化为
$$
\begin{aligned}
\int_{a}^{b} f(x) d x&=(b-a) f(c)+ \frac 1 {24} f''(\xi) (b-a)^3-\frac 1 {24} f''(\xi) (b-a)^3+\frac{1}{24} f^{\prime \prime}(c)(b-a)^{3}+O((b-a)^5)\\
&=\int_a^b g(x) dx +O((b-a)^3)
\end{aligned}
$$
所以精度为$3​$次。

(d)假设
$$
\Delta x = \frac{b-a}{k}, x_{i}= a+i \Delta x,i=0,\ldots , k
$$
那么复合求积公式为
$$
\int_{a}^{b} f(x) d x \approx \sum_{i=0}^{k-1}
\Delta x \left (f\left(\frac{x_i+x_{i+1}}{2}\right) +\frac 1 {24}\left(f'(x_{i+1})-f'(x_i)\right)
\Delta x\right)
$$



#### Problem 4

利用范德蒙行列式计算结果：
$$
\left( \begin{array}{ccccc}
{1} & {x_{1}} & {x_{1}^{2}} & {\cdots} & {x_{1}^{k-1}} \\ {1} & {x_{2}} & {x_{2}^{2}} & {\cdots} & {x_{2}^{k-1}} \\ {\vdots} & {\vdots} & {\vdots} & {\cdots} & {\vdots} \\ {1} & {x_{k}} & {x_{k}^{2}} & {\cdots} & {x_{k}^{k-1}}
\end{array}\right)
\left( \begin{array}{c}
{a_{0}} \\ {a_{1}} \\ {\vdots} \\ {a_{k-1}}
\end{array}\right)=

\left( \begin{array}{c}{y_{1}} \\ {y_{2}} \\ {\vdots} \\ {y_{k}}\end{array}\right)
$$
对应代码如下：

```python
import numpy as np
import matplotlib.pyplot as plt

def Vandermon(X, k):
    #维度
    n = X.shape[0]
    #计算结果
    res = np.ones(n).reshape(-1, 1)
    x = np.copy(X)
    for i in range(k):
        res = np.c_[res, x]
        x *= X
    
    return res

x1 = np.linspace(-1, 1, 500).reshape(-1, 1)

K = [3, 5, 7, 9, 11]
for k in K:
    X = np.linspace(-1, 1, k).reshape(-1, 1)
    y = np.abs(X)
    Van = Vandermon(X, k-1)
    #计算系数
    a = np.linalg.solve(Van, y)
    #计算结果
    y1 = Vandermon(x1, k-1).dot(a)
    plt.plot(x1, y1, label="degree={}".format(k))
    
plt.legend()
plt.show()
```

图像结果如下：

![](https://github.com/Doraemonzzz/md-photo/blob/master/CS205A/hw7/ps4.png?raw=true)

不难看出，随着次数增加，曲线变化幅度越来越大。

