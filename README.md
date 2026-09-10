# Xtreme Pursuit Rallye — Perfection meets Speed

A top-down rally racing game built with the Godot Engine, inspired by classic 90's
top-down rally games such as *Neo Drift Out* and *Super Drift Out: World Rally Championships*.
The focus is on tight time-trial gameplay, competitive leaderboards, and a retro pixel-art style.

## Concept

- Rally-style racing game
- Focus on best-time runs (time trials)
- Competitive leaderboard
- Hand-designed tracks with varied obstacles
- Retro pixel-art visual style

## Features

### Movement
- Acceleration / braking
- Top speed handling
- Dynamic camera following the car
- Steering / direction control

### Environment Interactions
- Custom collision detection
- Start and finish line logic
- Interactive obstacles

### Map & Obstacles
Built using Godot's Tile system (TileSet → TileMap workflow), with pixel-art assets
sourced from Spriters-Resource.com and post-processed in GIMP (background transparency).

Map elements:
- **Decoration** — visual-only tiles
- **Obstacles**
- 
### User Interface
- Main menu
- Sound design / background music

## Technical Implementation

Obstacle objects are built using:
- An `AnimatedSprite2D` child node for the visual animation (via a `SpriteFrames` resource)
- A `CollisionShape2D` child node to define the interaction zone, detect collisions with
  the rally car.

## Technologies

Godot Engine, GDScript, Tile-based level design, 2D collision & animation systems

## Status

Work in progress — developed as a university project.
