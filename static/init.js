function BlogViewModel() {
	this.posts = ko.observableArray();

	this.getPosts = function() {
        $.ajax({
            url: "get_posts",
            dataType: "json",
            success: function( data ) {
                self.posts = data;
            }
        })
	};
    
    this.showComments = function() {
        console.log("showing");
    }
    
    this.hideComments = function() {
        console.log("hidden");
    }
    
    this.getPosts();
}

ko.applyBindings(new BlogViewModel());