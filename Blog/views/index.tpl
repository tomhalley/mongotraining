<!DOCTYPE html>
<html>
	<head>
		<title>Blog</title>
		<link rel="stylesheet" type="text/css" href="static/main.css" />
		<script type="text/javascript" src="static/jquery-1.8.2.min.js"></script>
		<script type="text/javascript">
			function showCommentForm(id, sender) {
				$("#" + id).show();
				$(sender).hide();
			}

			function hideCommentForm(id) {

			}
	
			$(function() {

			});
		</script>
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
					<h3>Comments</h3>
					%for comment in post['comments']:
					<aside>
						<h4>{{comment['author']}} said:<h4>
						<q>{{comment['comment']}}</q>
					</aside>
					%end
					<a class="show_comment" onclick="showCommentForm('{{post['_id']}}', this);" href="javascript:void(0);">Leave a comment...</a>
					<form action="/comment" method="POST">
						<fieldset id="{{post['_id']}}">
							<legend>Post a comment</legend>
							
							<input type="hidden" name="_id" value="{{post['_id']}}" />

							<label for="name">Name:</label>
							<input type="text" name="name" id="name" />
							
							<label for="email">Email:</label>
							<input type="text" name="email" id="email" />

							<label for="comment">Comment:</label>
							<textarea name="comment" id="comment"></textarea>

							<div class="buttons">
								<input type="submit" value="Submit" />
								<input type="button" onclick="hideCommentForm('{{post['_id']}}');" value="Cancel">
							</div>
						</fieldset>
					</form>
				</article>
			%end
		</section>
	</body>
</html>
