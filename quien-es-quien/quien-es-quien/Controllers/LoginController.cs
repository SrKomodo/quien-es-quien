﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace quien_es_quien.Controllers {
    public class LoginController : Controller {
        public ActionResult Index(bool err = false) {
            ViewBag.err = err;
            return View();
        }

        public ActionResult Login(string name, string pass) {
            var loggedUser = Models.User.LoginUser(name, pass);
            if (loggedUser == null) {
                Session["User"] = null;
                return RedirectToAction("Index", "Login", new { err = true });
            }
            else {
                Session["User"] = loggedUser;
                return RedirectToAction("Index", "Home");
            }
        }
        public ActionResult Register(bool err = false) {
            ViewBag.err = err;
            return View();
        }
        public ActionResult RegisterUser(string user, string pass) {
            if (user == "" || pass == "" || user == null || pass == null) {
                return RedirectToAction("Register", "Login", new { err = true });
            }
            Models.User.RegisterUser(user, pass, false);
            return RedirectToAction("Index");
        }

        public ActionResult Logout() {
            Session["User"] = null;
            return RedirectToAction("Index", "Home");
        }
    }
}