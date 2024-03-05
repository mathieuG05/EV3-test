#!/usr/bin/env pybricks-micropython
from pybricks.hubs import EV3Brick
from pybricks.ev3devices import (Motor, TouchSensor, ColorSensor,
                                 InfraredSensor, UltrasonicSensor, GyroSensor)
from pybricks.parameters import Port, Stop, Direction, Button, Color
from pybricks.tools import wait, StopWatch, DataLog
from pybricks.robotics import DriveBase
from pybricks.media.ev3dev import SoundFile, ImageFile
import math
import time

# Ces premières lignes sont similaires à celles de vos autres fichiers Python,
# ici elles chargent les éléments qui permettent de travailler avec le robot

# La ligne qui suit associe la brique au nom ev3
ev3 = EV3Brick()

# Cette ligne définit les ports
mot_gau = Motor(Port.F)
mot_dro = Motor(Port.E)
cap_cou = ColorSensor(Port.B)
det_con = TouchSensor(port.C)

diam=54.9 #Diamètre des roues en mm
largeur=105 #Distance entre les deux roues en mm

# On définit les cararctéristiques du robot avec, dans l'ordre, le nom
# des moteurs gauche et droite, le diamètre des roues et la distance qui
# sépare le centre de chaque roue.
robot = DriveBase(mot_gau, mot_dro, diam, largeur)

# On définit, dans l'ordre, la vitesse en mm/s, l'accélération en mm/s/s, la vitesse de rotation sur 
# lui-même en deg/s, l'accélération de rotation en deg/s/s.
robot.settings(500, 50, 100, 20)

# Cette commande fait "bipper" le robot à la fin du mouvement.
ev3.speaker.beep()

#1 Faire avancer le robot de 1m
robot.drive(1000, 500)

#2 Faire un cercle de 20cm de rayon
robot.drive(20, -360, 150)

#3 Faire avancer le robot
while not contact_sensor pressed():
    robot.drive(100, 0)

#4 Faire attendre 5 secondes
time.sleep(5)

#5 Faire reculer de 1 mètre
robot.drive(-1, 300)

#6 Tourner sur lui-même sans faire de cercle dans le sens anti-horaire
robot.drive(0, -90, 150)

#7 Faire un mouvement de ressort en avancant et reculant pendant 2 périodes
T = 2 # Définir la durée de chaque période
t = 10
N = 150

# Boucle pour deux périodes
for _ in range(T):
    for i in range(N):
        angle = math.cos(i / N * 2 * math.pi)  # Calculer l'angle en utilisant la fonction cosinus
        vitesse = 500 * angle  # Utiliser l'angle pour déterminer la vitesse
        robot.drive(vitesse, 0)  # Déplacer le robot avec la vitesse calculée
        time.sleep(t / N)
robot.stop()
