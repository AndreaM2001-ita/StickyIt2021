const app=require('./app');
const db=require('./config/db.js');
const UserModel=require('./model/user.model.js');
const PictureModel=require('./model/picture.model.js');

var multer = require('multer');// Multer to upload the photo on the server side.

app.get('/', function (req, res) {
    res.send("Helloworld ciao ");
  });

const port =3000;
app.listen(port, ()=>{
    console.log(`Serving on port http://localhost:${port}`);
})