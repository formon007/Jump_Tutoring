var express = require('express');
var app = express();
var session = require('express-session');
var conn = require('./dbConfig');
app.set('view engine','ejs');

app.use(session({
    secret: 'yoursecret',
    resave: true,
    saveUninitialized: true
}));

app.use('/public', express.static('public'));

app.use(express.json());
app.use(express.urlencoded({extended:true}));

app.use(function (req, res, next){
    res.locals.isLoggedIn = req.session.loggedin ? true:false;
    res.locals.isAdmin = req.session.isAdmin || false;
    res.locals.username = req.session.username || null;
    next();
});

app.get('/', function (req, res){
    res.render("home", {
        isLoggedIn: req.session.loggedin || false,
        isAdmin: req.session.isAdmin || false,
        currentPage:'home'
   });
});

app.get('/tutors', function (req, res){
    res.render("tutors", {
        isLoggedIn: req.session.loggedin || false,
        isAdmin: req.session.isAdmin || false,
        currentPage: 'tutors'
    });    
});


//access subjects database from sql
app.get('/subjects', function (req, res) {
    

    conn.query("SELECT * FROM subjects", function (err, result) {
        if (err) throw err;
        console.log(result);

        const viewData = {
            subjectsData: result,
            currentPage: 'subjects'
        };

        // Check if the user is logged in and pass the login status to the view
        if (req.session.loggedin) {
            viewData.username = req.session.username;
        }
            res.render("subjects", viewData);
               
    });
});


//access times database from sql
app.get('/times', function (req, res){
    sql = `SELECT time_id, times.subject_id, class_time, subjects.subject FROM times INNER join subjects WHERE times.subject_id = subjects.subject_id`;
    conn.query(sql, function (err, result) {
        if (err) throw err;
        console.log(result);

        res.render("times", {
            timesData: result,
            currentPage: 'times'
        });

       
       
    });
});



//enquiry
app.get('/enquire', function (req, res){
    res.render('enquire', {
        currentPage: 'enquire',
        isLoggedIn: req.session.loggedin || false
    });
    
});


app.post('/enquire', function (req, res, next){


    let sfname = req.body.sfirstname;
    let slname = req.body.slastname;
    let schoolyear = req.body.schoolyear;
    let pname = req.body.parentname;
    let phone = req.body.phonenumber;

    let email = req.body.email;
    let address = req.body.address;
    let type = req.body.typeoftutoring;
    let subjects = req.body.subjects;
    let availability = req.body.availability;

    let prefertime = req.body.prefertime;
    let msg = req.body.message;

    var sql = `INSERT INTO enquire (sfirstname, slastname, schoolyear, parentname, phonenumber, 
    email, address, typeoftutoring, subjects, availability, prefertime, message)
    VALUES ("${sfname}", "${slname}", "${schoolyear}", "${pname}", "${phone}", 
    "${email}", "${address}", "${type}", "${subjects}", "${availability}",
    "${prefertime}", "${msg}")`;

        conn.query(sql, function (err, result){
            if (err) throw err;
            console.log("message received");

            const currentPage = 'enquiresuccess'; 

            if (req.session.loggedId) {
                res.render('enquiresuccess', {
                    username: req.session.username,
                    currentPage: 'enquiresuccess' // Pass currentPage here
                });
            } else {
                res.render("enquiresuccess", {
                    currentPage: 'enquiresuccess' // Pass currentPage here
                });
            }
        });
    });

    app.post('/savecomment', function (req, res) {
        const enquiryId = req.body.enquiry_id;
        const adminComment = req.body.admincomment;
    
        if (!enquiryId || !adminComment) {
            return res.status(400).json({ success: false, message: 'Missing required data' });
        }
    
        const sql = 'UPDATE enquire SET admincomment = ? WHERE id = ?';
        conn.query(sql, [adminComment, enquiryId], function (err, result) {
            if (err) {
                console.error('Error saving comment:', err);
                return res.status(500).json({ success: false, message: 'Database error' });
            }
    
            if (result.affectedRows === 0) {
                return res.status(404).json({ success: false, message: 'Enquiry not found' });
            }
    
            console.log('Comment saved successfully for enquiry ID:', enquiryId);
            res.status(200).json({ success: true, message: 'Comment saved successfully' });
        });
    });
    



