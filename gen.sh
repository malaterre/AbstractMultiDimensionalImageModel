#!/bin/bash
#<DataAt indexWithinDimension="29" descriptorUUID="1fbe0106-6c20-4cf9-b659-ce6185527ace" bulkDataUUID="1b2f1021-b724-4db4-a877-53a6895c5385"/>

for j in {1..1}; do
  uid0=$(uuidgen -r); 
  echo "<DataAt indexWithinDimension=\"$j\" descriptorUUID=\"$uid0\">"
  echo "<DimensionalData dimensionID=\"3\">"
  for i in {1..200}; do
    uid1=$(uuidgen -r); 
    uid2=$(uuidgen -r); 
    #echo "$uid1 $uid2";
    echo "<DataAt indexWithinDimension=\"$i\" descriptorUUID=\"$uid0\" bulkDataUUID=\"$uid2\"/>"
  done
  echo "</DimensionalData>"
  echo "</DataAt>"
done
