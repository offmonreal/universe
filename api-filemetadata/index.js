var express = require('express');
var cors = require('cors');
var multer = require('multer');
require('dotenv').config()

var app = express();
var upload = multer({ dest: 'uploads/' }) // папка для сохранения файлов

app.use(cors());
app.use('/public', express.static(process.cwd() + '/public'));

app.get('/', function (req, res) {
    res.sendFile(process.cwd() + '/views/index.html');
});

// Маршрут для загрузки файла
app.post('/api/fileanalyse', upload.single('upfile'), function(req, res) {
    const file = req.file;
    if (!file) {
        return res.status(400).send('No file uploaded.');
    }
    res.json({
        name: file.originalname,
        type: file.mimetype,
        size: file.size
    });
});

const port = process.env.PORT || 3000;
app.listen(port, function () {
    console.log('Your app is listening on port ' + port)
});