app.get('/login', function(req, res){
    res.render("login", {
        currentPage: 'login'
    });
});

app.post('/auth/user', function (req, res){
    let name = req.body.username;
    let password = req.body.password;
    if (name && password) {
        conn.query('SELECT * FROM usertable WHERE username = ? AND password = ?', [name, password],
        function(error, results, fields){
            if (error) throw error;
            if (results.length > 0) {
                req.session.loggedin = true;
                req.session.username = name;
                req.session.userid = results[0].id;
                
                console.log(results[0]);
                res.redirect('/membersonly');
            } else {
                res.send('Incorrect Username and/or Password');
            }
            res.end();
        });
    } else {
        res.send('Please enter Username and Password');
        res.end();
    }
});

app.get('/membersonly', function(req, res, next){
    res.render("membersonly", {
        currentPage: 'membersonly',
        username: req.session.username
    });
      
});

app.get('/register', function (req, res){
    res.render("register",{
        currentPage:'register'
    });
});


//register new users
app.post('/register', function (req, res){
    let fname = req.body.firstname;
    let lname = req.body.lastname;
    let user = req.body.username;
    let password = req.body.password;
    let confirmpass = req.body.confirmpass;
    let email = req.body.email;

    if(password !== confirmpass) {
        res.send("Please enter the same password");
    } else {
        var sql = `INSERT INTO usertable (firstname, lastname, username, password, email) VALUES ("${fname}", "${lname}", "${user}", "${password}", "${email}")`;
        conn.query(sql, function (err, result){
            if (err) throw err;
            console.log("registered successfully");
            res.render("registersuccess",{
                currentPage: "registersuccess"
            });
        });    
}});



app.get('/booking', function (req, res){
    
    res.render("booking", {currentPage: "booking"});
});




app.post('/booking', function (req, res, next){
    let user = req.session.username;
    let time = req.body.time;
    let subjects = req.body.subjects;
    let userid = req.session.userid;
    let date = req.body.date
    
    //checking current date
    const currentDate = new Date();
    const nextDay = new Date(currentDate);
    nextDay.setDate(currentDate.getDate() + 1);

    currentDate.setUTCHours(0,0,0,0);
    nextDay.setDate(0,0,0,0);

    const bookingDate = new Date(date);
    bookingDate.setUTCHours(0,0,0,0);

    if (bookingDate < nextDay) {
        return res.status(400).send('Booking can only be made for tomorrow or later.');
    }


    //checking if the user has already booked the same session
    const checksql = `SELECT * FROM booking 
    WHERE userid = ? AND time = ? AND subjects = ? AND date = ?`;
    conn.query(checksql, [userid, time, subjects, date], function (err, results){
        if (err) {
            console.error('Error checking existing booking:', err);
            return res.status(500).send('Internal server error.');
        }
        if (results.length > 0){
            return res.status(400).send('You have already booked this session.');
        }
    
        //same codes below
    var sql = `INSERT INTO booking (userid, username, time, subjects, date)
    VALUES ("${userid}", "${user}", "${time}", "${subjects}", "${date}")`;

        conn.query(sql, function (err, result){
            if (err) throw err;
            console.log("message received");

            res.render('bookingsuccess', {
                username: req.session.username,
                currentPage: 'bookingsuccess'
            });
        });
    });
});



app.get('/bookingsuccess', function (req, res){
    res.render("bookingsuccess", {
        currentPage: "bookingsuccess"
    });
});



/* this code displays all bookings
app.get('/mybooking', function (req, res){
    conn.query("SELECT * FROM booking", function(err, result) {
        if (err) throw err;
        console.log(result);       
        res.render('mybooking', { bookingData: result });
    });
});
*/

