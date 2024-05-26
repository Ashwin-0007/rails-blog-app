// document.addEventListener("DOMContentLoaded",function(){
//     const form = document.querySelector("#new_comment");
//     form.addEventListener("ajax:succes", function(event){
//         const [data, status, xhr] = event.detail;
//         const commentsDiv = document.querySelector("#comments");
//         commentsDiv.innerHTML += xhr.response;
//         form.reset();
//     });
//     form.addEventListener("ajax:error", function(event){
//         const [data, status, xhr] = event.detail;
//         console.error("Error:", xhr.response);
//     });
// });