function BlogViewModel() {
	this.posts = ko.observableArray();

	this.getPosts = function() {
			
	};
}

ko.applyBindings(new BlogViewModel());
