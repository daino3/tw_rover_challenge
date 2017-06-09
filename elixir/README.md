ThoughtWorks: Rover Challenge
=================================
### Language: Elixir

### Dependencies and Install
Elixir 

```buildoutcfg
mix deps.get
```

### How to Run Against Files:

```buildoutcfg
$ cd elixir
$ ./rover_challenge --file data/mission_b.txt // or this will default to mission_a.txt
```

You can visualize a completed mission with the `--verbose` flag [TODO]:

```buildoutcfg
$ cd roverpy
$ ./rover_challenge --verbose --file data/mission_b.txt // or this will default to mission_b.txt
```

You can rebuild the CLI executable with:

```buildoutcfg
mix escript.build

```

### How to Run Tests:

```
$ mix test
```