//trying to display only bookings related to the user
app.get('/mybooking', function (req, res, next) {
    let userID = req.session.username;
    console.log("userID:", userID);

    if (req.session.loggedin) {
        conn.query("SELECT * FROM booking WHERE username = ? order by date asc",
        [userID], function (err, result) {
            if (err) throw err;
            console.log(result);
            res.render("mybooking", {
                title: 'My Booking', 
                bookingData: result,
                currentPage: 'mybooking'
            });
        });
    } else {
        res.redirect('/login');
    }
});

app.post('/delete', (req, res) => {
    const bookingId = req.body.booking_id; // Assuming you pass a booking ID in a hidden input

    if (!bookingId) {
        return res.status(400).send('Booking ID is required.');
    }

   
    const sql = 'DELETE FROM booking WHERE id = ? AND date > CURDATE()';
    conn.query(sql, [bookingId], (err, result) => {
        if (err) {
            console.error('Error deleting booking:', err);
            return res.status(500).send('An error occurred while deleting the booking.');
        }

        if(result.affectedRows === 0) {
            return res.status(400).send('Cannot delete past bookings.');
        }
        console.log('Booking deleted with ID:', bookingId);
            res.redirect('/mybooking');
        
    });
});


//delete from admin view all booking
app.post('/delete/admin', (req, res) => {
    const bookingId = req.body.booking_id; // Assuming you pass a booking ID in a hidden input

    if (!bookingId) {
        return res.status(600).send('Booking ID is required.');
    }
  
    console.log(bookingId) //issue with id
    const sql = 'DELETE FROM booking WHERE id = ? AND date > CURDATE()';
    
    conn.query(sql, [bookingId], (err, result) => {
        if (err) {
            console.error('Error deleting booking:', err);
            return res.status(700).send('An error occurred while deleting the booking.');
        }
        console.log(sql);
        if(result.affectedRows === 0) {
            return res.status(600).send('Cannot delete past bookings.');
        }
        console.log('Booking deleted with ID:', bookingId);
            res.redirect('/viewallbooking');
        
    });
});






app.get('/admin', function (req, res){
    res.render("admin", {currentPage: "admin"});
});


app.post('/auth/admin', function (req, res){
    let adminname = req.body.adminname;
    let password = req.body.password;
    if (adminname && password) {
        conn.query('SELECT * FROM admin WHERE adminname = ? AND password = ?', [adminname, password],
        function(error, results, fields){
            if (error) throw error;
            if (results.length > 0) {
                req.session.loggedin = true;
                req.session.isAdmin = true;
                req.session.username = adminname;
                req.session.userid = results[0].id;
                console.log(results[0]);
                res.redirect('/admindashboard');
            } else {
                res.send('Incorrect Admin Name and/or Password');
            }
            res.end();
        });
    } else {
        res.send('Please enter Admin Name and Password');
        res.end();
    }
});



app.get('/admindashboard', function(req, res, next){
    if (req.session.loggedin){
        res.render("admindashboard", {
            currentPage: "admin",
            adminname:req.session.username});
    } else {
        res.render("Please login to view this page.");
    }    
});




app.get('/logout', function(req, res) {
    req.session.destroy();
    res.redirect("/");
});



/* extracting all booking but now showing username
app.get('/viewallbooking', function (req, res){
    conn.query("SELECT * FROM booking", function(err, result) {
        if (err) throw err;
        console.log(result);       
        res.render('viewallbooking', { bookingData: result });
    });
});
*/

app.get('/viewallbooking', function (req, res){
    sql=`SELECT booking.id, booking.username, time,  date, booking.subjects, userid 
    FROM usertable 
    INNER JOIN booking WHERE usertable.id=booking.userid
    order by booking.date asc`
    conn.query(sql, function(err, result) {
        if (err) throw err;
        console.log(result);       
        res.render('viewallbooking', { 
            currentPage: 'viewallbooking',
            bookingData: result });
    });
});


app.get('/viewallenquiry', function (req, res){
    conn.query("SELECT * FROM enquire", function(err, result) {
        if (err) throw err;
        console.log(result);       
        res.render('viewallenquiry', {
            currentPage: 'viewallenquiry',
             enquireData: result });
    });
});





    





app.listen(8000);
console.log('Node app is running on port 8000');