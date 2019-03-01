$('#abc').click(()=>{
  alert('C');
  if($('#user_email').val() !=  "" && $('#user_username').val() !=  "") 
    $('#saveUser').attr('disabled', false);  
});
