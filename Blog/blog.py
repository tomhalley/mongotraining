import bottle
from bottle import Bottle, run, route, static_file, view, template, post, request
import pymongo
from pymongo import Connection

connection = Connection('localhost', 27017)
db = connection.test

@bottle.route('/')
def index():
	blog = db.blog
	blog_posts = blog.find()
	return template('views/index.tpl', posts=blog_posts)

@bottle.route('/contact')
def contact():
	return template('views/contact.tpl');

@bottle.route('/static/<filename>', name='static')
def server_static(filename):
	return static_file(filename, root='static')


bottle.run(host='localhost', port=8082)
