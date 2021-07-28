# importing packages
from os import access, name
from project.auth import is_admin
from project import userDetails, bcrypt
from flask import Blueprint, render_template, url_for, redirect, request, flash
from wtforms import StringField, PasswordField, SubmitField, ValidationError
from flask_wtf import FlaskForm
from wtforms.validators import DataRequired, Email
from flask_login import login_user, login_required, logout_user, current_user
from functools import wraps
from project.database import dbs, mycursor
from project.utils import getSingleUser
import asyncio


# blueprint of the addduser which needs to be imported to __init__.py
addusers = Blueprint("addusers", __name__, template_folder='templates')

# route for login


@addusers.route("/adduser", methods=["GET", "POST"])
@login_required
@is_admin
def adduser():
    msg = ''

    # when user gave username and password
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        # uid=request.form['uid']
        password = bcrypt.generate_password_hash(
            password=request.form['password'])
        type = request.form['type']

        # check if user already exist
        if len(getSingleUser(email)) != 0:
            msg = "user already exist"
            return redirect(url_for('users'))

        else:
            mycursor.execute(
                "INSERT INTO user_details (name, email, password,type) VALUES (%s,%s,%s,%s)", (name, email, password, type))
            dbs.commit()
            l_id = mycursor.lastrowid
            admin = 0
            architect = 0
            operations = 0
            if type == 'admin':
                admin = 1
                architect = 1
                operations = 1
            if type == 'architect':
                architect = 1
            if type == 'operations':
                operations = 1
            mycursor.execute(
                "INSERT INTO page_access (uid,admin,architect,operations) VALUES (%s,%s,%s,%s)", (l_id, admin, architect, operations))
            dbs.commit()

    else:
        # Account doesnt exist or username/password incorrect
        msg = 'Incorrect username/password!'

    # Show the login form with message (if any)
    return redirect(url_for("users"))
