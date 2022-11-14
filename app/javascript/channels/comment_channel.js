import consumer from "./consumer"

if(location.pathname.match(/\/questions\/\d/)){
  consumer.subscriptions.create({
    channel: "CommentChannel",
    question_id: location.pathname.match(/\d+/)[0]
  }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      const html = `
        <li class="comments_list">
          ${data.comment.message} 
          ${data.comment.user.nickname}
          ${data.comment.created_at}
        </li>`
      const comments = document.getElementById("comments")
      comments.insertAdjacentHTML('beforeend', html)
      const commentForm = document.getElementById("comment-form")
      commentForm.reset();
    }
  })
}

