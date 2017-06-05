Python version of Thoughtworks Rover challenge.

### Dependencies and Install
Python 2.7

```
pip install -r requirements.txt
```

### How to Run Against Files:

```
$ cd roverpy
$ ./bin/run -f ./lib/missions/mission_a.txt // or this will default to mission_b.txt
```

You can visualize a completed mission with the `-v` flag:

```
$ cd roverpy
$ ./bin/run -verbose -f ./lib/missions/mission_a.txt // or this will default to mission_b.txt
```

### How to Run Tests:

```
$ nosetests --nocapture
```