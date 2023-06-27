const express = require("express");
const mongoose = require("mongoose");
const User = require("../models/user.model");

const router = express.Router();

// router.get("/", (req, res) => {
//   console.log("Hello World");
// });

router.post("/signup", (req, res) => {

  User.findOne({ email: req.body.email })
    .then((user) => {
      console.log(req.body.email)
      if (user == null) {
        const user = new User({
          email: req.body.email,
          password: req.body.password,
        });
        return user.save();
      } else {
        throw new Error("Email is not available");
      }
    }).then(savedUser => {
      res.json(savedUser);
    })
    .catch((error) => {
      console.log(error);
      res.json({ error: error.message });
    });
});

router.post("/signin", (req, res) => {
  User.findOne({ email: req.body.email, password: req.body.password })
    .then((user) => {
      if (user) {
        res.json(user);
      } else {
        res.json({
          message: "Invalid email or password",
        });
      }
    })
    .catch((error) => {
      console.log(error);
      res.json({ error: error.message });
    });
});

module.exports = router;
