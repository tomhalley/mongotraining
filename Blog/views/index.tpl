<!DOCTYPE html>
<html>
	<head>
		<title>Blog</title>
		<link rel="stylesheet" type="text/css" href="static/main.css" />
	</head>
	<body>
		<header>
			<h1>Mongo Blog Application</h1>
		</header>
		<section id="intro">
			<h2>Introduction</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
		</section>
		<section id="blog">
			<h2>Blog</h2>
			%for post in posts:
				<article>
					<h3>{{post['title']}}</h3>
					<p>{{post['content']}}</p>
					<aside>
						<h3>Comments</h3>
						%for comment in post['comments']:
							<h4>{{comment['author']}} said:<h4>
							<q>{{comment['comment']}}</q>
						%end
					</aside>
				</article>
			%end
		</section>
	</body>
</html>
