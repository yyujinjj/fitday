import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopwatch App',
      theme: ThemeData.dark(),
      home: HistoryScreen(),
    );
  }
}

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<Exercise> history = [];

  final TextEditingController _nameController = TextEditingController();
  Duration _duration = Duration(seconds: 0);
  IconData _icon = Icons.fitness_center;

  void _addExercise() {
    setState(() {
      history.add(Exercise(name: _nameController.text, duration: _duration, icon: _icon));
    });
    _nameController.clear();
    _duration = Duration(seconds: 0);
    _icon = Icons.fitness_center;
    Navigator.of(context).pop();
  }

  void _showAddExerciseDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Exercise'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Exercise Name'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Duration (seconds)'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (value) {
                  setState(() {
                    _duration = Duration(seconds: int.parse(value));
                  });
                },
              ),
              DropdownButton<IconData>(
                value: _icon,
                onChanged: (IconData? newValue) {
                  setState(() {
                    _icon = newValue!;
                  });
                },
                items: <IconData>[Icons.fitness_center, Icons.bed, Icons.run_circle]
                    .map<DropdownMenuItem<IconData>>((IconData value) {
                  return DropdownMenuItem<IconData>(
                    value: value,
                    child: Icon(value),
                  );
                }).toList(),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: _addExercise,
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToTimer(Exercise exercise) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TimerScreen(exercise: exercise, history: history, onComplete: _markAsCompleted),
      ),
    );
  }

  void _markAsCompleted(Exercise exercise) {
    setState(() {
      exercise.completed = true;
    });
  }

  void _deleteExercise(int index) {
    setState(() {
      history.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('History'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _showAddExerciseDialog,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          final exercise = history[index];
          return Dismissible(
            key: Key(exercise.name),
            background: Container(color: Colors.red),
            onDismissed: (direction) {
              _deleteExercise(index);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${exercise.name} deleted")));
            },
            child: ListTile(
              leading: Icon(exercise.icon, color: exercise.completed ? Colors.grey : Colors.blue),
              title: Text(exercise.name, style: TextStyle(color: Colors.white)),
              subtitle: Text(exercise.duration.toString().substring(2, 7), style: TextStyle(color: Colors.white70)),
              onTap: () => _navigateToTimer(exercise),
            ),
          );
        },
      ),
    );
  }
}

class TimerScreen extends StatefulWidget {
  final Exercise exercise;
  final List<Exercise> history;
  final Function(Exercise) onComplete;

  TimerScreen({required this.exercise, required this.history, required this.onComplete});

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late Duration _duration;
  late Duration _remaining;
  bool _isRunning = false;
  bool _isPaused = false;
  late IconData _playPauseIcon;
  late Stopwatch _stopwatch;

  @override
  void initState() {
    super.initState();
    _duration = widget.exercise.duration;
    _remaining = _duration;
    _playPauseIcon = Icons.play_arrow;
    _stopwatch = Stopwatch();
  }

  void _startPauseTimer() {
    setState(() {
      if (_isRunning) {
        if (_isPaused) {
          _stopwatch.start();
          _playPauseIcon = Icons.pause;
        } else {
          _stopwatch.stop();
          _playPauseIcon = Icons.play_arrow;
        }
        _isPaused = !_isPaused;
      } else {
        _isRunning = true;
        _stopwatch.start();
        _playPauseIcon = Icons.pause;
        _tick();
      }
    });
  }

  void _resetTimer() {
    setState(() {
      _stopwatch.reset();
      _stopwatch.stop();
      _isRunning = false;
      _isPaused = false;
      _remaining = _duration;
      _playPauseIcon = Icons.play_arrow;
    });
  }

  void _tick() {
    if (_stopwatch.isRunning) {
      setState(() {
        _remaining = _duration - Duration(milliseconds: _stopwatch.elapsedMilliseconds);
        if (_remaining <= Duration.zero) {
          _resetTimer();
          widget.onComplete(widget.exercise);
        }
      });
      Future.delayed(Duration(milliseconds: 100), _tick);
    }
  }

  void _deleteCurrentExercise() {
    final index = widget.history.indexOf(widget.exercise);
    if (index != -1) {
      setState(() {
        widget.history.removeAt(index);
      });
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${widget.exercise.name} deleted")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.exercise.name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.exercise.name,
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
            SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SizedBox(
                  width: 300,
                  height: 300,
                  child: CircularProgressIndicator(
                    value: _remaining.inSeconds / _duration.inSeconds,
                    strokeWidth: 10,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    backgroundColor: Colors.grey,
                  ),
                ),
                Text(
                  '${_remaining.inMinutes.toString().padLeft(2, '0')}:${(_remaining.inSeconds % 60).toString().padLeft(2, '0')}',
                  style: TextStyle(fontSize: 48, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.delete),
                  iconSize: 64,
                  onPressed: _deleteCurrentExercise,
                  color: Colors.white,
                ),
                IconButton(
                  icon: Icon(_playPauseIcon),
                  iconSize: 64,
                  onPressed: _startPauseTimer,
                  color: Colors.white,
                ),
                IconButton(
                  icon: Icon(Icons.replay),
                  iconSize: 64,
                  onPressed: _resetTimer,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Exercise {
  final String name;
  final Duration duration;
  final IconData icon;
  bool completed;

  Exercise({required this.name, required this.duration, required this.icon, this.completed = false});
}
