const express = require('express')
const app = express()
const cors = require('cors')
require('dotenv').config()
const bodyParser = require('body-parser');


app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use(cors())
app.use(express.static('public'))
app.get('/', (req, res) => {
  res.sendFile(__dirname + '/views/index.html')
});


let users = [];
let exercises = [];

app.post('/api/users', (req, res) => {
    const username = req.body.username;
    const newUser = {
        username: username,
        _id: Date.now().toString()
    };
    users.push(newUser);
    res.json(newUser);
});

app.get('/api/users', (req, res) => {
    res.json(users);
});

app.post('/api/users/:_id/exercises', (req, res) => {
    const { description, duration } = req.body;
    let { date } = req.body;
    if (!date) {
        date = new Date().toDateString();
    } else {
        date = new Date(date).toDateString();
    }
    const exercise = {
        description,
        duration: parseInt(duration),
        date,
        _id: req.params._id
    };
    exercises.push(exercise);
    const user = users.find(user => user._id === req.params._id);
    res.json({
        ...user,
        description: exercise.description,
        duration: exercise.duration,
        date: exercise.date
    });
});

app.get('/api/users/:_id/logs', (req, res) => {
    const { from, to, limit } = req.query;
    const userId = req.params._id;
    const user = users.find(user => user._id === userId);
    let userExercises = exercises.filter(ex => ex._id === userId);

    if (from) {
        const fromDate = new Date(from);
        userExercises = userExercises.filter(ex => new Date(ex.date) >= fromDate);
    }
    if (to) {
        const toDate = new Date(to);
        userExercises = userExercises.filter(ex => new Date(ex.date) <= toDate);
    }
    if (limit) {
        userExercises = userExercises.slice(0, parseInt(limit));
    }

    const result = {
        username: user.username,
        count: userExercises.length,
        _id: userId,
        log: userExercises
    };
    res.json(result);
});


const listener = app.listen(process.env.PORT || 3000, () => {
  console.log('Your app is listening on port ' + listener.address().port)
})
