Event.observe(window, "load", function() {
  Event.observe("new_comment", "submit", function(evt) {
    var comment = $("comment_body").value;
    new Ajax.Request('<%= post_comments_url(@post) %>', {
      asynchronous: true, 
      evalScripts: false, 
      parameters: Form.serialize(form),
      onSuccess: function(response) {
        $("comments").insert({
          bottom: "<p>" + comment + "#{responseText}</p><hr/>";
        });
      },
    });
    Event.stop(evt);
  });
});
