#include <includes/credentials.py>


import bottle
from bottle import route, request, static_file, template, view
import pymongo
from pymongo import Connection

connection = Connection('localhost', 27017)
db = connection.test

@route('/')
@view('views/index.tpl')
def index():
	blog = db.blog
	return dict(posts=blog.find())

@route('/get_blog_posts')
def get_blog():
	blog = db.blog
	return dict(posts=blog.find())

@route('/comment', method='POST')
def submit_comment():
	return index()



@route('/contact')
@view('views/contact.tpl')
def contact():
	return "Thanks!"



@route('/static/<filename>', name='static')
def server_static(filename):
	return static_file(filename, root='static')




bottle.run(host='localhost', port=8080)