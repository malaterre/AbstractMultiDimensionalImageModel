#!/bin/bash

for i in {1..200}; do
  echo "<Origin index=\"$i\" xCoord=\"12.3\" yCoord=\"4.56\" zCoord=\"7.89\"/>"
done
for i in {1..200}; do
  echo "<DirectionCosines concernedSpatialDimension=\"1\" index=\"$i\" cosAlongX=\"1.0\" cosAlongY=\"0.0\" cosAlongZ=\"0.0\"/>"
done
for i in {1..200}; do
  echo "<DirectionCosines concernedSpatialDimension=\"2\" index=\"$i\" cosAlongX=\"0.0\" cosAlongY=\"1.0\" cosAlongZ=\"0.0\"/>"
done
