Design Pattern

Emergency Stop Patterns

The first design pattern I use is the emergency stop pattern because let upgrade the contract in the future if is need it to repair the bugs and make it strong

So using this pattern I can pause the contract, guard the contract if a critical bug is discovered, and I can solve the problems detected

I used isStopped (bool to control the emergency), stoppedInEmergency (to check if we are in normal or emergency state), stopContract (to stop transfer money), resumeContract (to back to the normal state)

Mortal

The second one was the mortal desing pattern, because in case if necessary let me destroy the contract and remove it from the blockchain

Was implement with the function close(), that destroy the contract