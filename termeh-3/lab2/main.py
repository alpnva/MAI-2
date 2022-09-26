import numpy as np
import math
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
import sympy as sp
Steps = 1001
t = np.linspace(0, 10, Steps)

phi = np.sin(t + 22.5)
ksi = np.cos(1.1 * t**2 - 3) + np.sin(2 * t**2 + 2) + 7

CircleX_0 = 4
R = 1 # радиус окружности
X_O = 3 # координаты точки О
Y_O = 10

X_A = ksi * np.sin(phi) + X_O
Y_A = - ksi * np.cos(phi) + Y_O

X_C = X_O + ksi * np.sin(phi) + R * np.cos(phi)
Y_C = Y_O - ksi * np.cos(phi) + R * np.sin(phi)

Vx0 = np.diff(X_A) 
Vy0 = np.diff(Y_A)

Ax0 = np.diff(Vx0)
Ay0 = np.diff(Vy0)

angle = np.linspace(0, np.pi*2, 150)
X_Circle = R*np.cos(angle)
Y_Circle = R*np.sin(angle)

X_Ground = [0, 6] # это подвес, на котором держится точка О
Y_Ground = [10, 10]
lSt= 10
fig = plt.figure(figsize=[lSt + 0.5, lSt + 0.5])
ax = fig.add_subplot(1, 2, 1)
ax.set(xlim=[X_O - (lSt + 0.5), X_O + (lSt + 0.5)],
       ylim=[Y_O/2 - (lSt + 0.5), Y_O/2 + (lSt + 0.5)])

ax.plot(X_Ground, Y_Ground, color='black', linewidth=3)
Drawed_Circle = ax.plot(X_C[0]+X_Circle, Y_C[0]+Y_Circle)[0]
Line_OA = ax.plot([X_O, Y_O], [X_A[0], Y_A[0]])[0] # линия, соединяющая точки O и А

Point_O = ax.plot(X_O, Y_O, marker='o', markersize=10)[0]
Point_A = ax.plot(X_A[0], Y_A[0], marker='o')[0]
Point_C = ax.plot(X_C[0], Y_C[0], marker='o')[0]

ax1 = fig.add_subplot(4, 2, 2)
ax1.plot(Vx0)
plt.title('Vx dot A')
plt.xlabel('t values')
plt.ylabel('Vx values')

ax1 = fig.add_subplot(4, 2, 4)
ax1.plot(Vy0)
plt.title('Vy dot A')
plt.xlabel('t values')
plt.ylabel('Vy values')

ax1 = fig.add_subplot(4, 2, 6)
ax1.plot(Ax0)
plt.title('Ax of dot A')
plt.xlabel('t values')
plt.ylabel('Ax values')

ax1 = fig.add_subplot(4, 2, 8)
ax1.plot(Ay0)
plt.title('Ay of dot A')
plt.xlabel('t values')
plt.ylabel('Ay values')
def Kino(i):
    Point_O.set_data(X_O, Y_O)
    Point_A.set_data(X_A[i], Y_A[i])
    Line_OA.set_data([X_O, X_A[i]], [Y_O, Y_A[i]])

    Point_C.set_data(X_C[i], Y_C[i])
    Drawed_Circle.set_data(X_C[i]+X_Circle, Y_C[i]+Y_Circle)
    return [Point_O, Point_A, Point_C, Line_OA]

anima = FuncAnimation(fig, Kino, frames=Steps, interval=10)

plt.show()
