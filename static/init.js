function BlogComment( commentIn ) {
	var self = this;
	this.author = commentIn.author;
	this.email = commentIn.email;
	this.comment = commentIn.comment;
	this.date_posted = commentIn.date_posted;
}

function BlogPost( postIn ) {
	var self = this;
	this.id = postIn._id;
	this.title = postIn.title;
	this.content = postIn.content;
	this.date_posted = postIn.date_posted;
	this.comments = ko.observableArray();
	this.commentsVisible = ko.observable(false);
	
	this.toggleComments = function() {
		if(self.commentsVisible == true) {
			console.log("comments are visible");
			self.commentsVisible(false);
		} else {
			console.log("comments aren't visible");
			self.commentsVisible(true);
		}
	}

	this.populateComments = function(commentsIn) {
		for(var i = 0; i < commentsIn.length; i++) {
			self.comments.push(new BlogComment(commentsIn[i]));
		}
	}

	self.populateComments(postIn.comments);
}

function BlogViewModel() {
	var self = this;
	this.posts = ko.observableArray();

	this.getPosts = function() {
        $.ajax({
            url: "get_posts",
            dataType: "json",
            success: function( data ) {
				for(var i = 0; i < data.length; i++) {
					self.posts.push(new BlogPost(data[i]));
				}
            }
        })
	};
    
    this.getPosts();
}

ko.applyBindings(new BlogViewModel());
