$(function(){
console.log('S')
document.getElementById('submit').disabled = true;
});
function validateform(){
    var check1 = document.getElementById('verification_check1').val;
    var check2 = document.getElementById('verification_check2').value;
    var remarks= document.getElementById('verification_remarks').value;
    if (!check1 && !check2 && remarks == ""){
        
    }else{
        document.getElementById('submit').disabled = false;
    }
}