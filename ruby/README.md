ThoughtWorks: Rover Challenge
=================================
### Language: Ruby
### Design Overview:
I designed 4 models: a Rover, a Terrain, a Mission, and a Visualizer. The Rover model holds all of the logic of movement and positioning. The Terrain model is initialized with latitude and longitude values which represent the ~length and ~width of the rectangular map (add 1 because of the 0 index). A Terrain object is initialized as a hash which was (I believe) easier to navigate than a nested array. The keys of the terrain landscape hash represent the longitudinal coordinates and the values represent an array of latitudinal coordinates. The Mission model is what parses the text file and maps the relevant information for the creation of terrain and rover objects. Mission#mission_complete! prints the final coordinates of the rover after the movement intructions are passed to the Rover objects. A Visualizer object is instantiated via Mission#display_mission! which shows a visual representation of the mission - something that was helpful to make sure everything I expected to happen was actually happening, but not necessary to complete the challenge.

### Design Assumptions:
The main assumption I used was that rovers can currently be given 'poor' instructions. Rovers who move too far to the right will simply create new latitudinal elements and rovers that move too far to the left will show on the other side of the map (similar to Pac Man). I could have incorporated logic to break the program if they went off the map or could have incorporated logic to make the entire program run like Pac Man, but since the challenge did not specify these constraints, I just assumed that all instructions fed to the program would be 'correct'.

### To Initiate Program Run:
```
ruby driver.rb
``` 

### To Initiate Tests Run:
```
rspec specs/*
``` 