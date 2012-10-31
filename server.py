#include <includes/credentials.py>
#include <includes/mongo_encoder.py>

import bottle
from bottle import route, static_file, view
from includes.mongo_encoder import MongoEncoder
import json
from pymongo import Connection

connection = Connection('localhost', 27017)
db = connection.test

@route('/')
@view('views/index.tpl')
def index():
	blog = db.blog
	return dict(posts=blog.find())


@route('/get_posts')
def get_posts():
	blog = db.blog
	posts=blog.find()
	output = list(posts)
	return json.dumps(output, cls=MongoEncoder)


@route('/comment', method='POST')
def submit_comment():
	return index()


@route('/comment', method='POST')
def submit_comment():
	return "Thanks!";


@route('/contact')
@view('views/contact.tpl')
def contact():
	return "Thanks!"


@route('/static/<filename>', name='static')
def server_static(filename):
	return static_file(filename, root='static')



bottle.run(host='localhost', port=8080, debug=True)