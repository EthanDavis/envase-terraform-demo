const port = process.env.PORT || 3000
const express = require('express');
const app = express();


app.get('/health', function (request, response) {
    console.log('Call recieved', request)
    response.status(200).send({
        body: {
            status: 'UP'
        }
    });
});

app.listen(port, function () {
    console.log('Your app is listening on port ' + port);
});
