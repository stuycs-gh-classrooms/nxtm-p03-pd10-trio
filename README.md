[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/-jWdCFXs)
## Project 00
### NeXTCS
### Period: 10
## Thinker0: Alex J
## Thinker1: Tashfia Diha
## Thinker2: OTHER NAME HERE (delete this line if you are a duo)
---

This project will be completed in phases. The first phase will be to work on this document. Use github-flavoured markdown. (For more markdown help [click here](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) or [here](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax) )

All projects will require the following:
- Researching new forces to implement.
- Method for each new force, returning a `PVector`  -- similar to `getGravity` and `getSpring` (using whatever parameters are necessary).
- A distinct demonstration for each individual force (including gravity and the spring force).
- A visual menu at the top providing information about which simulation is currently active and indicating whether movement is on or off.
- The ability to toggle movement on/off
- The ability to toggle bouncing on/off
- The user should be able to switch _between_ simluations using the number keys as follows:
  - `1`: Gravity
  - `2`: Spring Force
  - `3`: Drag
  - `4`: Custom Force
  - `5`: Combination


## Phase 0: Force Selection, Analysis & Plan
---------- 

#### Custom Force: ELectrostatic force

### Custom Force Formula
(k*q1*q2)/r^2

### Custom Force Breakdown
- What information that is already present in the `Orb` or `OrbNode` classes does this force use?
  - mass
  - centers

- Does this force require any new constants, if so what are they and what values will you try initially?
  - charge
  - k = 9*10^9 

- Does this force require any new information to be added to the `Orb` class? If so, what is it and what data type will you use?
  - int charge

- Does this force interact with other `Orbs`, or is it applied based on the environment?
  - It will interact with the neighboring orbs based on their random charge

- In order to calculate this force, do you need to perform extra intermediary calculations? If so, what?
  - Distance calculations
  - We'd need to find the magnitude of the force and then multiply it by the distance vector

--- 

### Simulation 1: Gravity
A fixed orb (Earth) will influence all other orbs. This will be an overhead solar system like view. The fixed orb will be at the center.

--- 

### Simulation 2: Spring
Describe what your spring simulation will look like. Explain how it will be setup, and how it should behave while running.
Springs will be attached to each orb and as they bounce, springs will change color depending on if they are compressed, at normal length, or not.

--- 

### Simulation 3: Drag
When the orbs cross the bottom half of the screen, they feel drag.

--- 

### Simulation 4: Custom force
Either we have the same simulation as gravity but with the electrostatic force as the centripital force or unordered charged particles apply the electrostatic force to their neighbors.

### Simulation 5: Combination
All of the forces applied to the solar system 2D model
