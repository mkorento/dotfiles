#!/usr/bin/env python
import os

def get_password(id=""):
    return os.popen("~/cred/get-password %s" % id).readline()

def get_user(id=""):
    return os.popen("~/cred/get-user %s" % id).readline()
